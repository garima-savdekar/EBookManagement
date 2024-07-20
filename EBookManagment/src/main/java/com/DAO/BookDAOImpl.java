package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Book_Details;

public class BookDAOImpl implements BookDAO{
		private Connection conn;

	public BookDAOImpl(Connection conn) {
		super();
		this.conn=conn;
	}

	@Override
	public boolean addBooks(Book_Details b) {
		boolean f=false;
		try {
			String sql="insert into book_details(bookname,author,price,bookCategory,status,photo,email) values(?,?,?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,b.getBookname());
			ps.setString(2,b.getAuthor());
			ps.setString(3,b.getPrice());
			ps.setString(4,b.getBookCategory());
			ps.setString(5,b.getStatus());
			ps.setString(6,b.getPhotoname());
			ps.setString(7,b.getEmail());
			
			
			int i=ps.executeUpdate();
			if(i==1) 
			{
				f=true;
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<Book_Details> getAllBooks() {
		List<Book_Details> list=new ArrayList<Book_Details>(); 
		Book_Details b=null;
		
		try {
			String sql="select * from book_details";
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				b=new Book_Details();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoname(rs.getString(7));
				b.setEmail(rs.getString(8));
				
				list.add(b);
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	
	public Book_Details getBookById(int bid) {
		
		Book_Details b=null;
		try {
			String sql="select * from book_details where bookid=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, bid);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				b=new Book_Details();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoname(rs.getString(7));
				b.setEmail(rs.getString(8));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return b;
	}


	@Override
	public boolean updateEditbooks(Book_Details b) {
		boolean f=false;
		try {
			String sql="update book_details set bookname=? ,author=?, price=?, status=? where bookid=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ps.setString(1,b.getBookname());
			ps.setString(2,b.getAuthor());
			ps.setString(3,b.getPrice());
			ps.setString(4,b.getStatus());
			ps.setInt(5, b.getBookid());
			
			int i=ps.executeUpdate();
			if(i==1) 
			{
				f=true;
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

	
	public boolean deleteBooks(int id) {
		boolean f=false;
		try {
			String sql="delete from book_details where bookid=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ps.setInt(1,id);
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

	
	public List<Book_Details> getNewBook() {
		List<Book_Details> list=new ArrayList<Book_Details>(); 
		Book_Details b=null;
		try {
			String sql="select * from book_details where bookcategory=? and status=? order by bookid desc";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,"New");
			ps.setString(2,"Active");
			ResultSet rs=ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4) {
				b=new Book_Details();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoname(rs.getString(7));
				b.setEmail(rs.getString(8));
				
				list.add(b);
				i++;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}
	
	public List<Book_Details> getRecentBook() {
		List<Book_Details> list=new ArrayList<Book_Details>(); 
		Book_Details b=null;
		try {
			String sql="select * from book_details where status=? order by bookid desc";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,"Active");
			
			ResultSet rs=ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4) {
				b=new Book_Details();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoname(rs.getString(7));
				b.setEmail(rs.getString(8));
				
				list.add(b);
				i++;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}
	
	public List<Book_Details> getOldBook() {
		List<Book_Details> list=new ArrayList<Book_Details>(); 
		Book_Details b=null;
		try {
			String sql="select * from book_details where bookcategory=? order by bookid desc";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,"Old");
			
			ResultSet rs=ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4) {
				b=new Book_Details();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoname(rs.getString(7));
				b.setEmail(rs.getString(8));
				
				list.add(b);
				i++;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}

	
	public List<Book_Details> getAllRecentBook() {
		List<Book_Details> list=new ArrayList<Book_Details>(); 
		Book_Details b=null;
		try {
			String sql="select * from book_details where status=? order by bookid desc";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,"Active");
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				b=new Book_Details();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoname(rs.getString(7));
				b.setEmail(rs.getString(8));
				
				list.add(b);
			
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}

	
	public List<Book_Details> getAllOldBook() {
		List<Book_Details> list=new ArrayList<Book_Details>(); 
		Book_Details b=null;
		try {
			String sql="select * from book_details where bookcategory=? order by bookid desc";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,"Old");
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				b=new Book_Details();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoname(rs.getString(7));
				b.setEmail(rs.getString(8));
				
				list.add(b);
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}

	
	public List<Book_Details> getAllNewBook() {
		List<Book_Details> list=new ArrayList<Book_Details>(); 
		Book_Details b=null;
		try {
			String sql="select * from book_details where bookcategory=? and status=? order by bookid desc";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,"New");
			ps.setString(2,"Active");
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				b=new Book_Details();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoname(rs.getString(7));
				b.setEmail(rs.getString(8));
				
				list.add(b);
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}

	
	public List<Book_Details> getBookByOld(String email, String cat) {
		
			List<Book_Details> list=new ArrayList<Book_Details>(); 
			Book_Details b=null;
			try {
				String sql="select * from book_details where email=? and bookcategory=?";
				PreparedStatement ps=conn.prepareStatement(sql);
				ps.setString(1,email);
				ps.setString(2,cat);
				ResultSet rs=ps.executeQuery();
				
				while(rs.next()) {
					b=new Book_Details();
					b.setBookid(rs.getInt(1));
					b.setBookname(rs.getString(2));
					b.setAuthor(rs.getString(3));
					b.setPrice(rs.getString(4));
					b.setBookCategory(rs.getString(5));
					b.setStatus(rs.getString(6));
					b.setPhotoname(rs.getString(7));
					b.setEmail(rs.getString(8));
					
					list.add(b);
					
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}

			
			return list;
		}

	
	public boolean oldBookDelete(String email, String cat, int bid) {
		boolean b=false;
		try {
			String sql="delete from book_details where bookCategory=? and email=? and bookid=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,cat);
			ps.setString(2,email);
			ps.setInt(3,bid);
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

	public List<Book_Details> getBookBySearch(String ch) {
		List<Book_Details> list=new ArrayList<Book_Details>(); 
		Book_Details b=null;
		try {
			String sql="select * from book_details where bookname like ? or author like ? or bookCategory like ? and status=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,"%"+ch+"%");
			ps.setString(2,"%"+ch+"%");
			ps.setString(3, "%"+ch+"%");
			ps.setString(4,"Active");
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				b=new Book_Details();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoname(rs.getString(7));
				b.setEmail(rs.getString(8));
				
				list.add(b);
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	



}
