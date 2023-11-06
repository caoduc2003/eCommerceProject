package com.ecommerce.controllers.management;

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
import jakarta.servlet.http.HttpSession;

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
            User u = (User) request.getSession().getAttribute("user");
            if (u == null || !u.getRole().equalsIgnoreCase("admin")) {
                response.sendRedirect(request.getContextPath() + "/home");
                return;
            }
            String path = request.getPathInfo();
            if (path != null && !path.equals("/")) {
                switch (path.substring(1)) {
                    case "update":
                        int id = Integer.parseInt(request.getParameter("id"));
                        UserDAO dao = new UserDAO();
                        request.setAttribute("user", dao.getUserByID(id));
                        request.getRequestDispatcher("/update/UpdateUser.jsp").forward(request, response);
                        break;
                    case "create":
                        request.getRequestDispatcher("/create/CreateUser.jsp").forward(request, response);
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
                    case "submit-create":
                        String newUsername = request.getParameter("username");
                        String newFirstName = request.getParameter("firstName");
                        String newLastName = request.getParameter("lastName");
                        String newEmail = request.getParameter("email");
                        String newPhoneNum = request.getParameter("phoneNum");
                        String newGender = request.getParameter("gender");
                        String dobString = request.getParameter("dob");
                        LocalDate ld = LocalDate.parse(dobString);
                        Date newDob = Date.valueOf(ld);
                        String newRole = request.getParameter("role");
                        String newAccountStatus = request.getParameter("accountStatus");
                        String newProfilePicture = request.getParameter("profilePicture");
                        String newPassword = request.getParameter("password");
                        Date newDateCreated = Date.valueOf(LocalDate.now());
                        if(dao.addUser(new User(-1, newFirstName, newLastName, newUsername, newDob, newEmail, newPassword, newRole, newPhoneNum,
                                newDateCreated, newGender, newAccountStatus, newProfilePicture))){
                            out.print("created");
                        } else {
                            out.print("error");
                        }
                        break;
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