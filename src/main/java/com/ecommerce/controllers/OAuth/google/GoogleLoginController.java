package com.ecommerce.controllers.OAuth.google;

import com.ecommerce.DAO.UserDAO;
import com.ecommerce.DTO.UserGoogleDTO;
import com.ecommerce.utils.GoogleConstants;
import com.ecommerce.utils.ProcessOAuthGoogle;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

import java.io.IOException;
import java.io.PrintWriter;

import static com.ecommerce.utils.ProcessOAuthGoogle.getUserInfo;

@WebServlet(name = "GoogleLoginController", urlPatterns = {"/login-google"})
public class GoogleLoginController extends HttpServlet {

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