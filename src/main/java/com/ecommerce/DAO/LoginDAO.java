package com.ecommerce.DAO;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.ecommerce.models.*;

import com.ecommerce.utils.DBHelper;

public class LoginDAO implements Serializable {
    private final String INVALID_PAGE = "invalid.html";
    private final String HOME_PAGE = "index.html";

    public String checkLogin(String email, String password) throws Exception {
        String url = INVALID_PAGE;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT * FROM Users WHERE email = ? AND password = ?";
            con = DBHelper.makeConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            rs = ps.executeQuery();
            if (rs.next() && rs.getString("account_status").equals("Active")){
                url = HOME_PAGE;
            }
        } finally {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        }
        return url;
    }
}
