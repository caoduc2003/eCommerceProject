package com.ecommerce.DAO;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ecommerce.utils.DBContext;
import com.ecommerce.models.UserDTO;

public class UserDAO extends DBContext {

    public UserDTO getUser(String username, String password)
            throws SQLException, ClassNotFoundException {
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1. Connect DB

            if (connection != null) {
                //2. Create SQL String
                String sql = "SELECT * FROM Users WHERE email = ? AND password = ? ";
                //3. Create Statement
                stm = connection.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, password);
                //4. Excute Query
                rs = stm.executeQuery();
                //5. Process Result
                if (rs.next() && rs.getString("account_status").equals("active")) {
                    String firstName = rs.getString("first_name");
                    String lastName = rs.getString("last_name");
                    String email = rs.getString("email");
                    String role = rs.getString("role");
                    return new UserDTO(firstName, lastName, username, email, password, role);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
