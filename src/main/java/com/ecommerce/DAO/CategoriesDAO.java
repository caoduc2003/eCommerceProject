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
                String sql = "SELECT category_name, description, category_image FROM Categories";
                //3. Create Statement
                stm = connection.prepareStatement(sql);
                //4. Excute Query
                rs = stm.executeQuery();
                //5. Process Result
                while (rs.next()) {
                    String categoryName = rs.getString("category_name");
                    String categoryDescription = rs.getString("description");
                    String categoryImage = rs.getString("category_image");
                    Categories category = new Categories(categoryName, categoryDescription, categoryImage);
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
}
