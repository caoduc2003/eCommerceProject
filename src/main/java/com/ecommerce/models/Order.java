package com.ecommerce.models;

import java.util.ArrayList;
import java.util.Date;

public class Order {
    private int orderID;
    private int userID;
    private Date orderDate;
    private int shippingFee;
    private int totalPrice;
    private int paymentMethod;
    private int paymentStatus;
    private int orderStatus;
    private String note;
    private int transportUnitID;
    private String firstName;
    private String lastName;
    private String email;
    private String phone;
    private String addressLine;
    private String country;
    private String city;
    private String district;
    private boolean userCancelled;
    private ArrayList<ProductOrder> productOrders;

    public Order() {
    }

    public Order(int orderID, int userID, Date orderDate, int shippingFee, int totalPrice, int paymentMethod, int paymentStatus, int orderStatus, String note, int transportUnitID, String firstName, String lastName, String email, String phone, String addressLine, String country, String city, String district, boolean userCancelled, ArrayList<ProductOrder> productOrders) {
        this.orderID = orderID;
        this.userID = userID;
        this.orderDate = orderDate;
        this.shippingFee = shippingFee;
        this.totalPrice = totalPrice;
        this.paymentMethod = paymentMethod;
        this.paymentStatus = paymentStatus;
        this.orderStatus = orderStatus;
        this.note = note;
        this.transportUnitID = transportUnitID;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phone = phone;
        this.addressLine = addressLine;
        this.country = country;
        this.city = city;
        this.district = district;
        this.userCancelled = userCancelled;
        this.productOrders = productOrders;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
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

    public int getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(int paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public int getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(int paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public int getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(int orderStatus) {
        this.orderStatus = orderStatus;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public int getTransportUnitID() {
        return transportUnitID;
    }

    public void setTransportUnitID(int transportUnitID) {
        this.transportUnitID = transportUnitID;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddressLine() {
        return addressLine;
    }

    public void setAddressLine(String addressLine) {
        this.addressLine = addressLine;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public boolean isUserCancelled() {
        return userCancelled;
    }

    public void setUserCancelled(boolean userCancelled) {
        this.userCancelled = userCancelled;
    }

    public ArrayList<ProductOrder> getProductOrders() {
        return productOrders;
    }

    public void setProductOrders(ArrayList<ProductOrder> productOrders) {
        this.productOrders = productOrders;
    }
}
