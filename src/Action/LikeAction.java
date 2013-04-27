package Action;

import java.io.IOException;

import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;


import org.apache.struts2.ServletActionContext;


import com.opensymphony.xwork2.ActionSupport;

import entity.DetailedLike;
import entity.Like;

import dao.LikeDAO;
import dao.impl.LikeDAOImpl;

public class LikeAction extends ActionSupport{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	Like like;
	LikeDAO likedao=new LikeDAOImpl();
	
	public Like getLike() {
		return like;
	}

	public void setLike(Like like) {
		this.like = like;
	}
   
	HttpServletRequest request=ServletActionContext.getRequest();

	public String showlikelist(){
		List<DetailedLike> likelist=likedao.showlikelist(like.getReaderid());
		request.setAttribute("likelist", likelist);
		return SUCCESS;
	}
	
	public void deletelike() throws ParseException, IOException{
		ServletActionContext.getResponse().setContentType("text/html");
		ServletActionContext.getResponse().setCharacterEncoding("utf-8");
		likedao.DelLike(like.getTableid());
		ServletActionContext.getResponse().getWriter().println("删除成功!");
	}
	public void addlike() throws IOException{
		ServletActionContext.getResponse().setContentType("text/html");
		ServletActionContext.getResponse().setCharacterEncoding("utf-8");
		String message="";
		if(like.getReaderid().equals("")){
			message="请先登录！";
		}else{
			message=likedao.AddLike(like.getBookid(),like.getReaderid());
		}
		ServletActionContext.getResponse().getWriter().println(message);
	}
	
}

