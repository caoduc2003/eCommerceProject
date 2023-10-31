package com.ecommerce.models;

public class CategoriesDTO {
    private int categoryID;
    private String categoryName;
    private String categoryDescription;
    private String categoryImage;
    private int totalProducts;
    private boolean isActive;

    public CategoriesDTO() {
    }

    public CategoriesDTO(int categoryID, String categoryName, String categoryDescription, String categoryImage, int totalProducts, boolean isActive) {
        this.categoryID = categoryID;
        this.categoryName = categoryName;
        this.categoryDescription = categoryDescription;
        this.categoryImage = categoryImage;
        this.totalProducts = totalProducts;
        this.isActive = isActive;
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

    public String getCategoryDescription() {
        return categoryDescription;
    }

    public void setCategoryDescription(String categoryDescription) {
        this.categoryDescription = categoryDescription;
    }

    public String getCategoryImage() {
        return categoryImage;
    }

    public void setCategoryImage(String categoryImage) {
        this.categoryImage = categoryImage;
    }

    public int getTotalProducts() {
        return totalProducts;
    }

    public void setTotalProducts(int totalProducts) {
        this.totalProducts = totalProducts;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }
}
