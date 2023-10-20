package com.ecommerce.models;

import javax.swing.*;

public class ProductImages {
    private int productImageID;
    private int productID;
    private String productImage;

    public ProductImages() {
    }

    public ProductImages(int productImageID, int productID, String productImage) {
        this.productImageID = productImageID;
        this.productID = productID;
        this.productImage = productImage;
    }

    public int getProductImageID() {
        return productImageID;
    }

    public void setProductImageID(int productImageID) {
        this.productImageID = productImageID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }
}
