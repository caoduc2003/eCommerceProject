package com.ecommerce.DTO;

import com.ecommerce.models.Products;

import java.io.Serializable;
import java.util.Date;

public class CartItemDTO implements Serializable {
    private Products product;
    private int quantity;
    private int cartId;
    private int userId;
    private Date dateCreated;


    public CartItemDTO() {
    }

    public CartItemDTO(Products product, int quantity, int cartId, int userId, Date dateCreated) {
        this.product = product;
        this.quantity = quantity;
        this.cartId = cartId;
        this.userId = userId;
        this.dateCreated = dateCreated;
    }

    public Products getProduct() {
        return product;
    }

    public void setProduct(Products product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Date getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }
}
