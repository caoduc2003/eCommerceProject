package com.ecommerce.DAO;

import com.ecommerce.models.Categories;
import com.ecommerce.models.CategoriesDTO;
import com.ecommerce.utils.DBContext;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CategoriesDAO extends DBContext {

    public List<Categories> getAllCategories() throws Exception {
        List<Categories> categories = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            if (connection != null) {
                //2. Create SQL String
                String sql = "SELECT category_name, description, category_image, is_active FROM Categories";
                //3. Create Statement
                stm = connection.prepareStatement(sql);
                //4. Excute Query
                rs = stm.executeQuery();
                //5. Process Result
                while (rs.next()) {
                    String categoryName = rs.getString("category_name");
                    String categoryDescription = rs.getString("description");
                    String categoryImage = rs.getString("category_image");
                    boolean isActive = rs.getBoolean("is_active");
                    Categories category = new Categories(-1,categoryName, categoryDescription, categoryImage, isActive);
                    categories.add(category);
                }
                return categories;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<CategoriesDTO> getAllCategoriesDetails() throws Exception {
        List<CategoriesDTO> categories = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            if (connection != null) {
                //2. Create SQL String
                String sql = "SELECT c.category_id,\n" +
                        "       c.category_name,\n" +
                        "       c.description,\n" +
                        "       c.category_image,\n" +
                        "       c.is_active,\n" +
                        "       COUNT(p.product_id) AS total_products\n" +
                        "FROM Categories c\n" +
                        "         LEFT JOIN Products p ON c.category_id = p.category_id\n" +
                        "GROUP BY c.category_id,\n" +
                        "         c.category_name,\n" +
                        "         c.description,\n" +
                        "         c.category_image,\n" +
                        "         c.is_active";
                //3. Create Statement
                stm = connection.prepareStatement(sql);
                //4. Excute Query
                rs = stm.executeQuery();
                //5. Process Result
                while (rs.next()) {
                    CategoriesDTO category = new CategoriesDTO();
                    category.setCategoryID(rs.getInt("category_id"));
                    category.setCategoryName(rs.getString("category_name"));
                    category.setCategoryDescription(rs.getString("description"));
                    category.setCategoryImage(rs.getString("category_image"));
                    category.setActive(rs.getBoolean("is_active"));
                    category.setTotalProducts(rs.getInt("total_products"));
                    categories.add(category);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return categories;
    }

    public Categories getCategoryByID(int id) throws Exception {
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            if (connection != null) {
                //2. Create SQL String
                String sql = "SELECT category_name, description, category_image, is_active FROM Categories WHERE category_id = ?";
                //3. Create Statement
                stm = connection.prepareStatement(sql);
                stm.setInt(1, id);
                //4. Excute Query
                rs = stm.executeQuery();
                //5. Process Result
                if (rs.next()) {
                    String categoryName = rs.getString("category_name");
                    String categoryDescription = rs.getString("description");
                    String categoryImage = rs.getString("category_image");
                    boolean isActive = rs.getBoolean("is_active");
                    return new Categories(-1,categoryName, categoryDescription, categoryImage, isActive);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateCategoryByID(Categories category) throws Exception {
        PreparedStatement stm = null;
        try {
            if (connection != null) {
                //2. Create SQL String
                String sql = "UPDATE Categories SET category_name = ?, description = ?, category_image = ?, is_active = ? WHERE category_id = ?";
                //3. Create Statement
                stm = connection.prepareStatement(sql);
                stm.setString(1, category.getCategoryName());
                stm.setString(2, category.getCategoryDescription());
                stm.setString(3, category.getCategoryImage());
                stm.setBoolean(4, category.isActive());
                stm.setInt(5, category.getCategoryID());
                //4. Excute Query
                int row = stm.executeUpdate();
                //5. Process Result
                if (row > 0) {
                    return true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean addCategory(Categories c) throws Exception {
        PreparedStatement stm = null;
        try {
            if (connection != null) {
                //2. Create SQL String
                String sql = "INSERT INTO Categories(category_name, description, category_image, is_active) VALUES(?,?,?,?)";
                //3. Create Statement
                stm = connection.prepareStatement(sql);
                stm.setString(1, c.getCategoryName());
                stm.setString(2, c.getCategoryDescription());
                stm.setString(3, c.getCategoryImage());
                stm.setBoolean(4, c.isActive());
                //4. Excute Query
                int row = stm.executeUpdate();
                //5. Process Result
                if (row > 0) {
                    return true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
