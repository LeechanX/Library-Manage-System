package domain.impl;

import java.util.List;

import domain.ReaderQuery;
import entity.Reader;

import dao.ReaderDAO;
import dao.impl.ReaderDAOImpl;

public class ReaderQueryImpl implements ReaderQuery{
	
	ReaderDAO readerDao = new ReaderDAOImpl();
	
	public Reader QueryThisReader(String readerid){
		return readerDao.QueryReader(readerid);
	}
	
	public List <Reader> QueryReaders(String readerid,String readername){
		return readerDao.QueryReaders(readerid,readername);
	}

	public boolean ifReader_Exist(String readerid) {
		Reader reader=readerDao.QueryReader(readerid);
		return (reader==null)? false:true;
	}
}
