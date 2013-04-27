package Action;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import domain.BookQuery;
import domain.ReaderQuery;
import domain.impl.BookQueryImpl;
import domain.impl.ReaderQueryImpl;

import entity.Borrow;
import entity.DetailedBook;
import entity.Reader;
import domain.HandleBorrow;
import domain.impl.HandleBorrowImpl;
public class BorrowAction extends ActionSupport{

	ReaderQuery readerQ= new ReaderQueryImpl();
	
	HandleBorrow handleb=new HandleBorrowImpl();
	
	private static final long serialVersionUID = 1L;
	Borrow borrow=new Borrow();
	BookQuery bookquery=new BookQueryImpl();
	HttpServletRequest request=ServletActionContext.getRequest();

	public Borrow getBorrow() {
		return borrow;
	}
	public void setBorrow(Borrow borrow) {
		this.borrow = borrow;
	}
	
	public String showborrow(){
		List<Borrow> borrowlist=handleb.borrowList(borrow.readerid);
		request.setAttribute("borrowlist", borrowlist);
		return SUCCESS;
	}
	
	public String beginborrow(){ 
		
		DetailedBook newbook=bookquery.QueryBook(borrow.bookid);
		if(newbook.id==null){
		}else{
		request.setAttribute("borrowbook",newbook);
		}
		Reader myreader=readerQ.QueryThisReader(borrow.getReaderid());
		if(myreader.readerid==null){
		}else{
		request.setAttribute("borrowreader",myreader);
		}
		return SUCCESS;
	}
	
	public String borrow(){
		handleb.BorrowOut(borrow.readerid, borrow.bookid);
		return null;
	}
	public String continueBorrow() throws ParseException, IOException{
		String newdate=handleb.ContinueBorrow(borrow.borrow_time,borrow.id);
		ServletActionContext.getResponse().setContentType("text/html");
		ServletActionContext.getResponse().setCharacterEncoding("utf-8");
	    ServletActionContext.getResponse().getWriter().println(newdate);
		return null;
	}
	
	public String queryBack(){
		List<Borrow> blist=handleb.borrowList(borrow.readerid);
		request.setAttribute("borrowedbooks",blist);
		return SUCCESS;
	}
	
	public String bookback() throws IOException{
		handleb.Back(borrow.id);
		ServletActionContext.getResponse().setContentType("text/html");
		ServletActionContext.getResponse().setCharacterEncoding("utf-8");
	    ServletActionContext.getResponse().getWriter().println("归还成功!");
		return null;
	}
	
}
