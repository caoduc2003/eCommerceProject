package com.ecommerce.controllers;

import java.io.IOException;
import java.io.PrintWriter;

import com.ecommerce.DAO.OrderProductsDAO;
import com.ecommerce.models.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "OrderController", urlPatterns = {"/order/*"})
public class OrderController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            OrderProductsDAO opDAO = new OrderProductsDAO();
            if (user == null) {
                response.sendRedirect("/login");
            } else {
                request.setAttribute("ordersList", opDAO.getOrderPreviewByUserID(user.getUserID()));
                request.getRequestDispatcher("Order.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
}