package dao.impl;

import dao.BookDAO;
import entity.Book;
import entity.DetailedBook;
import entity.WelcomedBook;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.transform.Transformers;

public class BookDAOImpl implements BookDAO {

	SessionFactory sessionFactory = 
		new Configuration().configure().buildSessionFactory(); 
	Session session = sessionFactory.openSession();

	@SuppressWarnings("unchecked")
	public List <Book> QueryBooks(String hql){
		session.beginTransaction();
		List <Book> books=session.createQuery(hql).list();
		session.getTransaction().commit(); 
		session.close();	
		for(Book book:books){
			if(book.getBookpic()!=null){
				if(book.getBookpic().length()>4)
					book.setBookpic(book.getBookpic().substring(54));
			}
		}
		return books;
	}

	public void AddBook(Book book){
		session.beginTransaction();
		session.save(book);
		session.getTransaction().commit(); 
		session.close();
	}

	@SuppressWarnings("deprecation")
	public void DelBooks(String hql) throws SQLException{
		session.beginTransaction();
		Connection con=session.connection(); 
		PreparedStatement stmt=con.prepareStatement(hql); 
		stmt.executeUpdate(); 
		session.getTransaction().commit(); 
		session.close();
	}

	@SuppressWarnings("unchecked")
	public Book QueryBook(String id){
		session.beginTransaction();
		Book book=null;
		String hql="from Book b where b.id = ?";
		List<Book> books=session.createQuery(hql).setParameter(0, id).list();
		if(books.size()!=0){
			book=books.get(0);
		}
		session.getTransaction().commit(); 
		session.close();
		return book;		
	}

	public void UpdateBook(Book book){
		session.beginTransaction();
		Book tmpBook = (Book)session.load(Book.class, book.getTid());
		tmpBook.setAuthor(book.getAuthor());
		tmpBook.setPublisher(book.getPublisher());
		tmpBook.setStock(book.getStock());
		tmpBook.setBookcaseid(book.getBookcaseid());
		tmpBook.setType(book.getType());
		tmpBook.setType2(book.getType2());
		session.update(tmpBook);
		session.getTransaction().commit(); 
		session.close();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<WelcomedBook> QueryTop10() {
		session.beginTransaction();
		List <WelcomedBook> books=session.createQuery("from WelcomedBook wb order by wb.number desc").list();
		List <WelcomedBook> books10=new ArrayList <WelcomedBook> ();
		int i=0;
		for(WelcomedBook book : books){
			books10.add(book);
			i++;
			if(i>9){
				break;
			}
		}
		session.getTransaction().commit(); 
		session.close();	
		return books10;
	}

	@SuppressWarnings("unchecked")
	public DetailedBook Book_information(String id) {
		session.beginTransaction();
		DetailedBook book=new DetailedBook();
		Query list=session.createSQLQuery("SELECT * FROM [libraryDB].[dbo].[book],[libraryDB].[dbo].[bookcase]," +
				"[libraryDB].[dbo].[booktype] WHERE id='"+id+"'and book.bookcaseid=bookcase.bookcaseid and" +
				" booktype.type2=book.type2 and " +
		"booktype.type=book.type").setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP); 
		Map map = (Map)list.list().get(0);
		book.setId(id);
		book.setName((String) map.get("name"));
		book.setType((String) map.get("type"));
		book.setNexttype((String) map.get("typename"));
		book.setAuthor((String) map.get("author"));
		book.setPublisher((String) map.get("publisher"));
		book.setPublish_time(map.get("publish_time").toString());
		book.setPrice((String) map.get("price"));
		book.setTranslator((String) map.get("translator"));
		book.setStock((Integer) map.get("stock"));
		book.setBookcasename((String) map.get("casename"));
		book.setBookcaseid((String) map.get("bookcaseid"));
		book.setBookpic(map.get("bookpic").toString().substring(54));
		book.setPosition((String)map.get("position"));	
		session.getTransaction().commit(); 
		session.close();
		return book;

	}
}
