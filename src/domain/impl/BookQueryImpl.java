package domain.impl;

import java.util.List;

import dao.BookDAO;
import dao.impl.BookDAOImpl;
import domain.BookQuery;
import entity.Book;
import entity.DetailedBook;
import entity.WelcomedBook;

public class BookQueryImpl implements BookQuery{

	BookDAO bookdao=new BookDAOImpl();
	
	public List <Book> QueryBooks(String bookinf,String booktype,int booktype2){
		String hql;
		if(booktype2==-1){
			hql="FROM Book b WHERE (id LIKE '%"+bookinf+"%' " +
					"OR name LIKE '%"+bookinf+"%' "+
					"OR author LIKE '%"+bookinf+"%' "+
					"OR publisher LIKE '%"+bookinf+"%') ";
		}else if(booktype2==0){
			hql="FROM Book b WHERE (b.id LIKE '%"+bookinf+"%' " +
					"OR b.name LIKE '%"+bookinf+"%' "+
					"OR b.author LIKE '%"+bookinf+"%' "+
					"OR b.publisher LIKE '%"+bookinf+"%') AND b.type = '"+booktype+"'";
		}else{
			hql="FROM Book b WHERE (b.id LIKE '%"+bookinf+"%' " +
					"OR b.name LIKE '%"+bookinf+"%' "+
					"OR b.author LIKE '%"+bookinf+"%' "+
					"OR b.publisher LIKE '%"+bookinf+"%') AND b.type = '"+booktype+"' AND b.type2 = '"+booktype2+"'";
		}	
		return bookdao.QueryBooks(hql);
	}
	
	public List <Book> SearchBooks(String no,String name,String publish,String author){
		 String hql="FROM Book b WHERE b.id LIKE '%"+no+"%' " +
			"AND b.name LIKE '%"+name+"%' "+
			"AND b.author LIKE '%"+author+"%' "+
			"AND b.publisher LIKE '%"+publish+"%'";
		return bookdao.QueryBooks(hql);
	}
	
	public Book SearchBook(String id){
		return bookdao.QueryBook(id);
	}
	
	public DetailedBook QueryBook(String id){
		return bookdao.Book_information(id);
	}

	@Override
	public List<WelcomedBook> QueryTop10() {
		return bookdao.QueryTop10();
	}
}
