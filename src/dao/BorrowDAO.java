package dao;

import java.text.ParseException;
import java.util.List;

import entity.Borrow;

public interface BorrowDAO {
	
	public void AddBorrow(Borrow borrow);
	public void Back(int tableid);
	public List <Borrow> BorrowList(String readerid);
	public String continueBorrow(String borrowTime,int tableid) throws ParseException;
	
}
