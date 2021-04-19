package com.cakemanager.model;

public class OrderDetails {
    private int productId;
    private int orderId;
    private float salePrice;
    private int quantityProduct;
    private String productName;

    public OrderDetails() {

    }

    public OrderDetails(int productId, String productName, int orderId, float salePrice, int quantityProduct) {
        this.productId = productId;
        this.orderId = orderId;
        this.salePrice = salePrice;
        this.quantityProduct = quantityProduct;
        this.productName = productName;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public float getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(float salePrice) {
        this.salePrice = salePrice;
    }

    public int getQuantityProduct() {
        return quantityProduct;
    }

    public void setQuantityProduct(int quantityProduct) {
        this.quantityProduct = quantityProduct;
    }
}
