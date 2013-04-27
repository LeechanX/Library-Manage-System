package Action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import domain.BookAddUpdDel;
import domain.BookQuery;
import domain.impl.BookAddUpdDelImpl;
import domain.impl.BookQueryImpl;

import entity.Book;
import entity.DetailedBook;
import entity.WelcomedBook;
public class BookAction extends ActionSupport {
	
	private static final long serialVersionUID = 1L;
	
	String bookcaseSelect="";
	String typeSelect="";
	String type2Select="";
	int stock;
	String publisher="";
	String author;		
	String bookinf;
	String booktype;
	
	public String getBookinf() {
		return bookinf;
	}
	public void setBookinf(String bookinf) {
		this.bookinf = bookinf;
	}
	public String getBooktype() {
		return booktype;
	}
	public void setBooktype(String booktype) {
		this.booktype = booktype;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getBookcaseSelect() {
		return bookcaseSelect;
	}
	public void setBookcaseSelect(String bookcaseSelect) {
		this.bookcaseSelect = bookcaseSelect;
	}
	public String getTypeSelect() {
		return typeSelect;
	}
	public void setTypeSelect(String typeSelect) {
		this.typeSelect = typeSelect;
	}
	public String getType2Select() {
		return type2Select;
	}
	public void setType2Select(String type2Select) {
		this.type2Select = type2Select;
	}

	Book book =new DetailedBook();
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	
	Book briefbook =new Book();

	public Book getBriefbook() {
		return briefbook;
	}
	public void setBriefbook(Book briefbook) {
		this.briefbook = briefbook;
	}

	HttpServletRequest request=ServletActionContext.getRequest();
	BookQuery bookquery=new BookQueryImpl();
	BookAddUpdDel bookaud=new BookAddUpdDelImpl();
	
	public String bookinf(){

		DetailedBook newbook=bookquery.QueryBook(book.getId());
		if(newbook.getId()==null){
		}else{
		request.setAttribute("thisbook",newbook);
		}
		return SUCCESS;
	}
	
	public String bookmanagequery(){
		List<?> managingbooks=bookquery.SearchBooks(book.id, book.name, book.publisher, book.author);
		request.setAttribute("managingbooks", managingbooks);
		return SUCCESS;
	}
	
	public void deletebook() throws IOException, SQLException{
		ServletActionContext.getResponse().setContentType("text/html");
		ServletActionContext.getResponse().setCharacterEncoding("utf-8");
		bookaud.DeleteBook(request.getParameter("dellist"));
		ServletActionContext.getResponse().getWriter().println("删除成功!");
	}
	
	public String toeditbook() throws SQLException{
		select.DoubleSelect ts=new select.DoubleSelect();
		ts.doubleselect();
		Book editthisbook=bookquery.SearchBook(book.id);
		setTypeSelect(editthisbook.type);
		setType2Select(String.valueOf(editthisbook.type2));
		setBookcaseSelect(editthisbook.bookcaseid);
		setStock(editthisbook.stock);
		setAuthor(editthisbook.author);
		setPublisher(editthisbook.publisher);
		request.setAttribute("editthisbook", editthisbook);
		return SUCCESS;
	}

	public void updateedit() throws IOException, SQLException{
		ServletActionContext.getResponse().setContentType("text/html");
		ServletActionContext.getResponse().setCharacterEncoding("utf-8");
		bookaud.UpdateBook(briefbook);
		ServletActionContext.getResponse().getWriter().println("修改成功!");
	}
	
	public String queryBook(){
		int type2=-2;
		if(booktype.equals("")){
			type2=-1;
		}else if(booktype.equals("科技")||booktype.equals("文学")||
			booktype.equals("杂志")||booktype.equals("工具书")||booktype.equals("其他")){
			type2=0;
		}else{
			if(booktype.equals("建筑") ||booktype.equals("小说")||booktype.equals("字典")||booktype.equals("月刊")||booktype.equals("画册")){
		        	 type2=1;
		        	 if(booktype.equals("建筑")){booktype="科技";}
		        	 else if(booktype.equals("小说")){booktype="文学";}
		        	 else if(booktype.equals("月刊")){booktype="杂志";}
		        	 else if(booktype.equals("字典")){booktype="工具书";}
		        	 else if(booktype.equals("画册")){booktype="其他";}
		         }else if(booktype.equals("计算机") ||booktype.equals("散文")||booktype.equals("期刊")||booktype.equals("词汇")||booktype.equals("书法")){
		        	 type2=2;
		        	 if(booktype.equals("计算机")){booktype="科技";}
		        	 else if(booktype.equals("散文")){booktype="文学";}
		        	 else if(booktype.equals("期刊")){booktype="杂志";}
		        	 else if(booktype.equals("词汇")){booktype="工具书";}
		        	 else if(booktype.equals("书法")){booktype="其他";}
		         }else if(booktype.equals("机械")||booktype.equals("传记")||booktype.equals("周报")||booktype.equals("其余")){
		        	 if(booktype.equals("机械")){booktype="科技";}
		        	 else if(booktype.equals("传记")){booktype="文学";}
		        	 else if(booktype.equals("周报")){booktype="杂志";}
		        	 else if(booktype.equals("其余")){booktype="其他";}
		        	 type2=3;
		         }else if(booktype.equals("电气")){
		        	 booktype="科技";
		        	 type2=4;
		         }else if(booktype.equals("土木")){
		        	 booktype="科技";
		        	 type2=5;
		         }else if(booktype.equals("热能")){
		        	 booktype="科技";
		        	 type2=6;
		         }else if(booktype.equals("航天")){
		        	 booktype="科技";
		        	 type2=7;
		         }
		}
		List<Book> list=bookquery.QueryBooks(bookinf,booktype,type2);
		request.setAttribute("queryList", list);
		return SUCCESS;
	}
	
	public void addBook() throws SQLException, IOException{
		if(briefbook.publish_time!=null){
			if(briefbook.publish_time.length()==10){
				String year=briefbook.publish_time.substring(6, 10);;
				String month=briefbook.publish_time.substring(3, 5);
				String day=briefbook.publish_time.substring(0,2);
				briefbook.publish_time=year+"-"+day+"-"+month;
			}
		}

		HttpSession session = request.getSession();
		if(session.getAttribute("bookuri")!=null){
			briefbook.bookpic=(String) session.getAttribute("bookuri");
			session.removeAttribute("bookuri"); 
		}else{
			briefbook.bookpic=null;
		}
		ServletActionContext.getResponse().setContentType("text/html");
		ServletActionContext.getResponse().setCharacterEncoding("utf-8");
		bookaud.AddBook(briefbook);
		ServletActionContext.getResponse().getWriter().println("图书添加成功！");
	}
	
	public String topten() throws SQLException{
		List <WelcomedBook> list=bookquery.QueryTop10();
		request.setAttribute("toptenbook", list);
		return SUCCESS;
	}

}
