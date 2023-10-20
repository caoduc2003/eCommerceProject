package com.ecommerce.models;

public class ProductVariants {
    private int variantID;
    private int productID;
    private String variantName;
    private int variantPrice;
    private int variantStock;
    private int variantSold;

    public ProductVariants() {
    }

    public ProductVariants(int variantID, int productID, String variantName, int variantPrice, int variantStock, int variantSold) {
        this.variantID = variantID;
        this.productID = productID;
        this.variantName = variantName;
        this.variantPrice = variantPrice;
        this.variantStock = variantStock;
        this.variantSold = variantSold;
    }

    public int getVariantID() {
        return variantID;
    }

    public void setVariantID(int variantID) {
        this.variantID = variantID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getVariantName() {
        return variantName;
    }

    public void setVariantName(String variantName) {
        this.variantName = variantName;
    }

    public int getVariantPrice() {
        return variantPrice;
    }

    public void setVariantPrice(int variantPrice) {
        this.variantPrice = variantPrice;
    }

    public int getVariantStock() {
        return variantStock;
    }

    public void setVariantStock(int variantStock) {
        this.variantStock = variantStock;
    }

    public int getVariantSold() {
        return variantSold;
    }

    public void setVariantSold(int variantSold) {
        this.variantSold = variantSold;
    }
}
