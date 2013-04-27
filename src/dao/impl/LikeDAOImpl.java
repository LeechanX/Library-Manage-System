package dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.transform.Transformers;

import dao.LikeDAO;
import entity.DetailedLike;
import entity.Like;

public class LikeDAOImpl implements LikeDAO {

	SessionFactory sessionFactory = 
		new Configuration().configure().buildSessionFactory(); 
	Session session = sessionFactory.openSession();
	
	@SuppressWarnings("unchecked")
	public String AddLike(String bookid,String readerid) {
		String ret="";
		session.beginTransaction();
		String hql="from Like l where l.readerid = '"+readerid+"' and l.bookid = '"+bookid+"'"; 
		List<Like> lList=session.createQuery(hql).list();
		if(lList.size()!=0){
			ret="已经添加过喜欢了！";
		}else{
			Like like=new Like();
			like.setBookid(bookid);
			like.setReaderid(readerid);
			session.save(like);
			ret="添加成功！";
		}	
		session.getTransaction().commit(); 
		session.close();
		return ret;
	}

	public void DelLike(int tableid) {
		session.beginTransaction();
		Like like=(Like) session.load(Like.class, tableid);
		session.delete(like);
		session.getTransaction().commit(); 
		session.close();
	}

	@SuppressWarnings("unchecked")
	public List<DetailedLike> showlikelist(String readerid) {
		List <DetailedLike> mylike=new ArrayList<DetailedLike>();
		String sql="SELECT [book].[id] as bid,[book].[name] as bname,[bookcar].[id] as id,[book].[author] as author FROM [dbo].[bookcar],[dbo].[book] WHERE readerid='" 
			+readerid+"' AND [book].[id]=[bookcar].[bookid]";
		Query list=session.createSQLQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP); 
		for(int i=0;i<list.list().size();i++){
			Map map = (Map)list.list().get(i);
			DetailedLike like=new DetailedLike();
			like.setAuthor((String)map.get("author"));
			like.setBookname((String)map.get("bname"));
			like.setBookid((String)map.get("bid"));
			like.setTableid((Integer)map.get("id"));
			mylike.add(like);
		}
		return mylike;
	}
}
