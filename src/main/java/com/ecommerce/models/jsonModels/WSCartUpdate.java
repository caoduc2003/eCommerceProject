package com.ecommerce.models.jsonModels;

public class WSCartUpdate {
    private int itemCount;
    private int cartTotal;

    public WSCartUpdate() {
    }

    public WSCartUpdate(int itemCount, int cartTotal) {
        this.itemCount = itemCount;
        this.cartTotal = cartTotal;
    }

    public int getItemCount() {
        return itemCount;
    }

    public void setItemCount(int itemCount) {
        this.itemCount = itemCount;
    }

    public int getCartTotal() {
        return cartTotal;
    }

    public void setCartTotal(int cartTotal) {
        this.cartTotal = cartTotal;
    }
}
