package com.entity;

public class addbook {
	private int id;
	private String bname;
	private String aname;
	private String price;
	private String bc;
	private String bs;
	private String filename;
	public addbook() {
		super();
		// TODO Auto-generated constructor stub
	}
	public addbook(String bname, String aname, String price, String bc, String bs, String filename) {
		super();
		this.bname = bname;
		this.aname = aname;
		this.price = price;
		this.bc = bc;
		this.bs = bs;
		this.filename = filename;
	}
	public addbook(int id, String bname, String aname, String price, String bc, String bs, String filename) {
		super();
		this.id = id;
		this.bname = bname;
		this.aname = aname;
		this.price = price;
		this.bc = bc;
		this.bs = bs;
		this.filename = filename;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getBc() {
		return bc;
	}
	public void setBc(String bc) {
		this.bc = bc;
	}
	public String getBs() {
		return bs;
	}
	public void setBs(String bs) {
		this.bs = bs;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	@Override
	public String toString() {
		return "addbook [id=" + id + ", bname=" + bname + ", aname=" + aname + ", price=" + price + ", bc=" + bc
				+ ", bs=" + bs + ", filename=" + filename + "]";
	}
	

}
