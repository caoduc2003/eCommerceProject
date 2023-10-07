package com.ecommerce.DAO;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ecommerce.models.*;

import com.ecommerce.utils.DBHelper;

public class LoginDAO implements Serializable {
    private final String INVALID_PAGE = null;
    private final String HOME_PAGE = "index.jsp";


    public boolean checkLogin (String username, String password)
            throws SQLException, ClassNotFoundException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            //1. Connect DB
            con = DBHelper.makeConnection();
            if(con!=null){
                //2. Create SQL String
                String sql="SELECT * FROM Users WHERE email = ? AND password = ? ";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, password);
                //4. Excute Query
                rs = stm.executeQuery();
                //5. Process Result
                if(rs.next() && rs.getString("account_status").equals("active")){
                    return true;
                }
            }
        }
        finally{
            if(rs != null){
                rs.close();
            }
            if(stm != null){
                stm.close();
            }
            if(con != null){
                con.close();
            }
        }
        return false;
    }
}
