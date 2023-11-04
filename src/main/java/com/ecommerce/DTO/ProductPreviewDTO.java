package com.ecommerce.DTO;

import com.ecommerce.models.ProductImages;

import java.sql.Date;
import java.util.ArrayList;

public class ProductPreviewDTO {
    private int productID;
    private String productName;
    private String productDescription;
    private String productImage;
    private int productPrice;
    private int categoryID;
    private String categoryName;
    private Date createdDate;
    private ArrayList<ProductImages> productImages;

    public ProductPreviewDTO() {
    }

    public ProductPreviewDTO(int productID, String productName, String productDescription, String productImage, int productPrice, int categoryID, String categoryName, Date createdDate, ArrayList<ProductImages> productImages) {
        this.productID = productID;
        this.productName = productName;
        this.productDescription = productDescription;
        this.productImage = productImage;
        this.productPrice = productPrice;
        this.categoryID = categoryID;
        this.categoryName = categoryName;
        this.createdDate = createdDate;
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

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public ArrayList<ProductImages> getProductImages() {
        return productImages;
    }

    public void setProductImages(ArrayList<ProductImages> productImages) {
        this.productImages = productImages;
    }
}
