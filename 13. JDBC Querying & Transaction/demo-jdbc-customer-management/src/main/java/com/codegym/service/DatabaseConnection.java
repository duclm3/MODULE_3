package com.codegym.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    public static Connection getConnection() {
        String jdbcUrl = "jdbc:mysql://localhost:3306/demo_m3";
        String jdbcDriver = "com.mysql.cj.jdbc.Driver";
        String username = "root"; // username cua DB
        String password = "123456";//password cua DB
        Connection connection = null;
        try {
            Class.forName(jdbcDriver);
            connection = DriverManager.getConnection(jdbcUrl, username, password);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }
}
