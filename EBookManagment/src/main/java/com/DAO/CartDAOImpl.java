package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Book_Details;
import com.entity.Cart;

public class CartDAOImpl implements CartDAO{
	private Connection conn;
	public CartDAOImpl(Connection conn) {
		this.conn=conn;	
	}
	
	public boolean addCart(Cart c) {
		boolean b=false;
		try {
			String sql="insert into cart(bid,uid,bookname,author,price,totalprice) values(?,?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1,c.getBid());
			ps.setInt(2,c.getUid());
			ps.setString(3,c.getBookname());
			ps.setString(4,c.getAuthor());
			ps.setDouble(5,c.getPrice());
			ps.setDouble(6,c.getTotalprice());
			
			int i=ps.executeUpdate();
			if(i==1) 
			{
				b=true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return b;
	}

	
	public List<Cart> getBookByUser(int uid) {
		List<Cart> list=new ArrayList<Cart>();
		Cart c=null;
		double totalPrice=0;
		try {
			String sql="select * from cart where uid=? ";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1,uid);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				c=new Cart();
				c.setCid(rs.getInt(1));
				c.setBid(rs.getInt(2));
				c.setUid(rs.getInt(3));
				c.setBookname(rs.getString(4));
				c.setAuthor(rs.getString(5));
				c.setPrice(rs.getDouble(6));
				
				totalPrice=totalPrice+rs.getDouble(7);
				c.setTotalprice(totalPrice);	
				
				list.add(c);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	
	public boolean deleteBook(int bid,int uid,int cid) {
		boolean f=false;
		try {
			String sql="delete from cart where bid=? && uid=? && cid=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1,bid);
			ps.setInt(2,uid);
			ps.setInt(3, cid);
			
			int i=ps.executeUpdate();
			if(i==1) 
			{
				f=true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	
	
	
	

}
