package com.cakemanager.service;

import com.cakemanager.model.Account;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginService {
    private static final String CHECK_USER_PASSWORD_SQL = "select * from account where email = ? and password = ?";
    private static final String SELECT_ROLL_USER = "select roll from account where email = ? and password = ?";
    public static final int NOT_FOUND_USER = -1;


    public Account checkLogin(String emailInput,String passwordInput)  {
        Account account = null;
        Connection connection = DatabaseConection.getConnection();
        if (connection != null) {
            try {
                PreparedStatement preparedStatement = connection.prepareStatement(CHECK_USER_PASSWORD_SQL);
                preparedStatement.setString(1,emailInput);
                preparedStatement.setString(2,passwordInput);
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
