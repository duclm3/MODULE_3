package com.cakemanager.service;

import com.cakemanager.model.Account;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AccountService {
    private static final String SELECT_ACCOUNT_BY_ID = "select * from account where userId = ?";
    private static final String SELECT_ALL_ACCOUNT = "select * from account as a inner join orders as o on a.userId = o.userId";
    public Account findAccountById(int userIdInput)  {
        Account account = null;
        Connection connection = DatabaseConection.getConnection();
        if (connection != null) {
            try {
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ACCOUNT_BY_ID);
                preparedStatement.setInt(1,userIdInput);
                account = new Account();
                ResultSet resultSet = preparedStatement.executeQuery();
                System.out.println(preparedStatement);
                if (resultSet.next()) {
                    int userId =  resultSet.getInt("userId");
                    String name = resultSet.getString("name");
                    String phone = resultSet.getString("phone");
                    String email = resultSet.getString("email");
                    String address = resultSet.getString("address");
                    String password = resultSet.getString("password");
                    boolean roll = resultSet.getBoolean("roll");
                    account = new Account(userId,name,phone,email,address,password,roll);
                    return account;
                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return null;
    }
}
