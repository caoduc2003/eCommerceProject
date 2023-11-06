package com.ecommerce.controllers;

import com.ecommerce.DAO.UserDAO;
import com.ecommerce.models.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LoginController", urlPatterns = {"/login/*"})
public class LoginController extends HttpServlet {
    private static final String INVALID_PAGE = "errorPage.jsp";
    private static final String LOGIN_PAGE = "login.jsp";
    private static final String HOME_PAGE = "home";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        if (session.getAttribute("user") != null) {
            response.sendRedirect(HOME_PAGE);
        } else {
            request.getRequestDispatcher(LOGIN_PAGE).forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = resp.getWriter()) {
            resp.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            HttpSession session = req.getSession();
            UserDAO userDAO = new UserDAO();
            if (session.getAttribute("user") != null) {
                out.print("already-logged");
            } else {
                String email = req.getParameter("email");
                String password = req.getParameter("password");
                User account = userDAO.getUserByEmail(email);

                if (account == null) {
                    out.print("wrong-email");
                    req.getSession().setAttribute("user", null);
                    return;
                }
                if (!account.getPassword().equals(password)) {
                    out.print("wrong-password");
                    req.getSession().setAttribute("user", null);
                    return;
                }
                if (account.getAccountStatus().equals("Banned")) {
                    out.print("banned");
                    req.getSession().setAttribute("user", null);
                    return;
                }
                session.setAttribute("user", account);
                out.print("success");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
