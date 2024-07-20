package com.DAO;

import java.util.List;

import com.entity.Order_Details;

public interface BookOrderDAO {
	
	public boolean saveOrder(List<Order_Details> blist);
	
	public List<Order_Details> getBook(String email);
	
	public List<Order_Details> getAllOrder();
}
