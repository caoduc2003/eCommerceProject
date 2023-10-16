package com.ecommerce.models;

import java.io.Serializable;

public class CategoriesDTO implements Serializable {
    private String categoryName;
    private String categoryDescription;
    private String categoryImage;

    public CategoriesDTO(String categoryName) {
    }

    public CategoriesDTO(String categoryName, String categoryDescription, String categoryImage) {
        this.categoryName = categoryName;
        this.categoryDescription = categoryDescription;
        this.categoryImage = categoryImage;
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

}
