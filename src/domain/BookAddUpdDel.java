package domain;

import java.sql.SQLException;

import entity.Book;

public interface BookAddUpdDel {
	
	public void AddBook(Book book);
	public void DeleteBook(String dellists) throws SQLException;
	public void UpdateBook(Book book);
}
