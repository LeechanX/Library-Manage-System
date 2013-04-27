package dao.impl;

import java.util.List;

import java.util.Collections;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import dao.NewsDAO;
import entity.News;

public class NewsDAOImpl implements NewsDAO {

	SessionFactory sessionFactory = 
		new Configuration().configure().buildSessionFactory(); 
	Session session = sessionFactory.openSession();
	
	public void AddNews(News news) {
		session.beginTransaction();
		session.save(news);
		session.getTransaction().commit(); 
		session.close();
	}
	
	@SuppressWarnings("unchecked")
	public List<News> QueryAllNews() {
		session.beginTransaction();
		List <News> newslist=session.createQuery("from News n").list();
		session.getTransaction().commit(); 
		session.close();
		Collections.reverse(newslist);
		return newslist;
	}

	
	@SuppressWarnings("unchecked")
	public News ReadNews(String time) {
		session.beginTransaction();
		News news=null;
		String hql="from News n where n.time = ?";
        List<News> newses=session.createQuery(hql).setParameter(0, time).list();
        if(newses.size()!=0){
        	news=newses.get(0);
        }
		session.getTransaction().commit(); 
		session.close();
		return news;
	}

}
