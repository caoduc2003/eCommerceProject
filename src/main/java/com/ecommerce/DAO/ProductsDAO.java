package com.ecommerce.DAO;

import com.ecommerce.models.ProductsDTO;
import com.ecommerce.utils.DBContext;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductsDAO extends DBContext {

    public List<ProductsDTO> getAllProducts() throws Exception {
        List<ProductsDTO> products = new ArrayList<>();
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
                    ProductsDTO product = new ProductsDTO(productID, productName, productDescription, productImage, productPrice, categoryID);
                    products.add(product);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return products;
    }

    public ProductsDTO getProduct(int product_ID) throws Exception {
        PreparedStatement stm = null;
        ResultSet rs = null;
        ProductsDTO productResult = null;
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
                    productResult = new ProductsDTO(productID, productName, productDescription, productImage, productPrice, categoryID);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return productResult;
    }

    public List<ProductsDTO> getProductsByCategory(int category_id) throws Exception {
        PreparedStatement stm = null;
        ResultSet rs = null;

        List<ProductsDTO> products = new ArrayList<>();

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
                    ProductsDTO product = new ProductsDTO(productID, productName, productDescription, productImage, productPrice, categoryID);
                    products.add(product);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return products;
    }
}

