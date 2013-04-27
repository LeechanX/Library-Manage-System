package domain;

import java.util.List;

import entity.Reader;

public interface ReaderQuery {

	public Reader QueryThisReader(String readerid);
	
	public List <Reader> QueryReaders(String readerid,String readername);
	
	public boolean ifReader_Exist(String readerid);
}
