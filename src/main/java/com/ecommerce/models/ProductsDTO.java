package com.ecommerce.models;

import java.io.Serializable;
import java.lang.reflect.Array;
import java.util.ArrayList;

public class ProductsDTO implements Serializable {
    private int productID;
    private String productName;
    private String productDescription;
    private String productImage;
    private int productPrice;
    private int categoryID;


    public ProductsDTO() {
    }

    public ProductsDTO(int productID, String productName, String productDescription, String productImage, int productPrice, int categoryID) {
        this.productID = productID;
        this.productName = productName;
        this.productDescription = productDescription;
        this.productImage = productImage;
        this.productPrice = productPrice;
        this.categoryID = categoryID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    public int getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(int productPrice) {
        this.productPrice = productPrice;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    @Override
    public String toString() {
        return "ProductsDTO{" +
                "productID=" + productID +
                ", productName='" + productName + '\'' +
                ", productDescription='" + productDescription + '\'' +
                ", productImage='" + productImage + '\'' +
                ", productPrice=" + productPrice +
                ", categoryID=" + categoryID +
                '}';
    }
}
