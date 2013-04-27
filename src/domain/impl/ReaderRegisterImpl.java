package domain.impl;

import entity.Reader;
import dao.ReaderDAO;
import domain.ReaderRegister;
import dao.impl.ReaderDAOImpl;

public class ReaderRegisterImpl implements ReaderRegister{

	private ReaderDAO readerDao=new ReaderDAOImpl(); 
	
	public void Register(Reader reader){
		reader.setFee(0);
		if(reader.getType().equals("1"))reader.setNownum(12);
		else if(reader.getType().equals("2"))reader.setNownum(15);
		else if(reader.getType().equals("3")||reader.getType().equals("4"))reader.setNownum(10);
		else reader.setNownum(10);
		readerDao.AddReader(reader);
	}
}
