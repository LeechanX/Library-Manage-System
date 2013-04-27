package dao;

import entity.Manager;

public interface ManagerDAO {
	
	public Manager Login(String mid,String password);
	
}
