package com.Dao;
import java.util.List;

import com.entity.addbook;
public interface booksDao {
	public boolean addbookdet(addbook ad);
	public List<addbook>getallbooks();
	
	public addbook getId(int id);
	public boolean updateBook(addbook a);
	public boolean deleteDetail(int id);
	public List<addbook> getNewBook();
	public List<addbook> getRecentBook();
	public List<addbook>getOldBook();
	public List<addbook>getallRecentBook();
	public List<addbook>getallNewBook();
	public List<addbook>getallOldBook();
	public List<addbook>getbookbySearch(String ch);

}
