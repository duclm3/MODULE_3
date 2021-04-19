package com.cakemanager.model;

public class Contact {
    private int contactId;
    private String name;
    private String email;
    private String message;

    public Contact() {

    }

    public Contact(int contactId, String name, String email, String message) {
        this.contactId = contactId;
        this.name = name;
        this.email = email;
        this.message = message;
    }

    public Contact(String name, String email, String message) {
        this.name = name;
        this.email = email;
        this.message = message;
    }

    public Contact(String email) {
        this.email = email;
    }

    public int getContactId() {
        return contactId;
    }

    public void setContactId(int contactId) {
        this.contactId = contactId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
