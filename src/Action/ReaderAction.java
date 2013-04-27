package Action;

import entity.Reader;
import domain.impl.ReaderQueryImpl;
import domain.impl.ReaderUpdateOrDeleteImpl;
import domain.ReaderQuery;
import domain.ReaderUpdateOrDelete;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import domain.ReaderRegister;
import domain.impl.ReaderRegisterImpl;;
public class ReaderAction extends ActionSupport{

	private static final long serialVersionUID = 1L;
	private ReaderUpdateOrDelete readerUD=new ReaderUpdateOrDeleteImpl();
	private ReaderQuery readerQ= new ReaderQueryImpl();
    Reader reader;
    
	public Reader getReader() {
		return reader;
	}

	public void setReader(Reader reader) {
		this.reader = reader;
	}

	HttpServletRequest request=ServletActionContext.getRequest();

	public String register(){
		ReaderRegister readerregister=new ReaderRegisterImpl();
		readerregister.Register(reader);
		ReaderLoginAction readerlogin=new ReaderLoginAction();
		return readerlogin.login();
	}

	public String check() throws IOException{     
		ServletActionContext.getResponse().setContentType("text/html");
		ServletActionContext.getResponse().setCharacterEncoding("utf-8");	
		ServletActionContext.getResponse().getWriter().print(readerQ.ifReader_Exist(reader.readerid));		
		ServletActionContext.getResponse().getWriter().flush();
		ServletActionContext.getResponse().getWriter().close();
		return null;
	}
	
	public String exit(){
		HttpSession session = request.getSession(); 
		session.setAttribute("rdrid", null);
		return SUCCESS;
	}
	
	public String query(){
		List<Reader> readers=readerQ.QueryReaders(reader.getReaderid(), reader.getReadername());
		request.setAttribute("readers",readers);
		return SUCCESS;
	}

	public void delete() throws IOException{
		readerUD.DeleteReader(reader.readerid);
		ServletActionContext.getResponse().setContentType("text/html");
		ServletActionContext.getResponse().setCharacterEncoding("utf-8");
		ServletActionContext.getResponse().getWriter().println("删除已成功!");
		ServletActionContext.getResponse().getWriter().flush();
		ServletActionContext.getResponse().getWriter().close();
	}
	
	public void update() throws IOException{
		readerUD.UpdateReader(reader);
		ServletActionContext.getResponse().setContentType("text/html");
		ServletActionContext.getResponse().setCharacterEncoding("utf-8");
		ServletActionContext.getResponse().getWriter().println("<h3>修改成功!</h3>");
		ServletActionContext.getResponse().getWriter().flush();
		ServletActionContext.getResponse().getWriter().close();
	}
	
	public String getInfo(){
		Reader thisreader=readerQ.QueryThisReader(reader.getReaderid());
		request.setAttribute("pro", thisreader);
		return SUCCESS;
	}
}
