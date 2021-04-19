package com.cakemanager.service;

import com.cakemanager.model.Contact;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ContactService {
    private static final String INSERT_INTO_CONTACT_NAME_EMAIL_MESSAGE_VALUES = "INSERT INTO contact (name, email, message) VALUES (?, ?, ?);";
    private static final String INSERT_INTO_CONTACT_EMAIL_VALUES = "INSERT INTO contact (email) VALUES (?);";

    public ContactService() {

    }

    public void sendContact(Contact contact) {
        System.out.println(INSERT_INTO_CONTACT_NAME_EMAIL_MESSAGE_VALUES);

        try (Connection connection = DatabaseConection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_CONTACT_NAME_EMAIL_MESSAGE_VALUES)) {
            preparedStatement.setString(1, contact.getName());
            preparedStatement.setString(2, contact.getEmail());
            preparedStatement.setString(3, contact.getMessage());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    private void printSQLException(SQLException e) {
    }

    public void sendEmail(Contact contact) {
        System.out.println(INSERT_INTO_CONTACT_EMAIL_VALUES);

        try (Connection connection = DatabaseConection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_CONTACT_EMAIL_VALUES)) {
            preparedStatement.setString(1, contact.getEmail());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }
}
