package dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import entity.Reader;
import dao.ReaderDAO;
import org.hibernate.cfg.Configuration;

public class ReaderDAOImpl implements ReaderDAO{

	SessionFactory sessionFactory = 
		new Configuration().configure().buildSessionFactory(); 
	//获取Session实例
	Session session = sessionFactory.openSession();
	
	@SuppressWarnings("unchecked")
	public Reader QueryReader(String readerid){
		session.beginTransaction();
		Reader reader=null;
		String hql="from Reader r where r.readerid = ?";
        List<Reader> readers=session.createQuery(hql).setParameter(0, readerid).list();
        if(readers.size()!=0){
        	reader=readers.get(0);
        }
		session.getTransaction().commit(); 
		session.close();
		return reader;		
	}
	
	@SuppressWarnings("unchecked")
	public List <Reader> QueryReaders(String readerid,String readername){
		session.beginTransaction();
		String hql="from Reader r where r.readerid like '%"+readerid+"%' and r.readername like '%"+readername+"%'"; 
		List<Reader> rList=session.createQuery(hql).list();
		session.getTransaction().commit(); 
		session.close();
		return rList;		
	}
	
	public void DeleteReader(String readerid){
		session.beginTransaction();
		Reader reader=(Reader) session.load(Reader.class, readerid);
		session.delete(reader);
		session.getTransaction().commit(); 
		session.close();
	}
	
	public void AddReader(Reader reader){
		session.beginTransaction();
		session.save(reader);
		session.getTransaction().commit(); 
		session.close();
	}
	
	public void UpdateReader(Reader reader){
		session.beginTransaction();
		Reader tmpReader = (Reader)session.load(Reader.class, reader.getReaderid());
		tmpReader.setPassword(reader.getPassword());
		tmpReader.setTelephone(reader.getTelephone());
		tmpReader.setEmail(reader.getEmail());
		session.update(tmpReader);
		session.getTransaction().commit(); 
		session.close();
	}
	
}
