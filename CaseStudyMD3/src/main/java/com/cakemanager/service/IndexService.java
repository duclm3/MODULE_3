package com.cakemanager.service;

import com.cakemanager.model.Category;
import com.cakemanager.model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class IndexService implements IIndexService {

    //private static final String INSERT_ProductS_SQL = "INSERT INTO products" + "  (name, email, country) VALUES " + " (?, ?, ?);";

    private static final String SELECT_Product_BY_ID = "select id,name,email,country from products where id =?";
    private static final String SELECT_PRODUCT_BY_ID = "select * from products where categoryId =?";
    private static final String SELECT_ALL_ProductS = "select * from products";
    private static final String SELECT_CATEGORY_NAME = "select category.name from category join products on category.categoryId = products.categoryId where productId = ?";
    private static final String DELETE_ProductS_SQL = "delete from products where id = ?;";
    private static final String UPDATE_ProductS_SQL = "update products set name = ?,email= ?, country =? where id = ?;";
    private static final String SELECT_CATEGORY_NAME_WHERE_PRODUCT_ID = "select category.name from category, products where category.categoryId = products.categoryId and products.productId =?";


    public IndexService() {

    }



    @Override
    public void insertProduct(Product product) throws SQLException {

    }

    @Override
    public List<Product> selectProduct(int id) {
        List<Product> products = new ArrayList<>();
        try (Connection connection = DatabaseConection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCT_BY_ID);) {
            preparedStatement.setInt(1, id);
//            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int productId = rs.getInt("productId");
                String name = rs.getString("name");
                Float unitPrice = rs.getFloat("unitPrice");
                int quantityStock = rs.getInt("quantityStock");
                String productDescription = rs.getString("productDescription");
                String thumbnail = rs.getString("thumbnail");
                int categoryId = rs.getInt("categoryId");
                products.add(new Product(productId, name, unitPrice, quantityStock, productDescription, thumbnail, categoryId));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return products;
    }

    @Override
    public List<Product> selectAllProducts() {
        // using try-with-resources to avoid closing resources (boiler plate code)
        List<Product> products = new ArrayList<>();
        // Step 1: Establishing a Connection
        try (Connection connection = DatabaseConection.getConnection();

             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_ProductS);)
        {
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int productId = rs.getInt("productId");
                String name = rs.getString("name");
                Float unitPrice = rs.getFloat("unitPrice");
                int quantityStock = rs.getInt("quantityStock");
                String productDescription = rs.getString("productDescription");
                String thumbnail = rs.getString("thumbnail");
                int categoryId = rs.getInt("categoryId");
                products.add(new Product(productId, name, unitPrice, quantityStock, productDescription, thumbnail, categoryId));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return products;
    }

    public Category selectCategoryByProductId(int id) {
        Category category = null;
        try (Connection connection = DatabaseConection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CATEGORY_NAME_WHERE_PRODUCT_ID);) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String name = rs.getString("name");
                category= new Category(name);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return category;
    }

    @Override
    public boolean deleteProduct(int id) throws SQLException {
        return false;
    }

    @Override
    public boolean updateProduct(Product product) throws SQLException {
        return false;
    }

    @Override
    public Product getProductById(int id) {
        return null;
    }

    private void printSQLException(SQLException e) {
    }

}
