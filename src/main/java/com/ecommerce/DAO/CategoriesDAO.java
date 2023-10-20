package com.ecommerce.DAO;

import com.ecommerce.models.CategoriesDTO;
import com.ecommerce.utils.DBContext;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CategoriesDAO extends DBContext {

    public List<CategoriesDTO> getAllCategories() throws Exception {
        List<CategoriesDTO> categories = new ArrayList<>();
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
                        CategoriesDTO category = new CategoriesDTO(categoryName,categoryDescription, categoryImage);
                        categories.add(category);
                }
                return categories;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
