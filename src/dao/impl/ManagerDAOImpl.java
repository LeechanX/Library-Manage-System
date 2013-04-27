package dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import dao.ManagerDAO;
import entity.Manager;

public class ManagerDAOImpl implements ManagerDAO{


	SessionFactory sessionFactory = 
		new Configuration().configure().buildSessionFactory(); 
	Session session = sessionFactory.openSession();
	
	@SuppressWarnings("unchecked")
	public Manager Login(String mid, String password) {
		session.beginTransaction();
		Manager manager=null;
		String hql="from Manager m where m.id = ?";
        List<Manager> managers=session.createQuery(hql).setParameter(0, mid).list();
        if(managers.size()!=0){
        	manager=managers.get(0);
        	if(manager.getPassword().equals(password)){
        		return manager;
        	}
        }
		session.getTransaction().commit(); 
		session.close();
		return null;		
	}

}
