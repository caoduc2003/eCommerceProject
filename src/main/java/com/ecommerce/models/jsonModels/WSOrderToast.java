package com.ecommerce.models.jsonModels;

public class WSOrderToast {
    private String name;
    private int totalItems;
    private int totalPrice;

    public WSOrderToast() {
    }

    public WSOrderToast(String name, int totalItems, int totalPrice) {
        this.name = name;
        this.totalItems = totalItems;
        this.totalPrice = totalPrice;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getTotalItems() {
        return totalItems;
    }

    public void setTotalItems(int totalItems) {
        this.totalItems = totalItems;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    @Override
    public String toString() {
        return "WSOrderToast{" +
                "name='" + name + '\'' +
                ", totalItems=" + totalItems +
                ", totalPrice=" + totalPrice +
                '}';
    }
}
