package dao.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.transform.Transformers;

import dao.BorrowDAO;
import entity.Borrow;

public class BorrowDAOImpl implements BorrowDAO{

	SessionFactory sessionFactory = 
		new Configuration().configure().buildSessionFactory(); 
	Session session = sessionFactory.openSession();
	
	public void AddBorrow(Borrow borrow) {
		session.beginTransaction();
		session.save(borrow);
		session.getTransaction().commit(); 
		session.close();	
	}

	public void Back(int tableid) {
		Date today=new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd",Locale.getDefault());
        String backTime = dateFormat.format(today);
        Borrow tmpBorrow=(Borrow)session.load(Borrow.class, tableid);
		session.beginTransaction();
    	tmpBorrow.setBack_time(backTime);
        tmpBorrow.setIs_back(1);
        session.update(tmpBorrow);
		session.getTransaction().commit(); 
		session.close();
	}

	@SuppressWarnings("unchecked")
	public List<Borrow> BorrowList(String readerid) {
		session.beginTransaction();	
		List <Borrow> borrowlist=new ArrayList<Borrow>();
		Query list=session.createSQLQuery("SELECT [reader].[id],[book].[id] as bid,[reader].[name],[reader].[telephone],[book].[name] as bname,[borrow].[borrowTime],[book].[author],[back_time],[borrow].[id] as tid"+
		" FROM [dbo].[borrow],[dbo].[book],[dbo].[reader]"+
		"WHERE readerid='"+readerid+"'"+ 
		"AND [reader].[id]=[borrow].[readerid] AND [book].[id]=[borrow].[bookid] AND [borrow].[is_back]='0'").setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP); 
		for(int i=0;i<list.list().size();i++){
			Borrow bo=new Borrow();
			Map map = (Map)list.list().get(i);
			bo.setReaderid(readerid);
			bo.setBookid((String)map.get("bid"));
			bo.setBorrow_time((String)map.get("borrowTime").toString());
			bo.setBack_time(map.get("back_time").toString());
			bo.setBookname((String)map.get("bname"));
			bo.setId(Integer.parseInt(map.get("tid").toString()));
			borrowlist.add(bo);
		}
		session.getTransaction().commit(); 
		session.close();
		return borrowlist;
	}

	public String continueBorrow(
			String borrowTime,int tableid) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date newdate=sdf.parse(borrowTime);
        Calendar cal=new GregorianCalendar();
        cal.setTime(newdate);
        cal.add(Calendar.DATE,60);
        newdate=cal.getTime();
        String newbackTime=sdf.format(newdate);
		
		session.beginTransaction();
		Borrow tmpBorrow=(Borrow)session.load(Borrow.class, tableid);
		tmpBorrow.setBack_time(newbackTime);
		session.getTransaction().commit(); 
		session.close();
		return newbackTime;
	}
}
