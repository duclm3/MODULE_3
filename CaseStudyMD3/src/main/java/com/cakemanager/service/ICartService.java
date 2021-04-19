package com.cakemanager.service;

import com.cakemanager.model.Cart;
import com.cakemanager.model.Product;

import java.sql.SQLException;
import java.util.List;

public interface ICartService {
    void insertCart(Cart cart) throws SQLException;

    List<Cart> selectCart(int id);

    List<Product> selectAllProducts();

    boolean deleteCart(int id) throws SQLException;

    boolean updateCart(Cart cart) throws SQLException;

    Product getProductById(int id);
}
