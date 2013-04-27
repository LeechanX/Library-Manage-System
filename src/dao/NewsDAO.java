package dao;

import entity.News;

import java.util.List;

public interface NewsDAO {
	
	public List <News> QueryAllNews();
	
	public News ReadNews(String time);
	
	public void AddNews(News news);

}
