package com.cakemanager.model;

public class Product {
    private int productId;
    private String name;
    private float unitPrice;
    private int quantityStock;
    private String productDescription;
    private String thumbnail;
    private int categoryId;
    private Category category;

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Product(int productId, String name, float unitPrice, int quantityStock, String productDescription, String thumbnail, int categoryId, Category category) {
        this.productId = productId;
        this.name = name;
        this.unitPrice = unitPrice;
        this.quantityStock = quantityStock;
        this.productDescription = productDescription;
        this.thumbnail = thumbnail;
        this.categoryId = categoryId;
        this.category = category;
    }

    public Product() {

    }

    public Product(int productId, String name, float unitPrice, int quantityStock, String productDescription, String thumbnail, int categoryId) {
        this.productId = productId;
        this.name = name;
        this.unitPrice = unitPrice;
        this.quantityStock = quantityStock;
        this.productDescription = productDescription;
        this.thumbnail = thumbnail;
        this.categoryId = categoryId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(float unitPrice) {
        this.unitPrice = unitPrice;
    }

    public int getQuantityStock() {
        return quantityStock;
    }

    public void setQuantityStock(int quantityStock) {
        this.quantityStock = quantityStock;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }
}
