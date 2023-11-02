package com.ecommerce.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;

import com.ecommerce.DAO.UserDAO;
import com.ecommerce.models.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "RegisterController ", urlPatterns = { "/register/*" })
public class RegisterController extends HttpServlet {

    private static final String DEF_AVATAR = "data:image/jpeg;base64,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";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.getRequestDispatcher("Signup.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            String path = request.getPathInfo().substring(1);
            UserDAO dao = new UserDAO();
            switch (path) {
                case "submit-register":
                    String newUsername = request.getParameter("username");
                    String newFirstName = request.getParameter("firstName");
                    String newLastName = request.getParameter("lastName");
                    String newEmail = request.getParameter("email");
                    String newPhoneNum = request.getParameter("phoneNum");
                    String newGender = request.getParameter("gender");
                    String dobString = request.getParameter("dob");
                    LocalDate ld = LocalDate.parse(dobString);
                    Date newDob = Date.valueOf(ld);
                    String newRole = "User";
                    String newAccountStatus = "Active";
                    String newProfilePicture = DEF_AVATAR;
                    String newPassword = request.getParameter("password");
                    Date newDateCreated = Date.valueOf(LocalDate.now());
                    if (dao.addUser(new User(-1, newFirstName, newLastName, newUsername, newDob, newEmail, newPassword,
                            newRole, newPhoneNum,
                            newDateCreated, newGender, newAccountStatus, newProfilePicture))) {
                        out.print("registered");
                    } else {
                        out.print("error");
                    }
                    break;
                default:
                    System.err.println(request.getPathInfo());
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}