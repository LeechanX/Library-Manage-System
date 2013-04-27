package domain.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;

import domain.HandleBorrow;
import entity.Borrow;

import dao.BorrowDAO;
import dao.impl.BorrowDAOImpl;

public class HandleBorrowImpl implements HandleBorrow {

	BorrowDAO borrowdao=new BorrowDAOImpl();
	public void BorrowOut(String readerid, String bookid) {
		Date today=new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd",Locale.getDefault());
        String borrowTime = dateFormat.format(today);
        Calendar cal=new GregorianCalendar();
        cal.setTime(today);
        cal.add(Calendar.DATE,30);
        Date backday=cal.getTime();
        String backTime=dateFormat.format(backday);
		Borrow borrow=new Borrow();
		borrow.setIs_back(0);
		borrow.setReaderid(readerid);
		borrow.setBookid(bookid);
		borrow.setBack_time(backTime);
		borrow.setBorrow_time(borrowTime);
		borrowdao.AddBorrow(borrow);
	}
	
	public List<Borrow> borrowList(String readerid) {
		return borrowdao.BorrowList(readerid);
	}
	
	public String ContinueBorrow(String borrowTime,int tableid) throws ParseException {
		return borrowdao.continueBorrow(borrowTime,tableid);
	}
	
	public void Back(int tableid) {
		borrowdao.Back(tableid);
	}
}
