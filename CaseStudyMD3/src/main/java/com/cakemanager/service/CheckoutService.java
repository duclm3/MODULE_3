package com.cakemanager.service;

import com.cakemanager.model.Cart;
import com.cakemanager.model.OrderDetails;
import com.cakemanager.model.Orders;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CheckoutService {
    private static final String SELECT_FROM_CART_WHERE_USER_ID = "select * from cart where userId =?";
    private static final String SELECT_FROM_ORDER_WHERE_USER_ID = "select * from orders where userId =?";
    private static final String INSERT_INTO_ORDERS_USER_ID_VALUES = "INSERT INTO orders (userId) VALUES (?);";
    private static final String INSERT_INTO_ORDERS_DETAIL = "INSERT INTO orderdetails VALUES (?, ?, ?, ?, ?);";
    private static final String UPDATE_PRODUCTS_SET_QUANTITY_STOCK_WHERE_PRODUCT_ID = "update products set quantityStock = ? where productId = ?;";
    private static final String DELETE_FROM_CART_WHERE_USER_ID = "delete from cart where userId = ?;";

    public CheckoutService() {

    }

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

    public void insertOrder(Orders orders) {
        System.out.println(INSERT_INTO_ORDERS_USER_ID_VALUES);
        try (Connection connection = DatabaseConection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_ORDERS_USER_ID_VALUES)) {
            preparedStatement.setInt(1, orders.getUserId());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public void insertOrderDetail(OrderDetails orderDetails) {
        System.out.println(INSERT_INTO_ORDERS_DETAIL);
        try (Connection connection = DatabaseConection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_ORDERS_DETAIL)) {
            preparedStatement.setInt(1, orderDetails.getProductId());
            preparedStatement.setInt(2, orderDetails.getOrderId());
            preparedStatement.setFloat(3, orderDetails.getSalePrice());
            preparedStatement.setInt(4, orderDetails.getQuantityProduct());
            preparedStatement.setString(5, orderDetails.getProductName());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public List<Orders> selectOrder(int userId) {
        List<Orders> orders = new ArrayList<>();
        try (Connection connection = DatabaseConection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_FROM_ORDER_WHERE_USER_ID);) {
            preparedStatement.setInt(1, userId);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int orderId = rs.getInt("orderId");
//                Date orderDate = rs.getDate("orderDate");
                int id = rs.getInt("userId");
                //boolean status = rs.getBoolean("status");

                orders.add(new Orders(orderId, userId));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        System.out.println(orders);
        return orders;
    }

    public void updateQuantityStock(int quantityStock, int productId) {
        Connection connection = DatabaseConection.getConnection();
        if (connection != null) {
            try {
                PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PRODUCTS_SET_QUANTITY_STOCK_WHERE_PRODUCT_ID);
                preparedStatement.setInt(1, quantityStock);
                preparedStatement.setInt(2, productId);
                System.out.println(preparedStatement);
                preparedStatement.executeUpdate();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }

    public boolean deleteCartByUserId(int userId) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = DatabaseConection.getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_FROM_CART_WHERE_USER_ID);) {
            statement.setInt(1, userId);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }
}
