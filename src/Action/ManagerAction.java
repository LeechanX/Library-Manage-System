package Action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import entity.Manager;
import dao.ManagerDAO;
import dao.impl.ManagerDAOImpl;
public class ManagerAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	Manager manager;

	public Manager getManager() {
		return manager;
	}

	public void setManager(Manager manager) {
		this.manager = manager;
	}
	HttpServletRequest request=ServletActionContext.getRequest();

	ManagerDAO mandao=new ManagerDAOImpl();

	public String login(){
		HttpSession session = request.getSession(); 

		Manager man=mandao.Login(manager.getId(), manager.getPassword());
		if(man!=null){
			session.setAttribute("mgrid", manager.id);
			return SUCCESS;
		}
		request.setAttribute("Error", "错误的用户名和密码！");
		return ERROR;

	}
	public String exit(){
		HttpSession session = request.getSession(); 
		session.setAttribute("mgr", null);
		return SUCCESS;
	}
}
