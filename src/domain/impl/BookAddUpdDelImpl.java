package domain.impl;

import java.sql.SQLException;

import entity.Book;
import domain.BookAddUpdDel;

import dao.BookDAO;
import dao.impl.BookDAOImpl;

public class BookAddUpdDelImpl implements BookAddUpdDel{

	BookDAO bookdao=new BookDAOImpl();
	
	public void AddBook(Book book){
		bookdao.AddBook(book);
	}
	public void DeleteBook(String dellists) throws SQLException{
		String[] dellist = dellists.split(",");
		String hql="DELETE FROM Book WHERE id IN (";
		for(int i=0;i<dellist.length;i++){
			if(i<dellist.length-1)
			hql+="'"+dellist[i]+"',";
			else
			hql+="'"+dellist[i]+"')";
		}
		bookdao.DelBooks(hql);
	}
	
	public void UpdateBook(Book book){
		bookdao.UpdateBook(book);
	}
}
