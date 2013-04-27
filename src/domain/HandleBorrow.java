package domain;

import entity.Borrow;

import java.text.ParseException;
import java.util.List;

public interface HandleBorrow {
	
	public void BorrowOut(String readerid,String bookid);
	public List <Borrow> borrowList(String readerid);	
	public String ContinueBorrow(
			String borrowTime,int tableid) throws ParseException;
	public void Back(int tableid);
}
