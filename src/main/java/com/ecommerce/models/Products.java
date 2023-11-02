package com.ecommerce.models;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;

public class Products implements Serializable {
    private int productID;
    private String productName;
    private String productDescription;
    private String productImage;
    private int productPrice;
    private int categoryID;
    private Date dateCreated;
    private ArrayList<ProductImages> productImages;


    public Products() {
    }

    public Products(int productID, String productName, String productDescription, String productImage, int productPrice, int categoryID, Date dateCreated, ArrayList<ProductImages> productImages) {
        this.productID = productID;
        this.productName = productName;
        this.productDescription = productDescription;
        this.productImage = productImage;
        this.productPrice = productPrice;
        this.categoryID = categoryID;
        this.dateCreated = dateCreated;
        this.productImages = productImages;
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

    public Date getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    public ArrayList<ProductImages> getProductImages() {
        return productImages;
    }

    public void setProductImages(ArrayList<ProductImages> productImages) {
        this.productImages = productImages;
    }

    @Override
    public String toString() {
        return "Products{" +
                "productID=" + productID +
                ", productName='" + productName + '\'' +
                ", productDescription='" + productDescription + '\'' +
                ", productImage='" + productImage + '\'' +
                ", productPrice=" + productPrice +
                ", categoryID=" + categoryID +
                ", dateCreated=" + dateCreated +
                ", productImages=" + productImages +
                '}';
    }
}
