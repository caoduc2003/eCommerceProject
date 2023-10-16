package com.ecommerce.DAO;

import com.ecommerce.models.CategoriesDTO;
import com.ecommerce.utils.DBHelper;
import jakarta.servlet.http.HttpServlet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CategoriesDAO extends HttpServlet {

    public List<CategoriesDTO> getAllCategories() throws Exception {
        List<CategoriesDTO> categories = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            //1. Connect DB
            con = DBHelper.makeConnection();
            if (con != null) {
                //2. Create SQL String
                String sql = "SELECT category_name, description, category_image FROM Categories";
                //3. Create Statement
                stm = con.prepareStatement(sql);
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
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return null;
    }
}
