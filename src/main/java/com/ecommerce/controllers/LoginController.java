package com.ecommerce.controllers;

import com.ecommerce.DAO.LoginDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {
    private static final String INVALID_PAGE = null;
    private static final String LOGIN_PAGE = "login.jsp";
    private static final String HOME_PAGE = "index.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = LOGIN_PAGE;
        String button = request.getParameter("btAction");
        String username = request.getParameter("txtEmail");
        String password = request.getParameter("txtPassword");
        try {
            if (button == null) {
                url = LOGIN_PAGE;
            } else if (button.equals("Login")) {
                LoginDAO dao = new LoginDAO();
                boolean result = dao.checkLogin(username, password);
                if (result) {
                    url = HOME_PAGE;
                    HttpSession session = request.getSession();
                    session.setAttribute("USERNAME", username);
                } // End if username and password matched
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            response.sendRedirect(url);
//            RequestDispatcher rd = request.getRequestDispatcher(url);
//            rd.forward(request, response);
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }
}
