package com.cakemanager.service;

import com.cakemanager.model.Cart;
import com.cakemanager.model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CartService implements ICartService{
    private static final String INSERT_CART_SQL = "INSERT INTO cart" + "  (productName, productPrice, priceTotal, userId, thumbnail, productId) VALUES " +
            " (?, ?, ?, ?, ?, ?);";
    private static final String SELECT_Product_BY_ID = "select id,name,email,country from products where id =?";
    private static final String SELECT_FROM_CART_WHERE_USER_ID = "select * from cart where userId =?";
    private static final String SELECT_ALL_ProductS = "select * from products";
    private static final String SELECT_CATEGORY_NAME = "select category.name from category join products on category.categoryId = products.categoryId where productId = ?";
    private static final String DELETE_FROM_CART_WHERE_CART_ID = "delete from cart where cartId = ?;";
    private static final String UPDATE_CART_SET_QUANTITY_WHERE_ID = "update cart set quantity = ? where cartId = ?;";
    private static final String COUNT_CART_WHERE_USER_ID = "select count(cartId) as count from cart where userId = ?;";

    public CartService() {

    }

    @Override
    public void insertCart(Cart cart) throws SQLException {
        System.out.println(INSERT_CART_SQL);
        // try-with-resource statement will auto close the connection.
        try (Connection connection = DatabaseConection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CART_SQL)) {
            preparedStatement.setString(1, cart.getProductName());
            preparedStatement.setFloat(2, cart.getProductPrice());
            preparedStatement.setFloat(3, cart.getPriceTotal());
            preparedStatement.setInt(4, cart.getUserId());
            preparedStatement.setString(5, cart.getThumbnail());
            preparedStatement.setInt(6, cart.getProductId());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    @Override
    public List<Cart> selectCart(int id) {
        List<Cart> carts = new ArrayList<>();
        // Step 1: Establishing a Connection
        try (Connection connection = DatabaseConection.getConnection();
             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_FROM_CART_WHERE_USER_ID);) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int cartId = rs.getInt("cartId");
                String productName = rs.getString("productName");
                Float productPrice = rs.getFloat("priceTotal");
                int quantity = rs.getInt("quantity");
                Float priceTotal = rs.getFloat("priceTotal");
                String thumbnail = rs.getString("thumbnail");
                int userId = rs.getInt("userId");
                int productId = rs.getInt("productId");
                carts.add(new Cart(cartId, productName, productPrice, quantity, priceTotal, thumbnail, userId, productId));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        System.out.println(carts);
        return carts;
    }

    private void printSQLException(SQLException e) {
    }

    @Override
    public List<Product> selectAllProducts() {
        return null;
    }

    @Override
    public boolean deleteCart(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = DatabaseConection.getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_FROM_CART_WHERE_CART_ID);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    @Override
    public boolean updateCart(Cart cart) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = DatabaseConection.getConnection(); PreparedStatement statement = connection.prepareStatement(UPDATE_CART_SET_QUANTITY_WHERE_ID);) {
            statement.setInt(1, cart.getQuantity());
            statement.setInt(2, cart.getCartId());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    @Override
    public Product getProductById(int id) {
        return null;
    }

    public int countCart(int userId) {
        int count = 0;
        try (Connection connection = DatabaseConection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(COUNT_CART_WHERE_USER_ID);) {
            preparedStatement.setInt(1, userId);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                count = rs.getInt("count");
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return count;
    }
}
