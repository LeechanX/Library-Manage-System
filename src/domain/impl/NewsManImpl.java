package domain.impl;

import java.util.List;

import domain.NewsMan;
import entity.News;

import dao.NewsDAO;
import dao.impl.NewsDAOImpl;

public class NewsManImpl implements NewsMan {

	NewsDAO newsdao=new NewsDAOImpl();
	
	public void AddNews(News news) {
		newsdao.AddNews(news);
	}

	public List<News> QueryAllNews() {
		return newsdao.QueryAllNews();
	}

	public News ReadNews(String time) {
		return newsdao.ReadNews(time);
	}

}
