package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Book_Details;
import com.entity.Order_Details;

public class BookOrderImpl implements BookOrderDAO{
	private Connection conn;
	
	public BookOrderImpl(Connection conn) {
		super();
		this.conn=conn;
	}

	
	public boolean saveOrder(List<Order_Details> blist) {
		boolean f=false;
		try {
			String sql="insert into book_order(order_id,user_name,email,address,phone,book_name,author,price,payment) values(?,?,?,?,?,?,?,?,?)";
			conn.setAutoCommit(false);
			PreparedStatement ps=conn.prepareStatement(sql);
			
			for(Order_Details b:blist) {
				ps.setString(1,b.getOrderid());
				ps.setString(2,b.getUsername());
				ps.setString(3,b.getEmail());
				ps.setString(4,b.getFulladdress());
				ps.setString(5,b.getPhoneno());
				ps.setString(6,b.getBookname());
				ps.setString(7,b.getBookauthor());
				ps.setString(8,b.getPrice());
				ps.setString(9,b.getPaymentType());
				ps.addBatch();
				
			}

			int[] count=ps.executeBatch();
			conn.commit();
			f=true;
			conn.setAutoCommit(true);
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<Order_Details> getBook(String email) {
		List<Order_Details> list=new ArrayList<Order_Details>();
		Order_Details o=null;
		try {
			String sql="select * from book_order where email=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, email);
			

			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				o=new Order_Details();
				o.setId(rs.getInt(1));
				o.setOrderid(rs.getString(2));
				o.setUsername(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setFulladdress(rs.getString(5));
				o.setPhoneno(rs.getString(6));
				o.setBookname(rs.getString(7));
				o.setBookauthor(rs.getString(8));
				o.setPrice(rs.getString(9));
				o.setPaymentType(rs.getString(10));
				
				list.add(o);
			}
			
		}catch(Exception e) {
			e.printStackTrace();		
		}
		return list;
	}

	public List<Order_Details> getAllOrder() {
		List<Order_Details> list=new ArrayList<Order_Details>();
		Order_Details o=null;
		try {
			String sql="select * from book_order";
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				o=new Order_Details();
				o.setId(rs.getInt(1));
				o.setOrderid(rs.getString(2));
				o.setUsername(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setFulladdress(rs.getString(5));
				o.setPhoneno(rs.getString(6));
				o.setBookname(rs.getString(7));
				o.setBookauthor(rs.getString(8));
				o.setPrice(rs.getString(9));
				o.setPaymentType(rs.getString(10));
				
				list.add(o);
			}
			
		}catch(Exception e) {
			e.printStackTrace();		
		}
		return list;
		
	}
	
	

}
