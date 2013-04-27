package domain;

import java.util.List;
import entity.News;

public interface NewsMan {
	
	public List<News> QueryAllNews();
	
	public News ReadNews(String time);
	
	public void AddNews(News news);
}
