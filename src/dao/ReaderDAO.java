package dao;

import java.util.List;

import entity.Reader;

public interface ReaderDAO {

	public Reader QueryReader(String readerid);  //query for one reader 
	public List <Reader> QueryReaders(String readerid,String readername); // query some readers
	public void DeleteReader(String readerid);
	public void AddReader(Reader reader);
	public void UpdateReader(Reader reader);
}
