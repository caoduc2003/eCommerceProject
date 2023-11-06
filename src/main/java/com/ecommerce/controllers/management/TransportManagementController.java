package com.ecommerce.controllers.management;

import java.io.IOException;
import java.io.PrintWriter;

import com.ecommerce.DAO.TransportUnitDAO;
import com.ecommerce.models.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "TransportManagementController", urlPatterns = { "/transport-unit-management/*" })
public class TransportManagementController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        User u = (User) request.getSession().getAttribute("user");
        if (u == null || !u.getRole().equalsIgnoreCase("admin")) {
            response.sendRedirect(request.getContextPath() + "/home");
            return;
        }
        try {
            TransportUnitDAO dao = new TransportUnitDAO();
            request.setAttribute("transportUnitsList", dao.getAllTransportUnit());
            request.getRequestDispatcher("/admin/AdminTU.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}