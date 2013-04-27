package Invocation;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;


public class LoginInvocation extends MethodFilterInterceptor{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public final static String SESSION_KEY="regUserId";
	public final static String GOTO_URL_KEY="GOING_TO";  

	protected String doIntercept(ActionInvocation invocation) throws Exception {
		HttpServletRequest request=ServletActionContext.getRequest();   

		HttpSession session=request.getSession();   
		setToGoingURL(request, session, invocation); 
		if(session!=null && session.getAttribute("rdrid")!=null) {  
			return invocation.invoke();   
		}   
		return Action.ReaderAction.LOGIN;   
	}
	private void setToGoingURL(HttpServletRequest request,HttpSession session,ActionInvocation invocation)   
	{   
		String url=request.getHeader("referer");  
		session.setAttribute(GOTO_URL_KEY, url);   
	}

}
