package com.ecommerce.controllers.OAuth.google;

import com.ecommerce.DAO.UserDAO;
import com.ecommerce.DTO.UserGoogleDTO;
import com.ecommerce.utils.GoogleConstants;
import com.ecommerce.utils.ProcessOAuthGoogle;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "GoogleLoginController", urlPatterns = {"/login-google"})
public class GoogleLoginController extends HttpServlet {
    /*
            Due to security reason, I have to hide client id and client secret key and "login/register with Google" feature is not available,
            if you want to test this feature, please contact me to get these keys:
            email: ducldc@jsclub.dev or ducldche176120@fpt.edu.vn
            */

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()){
            HttpSession session = request.getSession();
            UserDAO userDAO = new UserDAO();
            String code = request.getParameter("code");
            String accessToken = ProcessOAuthGoogle.getToken(code, GoogleConstants.GOOGLE_REDIRECT_URI);
            UserGoogleDTO user = ProcessOAuthGoogle.getUserInfo(accessToken);
            if(!(userDAO.checkGoogleUserID(user.getId()))){
                response.sendRedirect("login?error=1");
            } else {
                session.setAttribute("user", userDAO.getUserByGoogleID(user.getId()));
                response.sendRedirect("home");
            }

        } catch (Exception e){
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