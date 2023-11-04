package com.ecommerce.DAO;

import com.ecommerce.DTO.CartItemDTO;
import com.ecommerce.models.Products;
import com.ecommerce.utils.DBContext;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

public class CartDAO extends DBContext {
    public int addToCart(int userID, int productID, int quantity) throws Exception {
        try {
            String sql = "INSERT INTO Cart(cart_id,user_id, product_id, quantity)\n" +
                    "VALUES\n" +
                    "    (\n" +
                    "        ?,\n" +
                    "        ?,\n" +
                    "        ?,\n" +
                    "        ?\n" +
                    "    )";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userID);
            ps.setInt(2, userID);
            ps.setInt(3, productID);
            ps.setInt(4, quantity);
            ps.executeUpdate();
            if (ps.getUpdateCount() > 0) {
                return 1;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return 0;
    }

    public ArrayList<CartItemDTO> getCartItemsByUserID(int userID) throws Exception {
        ArrayList<CartItemDTO> cartItems = new ArrayList<>();
        try {
            String sql = "SELECT\n" +
                    "       c.cart_id       as CartId,\n" +
                    "       c.user_id       as UserId,\n" +
                    "       c.product_id    as ProductId,\n" +
                    "       SUM(c.quantity) as Quantity,\n" +
                    "       c.date_created  as DateCreated,\n" +
                    "       p.product_name  as ProductName,\n" +
                    "       p.category_id   as CategoryId,\n" +
                    "       p.description   as Description,\n" +
                    "       p.product_image as ProductImage,\n" +
                    "       p.price         as Price\n" +
                    "FROM Cart c\n" +
                    "JOIN dbo.Products p ON p.product_id = c.product_id\n" +
                    "WHERE c.user_id = ?\n" +
                    "GROUP BY c.product_id, c.cart_id, c.user_id, c.date_created, p.product_name, p.category_id, p.description, p.product_image, p.price";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int cartId = rs.getInt("CartId");
                int userId = rs.getInt("UserId");
                int productId = rs.getInt("ProductId");
                int quantity = rs.getInt("Quantity");
                // get sql date and convert to java date
                java.sql.Date dateCreated = rs.getDate("DateCreated");
                Date javaDateCreated = new Date(dateCreated.getTime());
                String productName = rs.getString("ProductName");
                int categoryId = rs.getInt("CategoryId");
                String description = rs.getString("Description");
                String productImage = rs.getString("ProductImage");
                int price = rs.getInt("Price");
                Products product = new Products(productId, productName, description, productImage, price, categoryId, null, null);
                CartItemDTO cartItem = new CartItemDTO(product, quantity, cartId, userId, javaDateCreated);
                cartItems.add(cartItem);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return cartItems;
    }

    public int getTotalCartItemsByUserID(int userID) throws Exception{
        ArrayList<CartItemDTO> cartItems = getCartItemsByUserID(userID);
        return cartItems.size();
    }

    public int getTotalCartItemsPriceByUserID(int userID) throws Exception{
        ArrayList<CartItemDTO> cartItems = getCartItemsByUserID(userID);
        int totalPrice = 0;
        for (CartItemDTO cartItem : cartItems) {
            totalPrice += cartItem.getProduct().getProductPrice() * cartItem.getQuantity();
        }
        return totalPrice;
    }

    public void deleteAllCartItemsByUserID(int userID) throws Exception {
        PreparedStatement ps = null;
        try {
            String sql = "DELETE FROM Cart WHERE user_id = ?";
            ps = connection.prepareStatement(sql);
            ps.setInt(1, userID);
            ps.executeUpdate();
        } catch (Exception e) {
            System.err.println(e);
        }
    }
}
