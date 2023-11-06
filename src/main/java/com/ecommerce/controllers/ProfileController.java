/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package com.ecommerce.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;

import com.ecommerce.DAO.UserDAO;
import com.ecommerce.models.User;
import jakarta.jms.Session;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * @author brian
 */
@WebServlet(name = "ProfileController", urlPatterns = {"/account/*"})
public class ProfileController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            User u = (User) request.getSession().getAttribute("user");
            if (u == null) {
                response.sendRedirect(request.getContextPath() + "/login");
                return;
            }
            RequestDispatcher rd = request.getRequestDispatcher("Profile.jsp");
            rd.forward(request, response);
        } catch (Exception e){
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try(PrintWriter out = response.getWriter()) {
            UserDAO dao = new UserDAO();
            String path = request.getPathInfo().substring(1);
            switch (path) {
                case "submit":
                    int id = Integer.parseInt(request.getParameter("userID"));
                    System.out.println(id);
                    String username = request.getParameter("username");
                    String firstName = request.getParameter("firstName");
                    String lastName = request.getParameter("lastName");
                    String email = request.getParameter("email");
                    String phoneNum = request.getParameter("phoneNumber");
                    String gender = request.getParameter("gender");
                    Date dob = Date.valueOf(request.getParameter("dob"));
                    String role = request.getParameter("role");
                    String accountStatus = request.getParameter("accountStatus");
                    String profilePicture = request.getParameter("profilePicture");
                    String password = request.getParameter("password");
                    User user = new User(id, firstName, lastName, username, dob, email, password, role, phoneNum,
                            null, gender, accountStatus, profilePicture);
                    int status = dao.updateUserByID(user);
                    if (status == 1) {
                        out.print("Updated");
                    } else {
                        out.print("Failed");
                    }
                    System.out.println("Success");
                    break;
                default:
                    System.err.println("Error");
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}