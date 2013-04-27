package domain.impl;

import domain.ReaderUpdateOrDelete;

import dao.ReaderDAO;
import dao.impl.ReaderDAOImpl;
import entity.Reader;

public class ReaderUpdateOrDeleteImpl implements ReaderUpdateOrDelete{
	
	private ReaderDAO readerDao=new ReaderDAOImpl();
	
	public void UpdateReader(Reader reader){
		readerDao.UpdateReader(reader);
	}

	public void DeleteReader(String readerid){
		readerDao.DeleteReader(readerid);
	}
}
