package com.ecommerce.controllers;

import java.io.IOException;
import java.util.ArrayList;

import com.ecommerce.DAO.CartDAO;
import com.ecommerce.DAO.OrderProductsDAO;
import com.ecommerce.DAO.TransportUnitDAO;
import com.ecommerce.DTO.CartItemDTO;
import com.ecommerce.models.TransportUnit;
import com.ecommerce.models.User;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "CheckoutController", urlPatterns = {"/checkout/*"})
public class CheckoutController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        User u = (User) request.getSession().getAttribute("user");
        if (u == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        CartDAO dao = new CartDAO();
        TransportUnitDAO transportUnitDAO = new TransportUnitDAO();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        try {
            ArrayList<CartItemDTO> cartItems = dao.getCartItemsByUserID(user.getUserID());
            ArrayList<TransportUnit> transportUnits = transportUnitDAO.getAllTransportUnit();
            int total = dao.getTotalCartItemsPriceByUserID(user.getUserID());
            request.setAttribute("cartItems", cartItems);
            request.setAttribute("total", total);
            request.setAttribute("transportUnits", transportUnits);

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        RequestDispatcher rd = request.getRequestDispatcher("Checkout.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User currUser = (User) session.getAttribute("user");
        String path = request.getPathInfo().substring(1);
        try {
            switch (path) {
                case "submit":
                    String firstName = request.getParameter("firstName");
                    String lastName = request.getParameter("lastName");
                    String email = request.getParameter("email");
                    String phone = request.getParameter("phoneNum");
                    String address_line = request.getParameter("addressLine");
                    String country = request.getParameter("country");
                    String city = request.getParameter("city");
                    String district = request.getParameter("district");
                    String note = request.getParameter("note");
                    String paymentMethod = request.getParameter("paymentMethod");
                    int transportUnitID = Integer.parseInt(request.getParameter("transportUnit"));
                    OrderProductsDAO opdao = new OrderProductsDAO();
                    opdao.addOrder(firstName, lastName, email, phone, address_line, country, city, district, currUser.getUserID(), paymentMethod, transportUnitID, note);
                    System.out.println("Order submitted");
                    break;
                default:
                    processRequest(request, response);
                    break;
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}