package dao;

import java.util.List;

import entity.DetailedLike;


public interface LikeDAO {
	
	public String AddLike(String bookid,String readerid);
	public void DelLike(int tableid);
	public List<DetailedLike> showlikelist(String readerid);
}
