package domain;

import java.util.List;
import entity.Book;
import entity.DetailedBook;
import entity.WelcomedBook;

public interface BookQuery {

	public List <Book> QueryBooks(String bookinf,String booktype,int booktype2);//book query by reader;
	public List <Book> SearchBooks(String no,String name,String publish,String author);//book query by manager;
	public Book SearchBook(String id);//query a book to edit;
	public DetailedBook QueryBook(String id);// query information
	public List <WelcomedBook> QueryTop10();
}
