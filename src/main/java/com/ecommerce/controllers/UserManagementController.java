package com.ecommerce.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import com.ecommerce.DAO.UserDAO;
import com.ecommerce.models.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "UserManagementController", urlPatterns = {"/user-management/*"})
public class UserManagementController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try{
            UserDAO dao = new UserDAO();
            request.setAttribute("usersList", dao.getAllUsers());
            request.getRequestDispatcher("/admin/AdminUser.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/htmlcharset=UTF-8");
        try(PrintWriter out = response.getWriter()) {
            String path = request.getPathInfo();
            if (path != null && !path.equals("/")) {
                switch (path.substring(1)) {
                    case "update":
                        int id = Integer.parseInt(request.getParameter("id"));
                        UserDAO dao = new UserDAO();
                        request.setAttribute("user", dao.getUserByID(id));
                        request.getRequestDispatcher("/update/UpdateUser.jsp").forward(request, response);
                        break;
                    default:
                        request.getRequestDispatcher("errorPage.jsp").forward(request, response);
                        break;
                }
            } else {
                processRequest(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/htmlcharset=UTF-8");
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
                    case "delete":
                        int userID = Integer.parseInt(request.getParameter("id"));
                        int status1 = dao.deleteUserByID(userID);
                        if (status1 == 1) {
                            out.print("Deleted");
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