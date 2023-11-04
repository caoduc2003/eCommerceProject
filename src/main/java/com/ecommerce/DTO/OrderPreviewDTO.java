package com.ecommerce.DTO;

import java.sql.Date;

public class OrderPreviewDTO {
    private int orderID;
    private Date orderDate;
    private int shippingFee;
    private int totalPrice;
    private String orderStatus;
    private String transportUnitName;
    private int quantity;
    private int subTotal;
    private String productName;
    private String productImage;
    private int price;
    private boolean userCancelled;

    public OrderPreviewDTO() {
    }

    public OrderPreviewDTO(int orderID, Date orderDate, int shippingFee, int totalPrice, String orderStatus, String transportUnitName, int quantity, int subTotal, String productName, String productImage, int price, boolean userCancelled) {
        this.orderID = orderID;
        this.orderDate = orderDate;
        this.shippingFee = shippingFee;
        this.totalPrice = totalPrice;
        this.orderStatus = orderStatus;
        this.transportUnitName = transportUnitName;
        this.quantity = quantity;
        this.subTotal = subTotal;
        this.productName = productName;
        this.productImage = productImage;
        this.price = price;
        this.userCancelled = userCancelled;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public int getShippingFee() {
        return shippingFee;
    }

    public void setShippingFee(int shippingFee) {
        this.shippingFee = shippingFee;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public String getTransportUnitName() {
        return transportUnitName;
    }

    public void setTransportUnitName(String transportUnitName) {
        this.transportUnitName = transportUnitName;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getSubTotal() {
        return subTotal;
    }

    public void setSubTotal(int subTotal) {
        this.subTotal = subTotal;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public boolean isUserCancelled() {
        return userCancelled;
    }

    public void setUserCancelled(boolean userCancelled) {
        this.userCancelled = userCancelled;
    }
    public int getProductOrderTotalPrice(){
        return this.subTotal + this.shippingFee;
    }

    @Override
    public String toString() {
        return "OrderPreviewDTO{" +
                "orderID=" + orderID +
                ", orderDate=" + orderDate +
                ", shippingFee=" + shippingFee +
                ", totalPrice=" + totalPrice +
                ", orderStatus='" + orderStatus + '\'' +
                ", transportUnitName='" + transportUnitName + '\'' +
                ", quantity=" + quantity +
                ", subTotal=" + subTotal +
                ", productName='" + productName + '\'' +
                ", productImage='" + productImage + '\'' +
                ", price=" + price +
                ", userCancelled=" + userCancelled +
                '}';
    }
}
