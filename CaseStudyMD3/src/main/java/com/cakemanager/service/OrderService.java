package com.cakemanager.service;

import com.cakemanager.model.OrderDetails;
import com.cakemanager.model.Orders;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class OrderService {
    private static final String SELECT_ALL_ORDER = "select o.orderId, orderDate, o.userId, status,a.name from account as a inner join orders as o on a.userId =o.userId;";
    private static final String SELECT_ORDER_BY_USERID = "select o.orderId, orderDate, o.userId, status,a.name from account as a inner join orders as o on a.userId =o.userId where a.userId =?;";
    private static final String SELECT_ORDERDETAIL_WITH_USERID = "select productId,o.orderId,salePrice,quantityProduct,productName from orderdetails as od inner join orders o on od.orderId = o.orderId\n" +
            "where userId = ?;";
    private static final String UPDATE_STATUS_ORDER ="update orders set status = false where orderId = ?;";
    public List<Orders> getAllOrder(){
        List<Orders> listOrder = null;
        Connection connection = DatabaseConection.getConnection();
        if (connection != null) {
            try {
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_ORDER);
                ResultSet resultSet = preparedStatement.executeQuery();
                listOrder = new ArrayList<>();
                while (resultSet.next()) {
                    int orderId = resultSet.getInt("o.orderId");
                    Date orderDate = resultSet.getDate("orderDate");
                    int userId = resultSet.getInt("o.userId");
                    boolean status = resultSet.getBoolean("status");
                    String userName = resultSet.getString("a.name");

                    Orders order = new Orders(orderId,orderDate,userId,status,userName);
                    listOrder.add(order);
                }
                return  listOrder;
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return null;
    }
    public Orders getOrderByUserId(int userIdInput){
        Orders order = null;
        Connection connection = DatabaseConection.getConnection();
        if (connection != null) {
            try {
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ORDER_BY_USERID);
                preparedStatement.setInt(1,userIdInput);
                ResultSet resultSet = preparedStatement.executeQuery();
                if (resultSet.next()) {
                    int orderId = resultSet.getInt("o.orderId");
                    Date orderDate = resultSet.getDate("orderDate");
                    int userId = resultSet.getInt("o.userId");
                    boolean status = resultSet.getBoolean("status");
                    String userName = resultSet.getString("a.name");
                    order = new Orders(orderId,orderDate,userId,status,userName);
                    return order;
                }
                return  order;
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return null;
    }
    public List<OrderDetails> getListOrderDetailWithUserId(int userIdInput){
        List<OrderDetails> orderDetailsList = null;
        Connection connection = DatabaseConection.getConnection();
        if (connection != null) {
            try {
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ORDERDETAIL_WITH_USERID);
                preparedStatement.setInt(1,userIdInput);
                ResultSet resultSet = preparedStatement.executeQuery();
                System.out.println(preparedStatement);
                orderDetailsList = new ArrayList<>();
                while (resultSet.next()) {
                    int productId = resultSet.getInt("productId");
                    int orderId = resultSet.getInt("orderId");
                    float salePrice = resultSet.getFloat("salePrice");
                    int quantityProduct = resultSet.getInt("quantityProduct");
                    String productName = resultSet.getString("productName");
                    OrderDetails orderDetails = new OrderDetails(productId,productName,orderId,salePrice,quantityProduct);
                    orderDetailsList.add(orderDetails);
                }
                return orderDetailsList;
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return null;
    }
    public boolean updateStatusOrder(int orderIdInput){
        Connection connection = DatabaseConection.getConnection();
        if (connection != null) {
            try {
                PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_STATUS_ORDER);
                preparedStatement.setInt(1,orderIdInput);
                preparedStatement.executeUpdate();
                return  true;
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return false;
    }

}
