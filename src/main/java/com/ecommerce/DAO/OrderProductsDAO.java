package com.ecommerce.DAO;

import com.ecommerce.models.CartItemDTO;
import com.ecommerce.models.OrderPreviewDTO;
import com.ecommerce.models.TransportUnit;
import com.ecommerce.utils.DBContext;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class OrderProductsDAO extends DBContext {
    CartDAO cartDAO = new CartDAO();
    TransportUnitDAO transportUnitDAO = new TransportUnitDAO();

    public void addOrder(String firstName, String lastName, String email, String phone, String addressLine,
                         String country, String city, String district, int userID, String paymentMethod, int transportUnitID, String note) {
        PreparedStatement ps = null;
        try {
            ArrayList<CartItemDTO> cartItems = cartDAO.getCartItemsByUserID(userID);
            TransportUnit transportUnit = transportUnitDAO.getTransportUnitByID(transportUnitID);
            int shippingFee = transportUnit.getTuShipCost();
            int totalPrice = cartDAO.getTotalCartItemsPriceByUserID(userID) + shippingFee;
            int paymentStatus = 1;
            int orderStatus = 1;
            boolean userCancelled = false;
            String sql = "insert into Orders (user_id, order_date, shipping_fee, total_price, payment_method, payment_status, order_state, note,\n" +
                    "                    transport_unit_id, firstname, lastname, email, phone, address_line, country, city, district,\n" +
                    "                    user_cancelled)\n" +
                    "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, userID);
            ps.setDate(2, new java.sql.Date(new java.util.Date().getTime()));
            ps.setInt(3, shippingFee);
            ps.setInt(4, totalPrice);
            ps.setString(5, paymentMethod);
            ps.setInt(6, paymentStatus);
            ps.setInt(7, orderStatus);
            ps.setString(8, note);
            ps.setInt(9, transportUnitID);
            ps.setString(10, firstName);
            ps.setString(11, lastName);
            ps.setString(12, email);
            ps.setString(13, phone);
            ps.setString(14, addressLine);
            ps.setString(15, country);
            ps.setString(16, city);
            ps.setString(17, district);
            ps.setBoolean(18, userCancelled);
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            int orderID = 0;
            if (rs.next()) {
                orderID = rs.getInt(1);
            }
            for (CartItemDTO cartItem : cartItems) {
                addOrderProduct(orderID, cartItem.getProduct().getProductID(), cartItem.getQuantity(), cartItem.getProduct().getProductPrice(),
                        cartItem.getQuantity() * cartItem.getProduct().getProductPrice());
            }
            cartDAO.deleteAllCartItemsByUserID(userID);
        } catch (Exception e) {
            System.err.println(e);
        }
    }

    public void addOrderProduct(int orderID, int productID, int quantity, int unitPrice, int subTotal) {
        PreparedStatement ps = null;
        try {
            String sql = "INSERT INTO OrderDetails(order_id, quantity, unit_price, sub_total, product_id)\n" +
                    "VALUES\n" +
                    "    (\n" +
                    "        ?,\n" +
                    "        ?,\n" +
                    "        ?,\n" +
                    "        ?,\n" +
                    "        ?\n" +
                    "    )";
            ps = connection.prepareStatement(sql);
            ps.setInt(1, orderID);
            ps.setInt(2, quantity);
            ps.setInt(3, unitPrice);
            ps.setInt(4, subTotal);
            ps.setInt(5, productID);
            ps.executeUpdate();
        } catch (Exception e) {
            System.err.println(e);
        }
    }

    public ArrayList<OrderPreviewDTO> getOrderPreviewByUserID(int userID) throws Exception{
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<OrderPreviewDTO> orderPreviewList = new ArrayList<>();

        try {
            String sql = "select o.order_date,\n" +
                    "       o.shipping_fee,\n" +
                    "       o.total_price,\n" +
                    "       o.user_cancelled,\n" +
                    "       o.order_id,\n" +
                    "       od.quantity,\n" +
                    "       od.sub_total,\n" +
                    "       p.product_name,\n" +
                    "       p.product_image,\n" +
                    "       p.price,\n" +
                    "       t.tu_name,\n" +
                    "       os.order_state_name,\n" +
                    "       o.user_cancelled\n" +
                    "from Orders as o\n" +
                    "         join OrderDetails as od on o.order_id = od.order_id\n" +
                    "         join Products as p on od.product_id = p.product_id\n" +
                    "         join TransportUnit t on o.transport_unit_id = t.id\n" +
                    "         join OrderState as os on o.order_state = os.order_state_id\n" +
                    "where user_id = ?;";
            ps = connection.prepareStatement(sql);
            ps.setInt(1, userID);
            rs = ps.executeQuery();
            while(rs.next()){
                OrderPreviewDTO orderPreviewDTO = new OrderPreviewDTO();
                orderPreviewDTO.setOrderID(rs.getInt("order_id"));
                orderPreviewDTO.setOrderDate(rs.getDate("order_date"));
                orderPreviewDTO.setShippingFee(rs.getInt("shipping_fee"));
                orderPreviewDTO.setTotalPrice(rs.getInt("total_price"));
                orderPreviewDTO.setOrderStatus(rs.getString("order_state_name"));
                orderPreviewDTO.setTransportUnitName(rs.getString("tu_name"));
                orderPreviewDTO.setQuantity(rs.getInt("quantity"));
                orderPreviewDTO.setSubTotal(rs.getInt("sub_total"));
                orderPreviewDTO.setProductName(rs.getString("product_name"));
                orderPreviewDTO.setProductImage(rs.getString("product_image"));
                orderPreviewDTO.setPrice(rs.getInt("price"));
                orderPreviewDTO.setUserCancelled(rs.getBoolean("user_cancelled"));
                orderPreviewList.add(orderPreviewDTO);
            }
        } catch (Exception e) {
            System.err.println(e);
        }
        return orderPreviewList;
    }

}
