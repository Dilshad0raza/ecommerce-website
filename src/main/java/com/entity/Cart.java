package com.entity;

public class Cart {
   private int id;
   private int uid;
   private int bid;
   private String bname;
   private String aname;
   private String price;
public Cart() {
	super();
	// TODO Auto-generated constructor stub
}
public Cart(int id, int uid, int bid, String bname, String aname, String price) {
	super();
	this.id = id;
	this.uid = uid;
	this.bid = bid;
	this.bname = bname;
	this.aname = aname;
	this.price = price;
}
public Cart(int uid, int bid, String bname, String aname, String price) {
	super();
	this.uid = uid;
	this.bid = bid;
	this.bname = bname;
	this.aname = aname;
	this.price = price;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public int getUid() {
	return uid;
}
public void setUid(int uid) {
	this.uid = uid;
}
public int getBid() {
	return bid;
}
public void setBid(int bid) {
	this.bid = bid;
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
@Override
public String toString() {
	return "Cart [id=" + id + ", uid=" + uid + ", bid=" + bid + ", bname=" + bname + ", aname=" + aname + ", price="
			+ price + "]";
}
   
  
}
