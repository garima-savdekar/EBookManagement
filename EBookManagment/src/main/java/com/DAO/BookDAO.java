package com.DAO;

import java.util.ArrayList;
import java.util.List;


import com.entity.Book_Details;

public interface BookDAO {
	public boolean addBooks(Book_Details b); 
		
	public List<Book_Details> getAllBooks();
	
	public Book_Details getBookById(int bid);
	
	public boolean updateEditbooks(Book_Details b);

	public boolean deleteBooks(int id);
	
	public List<Book_Details> getNewBook();
	
	public List<Book_Details> getRecentBook();
	
	public List<Book_Details> getOldBook();
	
	public List<Book_Details> getAllRecentBook();
	
	public List<Book_Details> getAllOldBook();
	
	public List<Book_Details> getAllNewBook();
	
	public List<Book_Details> getBookByOld(String email,String cat);
	
	public boolean oldBookDelete(String email,String cat,int bid);
	
	public List<Book_Details> getBookBySearch(String ch);
}
