package com.entity;

public class Customer {
    private int id;
    private String name;
    private String birthday;
    private String address;
    private String images;

    public Customer(String name, String birthday, String images, String address) {
        this.name = name;
        this.birthday = birthday;
        this.address = address;
        this.images = images;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Customer(int id, String name, String birthday, String address, String images) {
        this.id = id;
        this.name = name;
        this.birthday = birthday;
        this.address = address;
        this.images = images;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }
}
