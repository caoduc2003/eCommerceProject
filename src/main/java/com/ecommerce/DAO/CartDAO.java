package com.ecommerce.DAO;

import com.ecommerce.utils.DBContext;

import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CartDAO extends DBContext {
    public void addToCart(int userID, int productVariantID, int quantity) throws Exception{
        try {
            String sql = "INSERT INTO Cart(user_id, variant_id, quantity)\n" +
                    "VALUES\n" +
                    "    (\n" +
                    "        ?,\n" +
                    "        ?,\n" +
                    "        ?\n" +
                    "    )";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userID);
            ps.setInt(2, productVariantID);
            ps.setInt(3, quantity);

            ps.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }


}
