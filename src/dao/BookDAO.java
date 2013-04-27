package dao;

import entity.Book;
import entity.DetailedBook;
import entity.WelcomedBook;

import java.sql.SQLException;
import java.util.List;

public interface BookDAO {

	public List <Book> QueryBooks(String hql);
	public Book QueryBook(String id);
	public void AddBook(Book book);
	public void DelBooks(String hql) throws SQLException;
	public void UpdateBook(Book book);
	public List <WelcomedBook> QueryTop10();
	public DetailedBook Book_information(String id);
}
