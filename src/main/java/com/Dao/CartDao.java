package com.Dao;

import java.util.*;

import com.entity.Cart;

public interface CartDao {
   public boolean addCart(Cart c);
   public List<Cart> getbookUser(int uid);
   public boolean RemoveOrder(int id);
   public List<Cart> getAllOrder();
}
