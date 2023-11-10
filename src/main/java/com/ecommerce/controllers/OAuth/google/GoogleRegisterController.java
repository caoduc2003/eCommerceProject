package com.ecommerce.controllers.OAuth.google;

import java.io.IOException;
import java.io.PrintWriter;

import com.ecommerce.DAO.UserDAO;
import com.ecommerce.DTO.UserGoogleDTO;
import com.ecommerce.models.User;
import com.ecommerce.utils.GoogleConstants;
import com.ecommerce.utils.ProcessOAuthGoogle;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "GoogleRegisterController", urlPatterns = {"/register-google"})
public class GoogleRegisterController extends HttpServlet {

    /*
        Due to security reason, I have to hide client id and client secret key and "login/register with Google" feature is not available,
        if you want to test this feature, please contact me to get these keys:
        email: ducldc@jsclub.dev or ducldche176120@fpt.edu.vn
        */

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            UserDAO dao = new UserDAO();
            String code = request.getParameter("code");
            String accessToken = ProcessOAuthGoogle.getToken(code, GoogleConstants.GOOGLE_REDIRECT_URI_2);
            UserGoogleDTO user = ProcessOAuthGoogle.getUserInfo(accessToken);
            if(!(dao.checkGoogleUserID(user.getId()))){
                dao.addGoogleUser(user);
            }
            response.sendRedirect("home");
        } catch (Exception e) {
            throw new RuntimeException(e);
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