package com.entity;

public class Book_Details {
	private int bookid;
	private String bookname;
	private String author;
	private String price;
	private String bookCategory;
	private String status;
	private String photoname;
	private String email;
	
	
	public Book_Details() {
		
	}
	
	
	public Book_Details(String bookname, String author, String price, String bookCategory, String status,
			String photoname, String email) {
		super();
		this.bookid = bookid;
		this.bookname = bookname;
		this.author = author;
		this.price = price;
		this.bookCategory = bookCategory;
		this.status = status;
		this.photoname = photoname;
		this.email = email;
	}


	public int getBookid() {
		return bookid;
	}
	public void setBookid(int bookid) {
		this.bookid = bookid;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getBookCategory() {
		return bookCategory;
	}
	public void setBookCategory(String bookCategory) {
		this.bookCategory = bookCategory;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPhotoname() {
		return photoname;
	}
	public void setPhotoname(String photoname) {
		this.photoname = photoname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}


	@Override
	public String toString() {
		return "Book_Details [bookid=" + bookid + ", bookname=" + bookname + ", author=" + author + ", price=" + price
				+ ", bookCategory=" + bookCategory + ", status=" + status + ", photoname=" + photoname + ", email="
				+ email + "]";
	}
	
	
	

}
