package domain;

import entity.Reader;

public interface ReaderUpdateOrDelete {
	
	public void UpdateReader(Reader reader);
	
	public void DeleteReader(String readerid);
}
