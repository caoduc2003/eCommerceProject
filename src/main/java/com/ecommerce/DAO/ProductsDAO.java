package com.ecommerce.DAO;

import com.ecommerce.models.ProductImages;
import com.ecommerce.models.ProductPreviewDTO;
import com.ecommerce.models.Products;
import com.ecommerce.utils.DBContext;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductsDAO extends DBContext {

    public List<Products> getAllProducts() throws Exception {
        List<Products> products = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            if (connection != null) {
                //2. Create SQL String
                String sql = "SELECT product_id, product_name, category_id, description, product_image, price FROM Products";
                //3. Create Statement
                stm = connection.prepareStatement(sql);
                //4. Excute Query
                rs = stm.executeQuery();
                //5. Process Result
                while (rs.next()) {
                    int productID = rs.getInt("product_id");
                    String productName = rs.getString("product_name");
                    int categoryID = rs.getInt("category_id");
                    String productDescription = rs.getString("description");
                    String productImage = rs.getString("product_image");
                    int productPrice = rs.getInt("price");
                    Products product = new Products(productID, productName, productDescription, productImage, productPrice, categoryID ,null, null);
                    products.add(product);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return products;
    }

    public Products getProduct(int product_ID) throws Exception {
        PreparedStatement stm = null;
        ResultSet rs = null;
        Products productResult = null;
        try {
            //1. Connect DB

            if (connection != null) {
                //2. Create SQL String
                String sql = "SELECT product_id, product_name, category_id, description, product_image, price "
                        + "FROM Products "
                        + "WHERE product_id = ?";
                //3. Create Statement
                stm = connection.prepareStatement(sql);
                stm.setString(1, String.valueOf(product_ID));
                //4. Excute Query
                rs = stm.executeQuery();
                //5. Process Result

                if (rs.next()) {
                    int productID = rs.getInt(1);
                    String productName = rs.getString(2);
                    int categoryID = rs.getInt(3);
                    String productDescription = rs.getString(4);
                    String productImage = rs.getString(5);
                    int productPrice = rs.getInt(6);
                    productResult = new Products(productID, productName, productDescription, productImage, productPrice, categoryID , null, null);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return productResult;
    }

    public List<Products> getProductsByCategory(int category_id) throws Exception {
        PreparedStatement stm = null;
        ResultSet rs = null;

        List<Products> products = new ArrayList<>();

        try {
            if (connection != null) {
                String sql = "SELECT product_id, product_name, category_id, description, product_image, price "
                        + "FROM Products "
                        + "WHERE category_id = ?";
                stm = connection.prepareStatement(sql);
                stm.setInt(1, category_id);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int productID = rs.getInt(1);
                    String productName = rs.getString(2);
                    int categoryID = rs.getInt(3);
                    String productDescription = rs.getString(4);
                    String productImage = rs.getString(5);
                    int productPrice = rs.getInt(6);
                    Products product = new Products(productID, productName, productDescription, productImage, productPrice, categoryID, null, null);
                    products.add(product);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return products;
    }

    public int getNumberOfProducts() throws Exception {
        PreparedStatement stm = null;
        ResultSet rs = null;
        int numberOfProducts = 0;
        try {
            if (connection != null) {
                String sql = "SELECT COUNT(*) FROM Products";
                stm = connection.prepareStatement(sql);
                rs = stm.executeQuery();
                if (rs.next()) {
                    numberOfProducts = rs.getInt(1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return numberOfProducts;
    }

    public int getLastProductID() throws Exception{
        PreparedStatement stm = null;
        ResultSet rs = null;
        int lastProductID = 0;
        try {
            if (connection != null) {
                String sql = "SELECT TOP 1 product_id FROM Products ORDER BY product_id DESC";
                stm = connection.prepareStatement(sql);
                rs = stm.executeQuery();
                if (rs.next()) {
                    lastProductID = rs.getInt(1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lastProductID;
    }



    public List<ProductImages> getImagesByProductID(int productID) throws Exception{
        List<ProductImages> images = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            if (connection != null) {
                String sql = "SELECT * FROM ProductImages WHERE product_id = ?";
                stm = connection.prepareStatement(sql);
                stm.setInt(1, productID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int imageID = rs.getInt(1);
                    int productIDResult = rs.getInt(2);
                    String imageData = rs.getString(3);
                    ProductImages image = new ProductImages(imageID, productIDResult, imageData);
                    images.add(image);
                }
            }
        } catch (Exception e){
            System.err.println(e);
        }
        return images;
    }

    public void addProducts(Products productObj) throws Exception{
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            if (connection != null) {
                String sql = "INSERT INTO Products(product_name, category_id, description, product_image, price) VALUES(?,?,?,?,?,?)";
                stm = connection.prepareStatement(sql);
                stm.setString(1, productObj.getProductName());
                stm.setInt(2, productObj.getCategoryID());
                stm.setString(3, productObj.getProductDescription());
                stm.setString(4, productObj.getProductImage());
                stm.setInt(5, productObj.getProductPrice());
                stm.executeUpdate();
            }
        } catch (Exception e){
            System.err.println(e);
        }
    }

    public List<ProductPreviewDTO> getAllProductsPreview() throws Exception {
        List<ProductPreviewDTO> products = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            if (connection != null) {
                //2. Create SQL String
                String sql = "SELECT p.product_id,\n" +
                        "       p.product_name,\n" +
                        "       p.price,\n" +
                        "       p.product_image,\n" +
                        "       p.description,\n" +
                        "       p.created_date,\n" +
                        "       c.category_id,\n" +
                        "       c.category_name\n" +
                        "FROM Products p\n" +
                        "         JOIN dbo.Categories c on p.category_id = c.category_id";
                //3. Create Statement
                stm = connection.prepareStatement(sql);
                //4. Excute Query
                rs = stm.executeQuery();
                //5. Process Result
                while (rs.next()) {
                    ProductPreviewDTO product = new ProductPreviewDTO();
                    product.setProductID(rs.getInt("product_id"));
                    product.setProductName(rs.getString("product_name"));
                    product.setProductPrice(rs.getInt("price"));
                    product.setProductImage(rs.getString("product_image"));
                    product.setProductDescription(rs.getString("description"));
                    product.setCreatedDate(rs.getDate("created_date"));
                    product.setCategoryID(rs.getInt("category_id"));
                    product.setCategoryName(rs.getString("category_name"));
                    product.setProductImages(null);
                    products.add(product);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return products;
    }
    public int updateProduct(Products productObj) throws Exception{
        PreparedStatement stm = null;
        try{
            if (connection != null) {
                String sql = "UPDATE Products\n" +
                        "SET product_name  = ?,\n" +
                        "    category_id   = ?,\n" +
                        "    description   = ?,\n" +
                        "    product_image = ?,\n" +
                        "    price         = ?\n" +
                        "WHERE product_id = ?";
                stm = connection.prepareStatement(sql);
                stm.setString(1, productObj.getProductName());
                stm.setInt(2, productObj.getCategoryID());
                stm.setString(3, productObj.getProductDescription());
                stm.setString(4, productObj.getProductImage());
                stm.setInt(5, productObj.getProductPrice());
                stm.setInt(6, productObj.getProductID());
                if(stm.executeUpdate() > 0){
                    return 1;
                }
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return 0;
    }

    public boolean addProduct (Products p) throws Exception {
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            if (connection != null) {
                String sql = "INSERT INTO Products(product_name, category_id, description, product_image, price, created_date) VALUES(?,?,?,?,?,?)";
                stm = connection.prepareStatement(sql);
                stm.setString(1, p.getProductName());
                stm.setInt(2, p.getCategoryID());
                stm.setString(3, p.getProductDescription());
                stm.setString(4, p.getProductImage());
                stm.setInt(5, p.getProductPrice());
                stm.setDate(6, p.getDateCreated());
                if (stm.executeUpdate() > 0) {
                    return true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean canDeleteProduct(int productID) throws Exception{
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            if (connection != null) {
                String sql = "SELECT (Select (SELECT COUNT(*) FROM ProductImages WHERE product_id = ?) +\n" +
                        "               (SELECT COUNT(*) FROM ProductVariants WHERE product_id = ?) +\n" +
                        "               (Select COUNT(*) FROM Cart WHERE product_id = ?) +\n" +
                        "               (SELECT COUNT(*) FROM OrderDetails WHERE product_id = ?) +\n" +
                        "               (SELECT COUNT(*) FROM Reviews WHERE product_id = ?)) AS TotalCount\n" +
                        "FROM Products\n" +
                        "WHERE product_id = ?;";
                stm = connection.prepareStatement(sql);
                stm.setInt(1, productID);
                stm.setInt(2, productID);
                stm.setInt(3, productID);
                stm.setInt(4, productID);
                stm.setInt(5, productID);
                stm.setInt(6, productID);
                rs = stm.executeQuery();
                if(rs.next() && rs.getInt("TotalCount") > 0){
                    return false;
                }
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return true;
    }
    public int deleteProduct(int productID) throws Exception{
        PreparedStatement stm = null;
        try{
            if (connection != null) {
                String sql = "DELETE FROM Products WHERE product_id = ?";
                stm = connection.prepareStatement(sql);
                stm.setInt(1, productID);
                if(stm.executeUpdate() > 0){
                    return 1;
                }
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return 0;
    }
}

