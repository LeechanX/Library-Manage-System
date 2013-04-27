package Action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import entity.Reader;
import domain.ReaderLogin;
import domain.impl.ReaderLoginImpl;

public class ReaderLoginAction extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ReaderLogin readerlogin=new ReaderLoginImpl();

	public ReaderLogin getReaderlogin() {
		return readerlogin;
	}

	public void setReaderlogin(ReaderLogin readerlogin) {
		this.readerlogin = readerlogin;
	}

	private Reader reader;

	public String url;
	
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Reader getReader() {
		return reader;
	}

	public void setReader(Reader reader) {
		this.reader = reader;
	}
	
	HttpServletRequest request=ServletActionContext.getRequest();
	public String login(){
		HttpSession session=request.getSession();		
		if(readerlogin.login(reader)){
			url=request.getHeader("referer"); 
			if(url.endsWith(".jsp")){
			}else{
				if(url.indexOf("showborrowlist.action")!=-1){
					url="showborrowlist.action?borrow.readerid="+reader.getReaderid();
				}
				else if(url.indexOf("showlikelist.action")!=-1){
					url="showlikelist.action?like.readerid="+reader.getReaderid();
				}
			}
			session.setAttribute("rdrid", reader.getReaderid());
			return SUCCESS;
		}
		session.setAttribute("Error", "错误的用户名和密码！");
		return ERROR;
	}
}


