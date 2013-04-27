package domain.impl;


import entity.Reader;
import domain.ReaderLogin;

import dao.ReaderDAO;
import dao.impl.ReaderDAOImpl;

public class ReaderLoginImpl implements ReaderLogin{

	private ReaderDAO readerDao=new ReaderDAOImpl();
	
	public boolean login(Reader reader) {
		Reader tmpReader=readerDao.QueryReader(reader.getReaderid());
		if(tmpReader!=null && reader.getPassword().equals(tmpReader.getPassword())){
			reader.setReaderid(reader.getReaderid());
			return true;
		}
		return false;
	}
}
