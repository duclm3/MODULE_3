package com.cakemanager.service;

import com.cakemanager.model.Category;
import com.cakemanager.model.Product;

import java.sql.SQLException;
import java.util.List;

public interface IIndexService {
     void insertProduct(Product product) throws SQLException;

     List<Product> selectProduct(int id);

     List<Product> selectAllProducts();

     boolean deleteProduct(int id) throws SQLException;

     boolean updateProduct(Product product) throws SQLException;

     Product getProductById(int id);

     public Category selectCategoryByProductId(int id);
}
