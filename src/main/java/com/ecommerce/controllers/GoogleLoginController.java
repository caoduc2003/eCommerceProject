package com.ecommerce.controllers;

import com.ecommerce.DAO.UserDAO;
import com.ecommerce.DTO.UserGoogleDTO;
import com.ecommerce.utils.GoogleConstants;
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

@WebServlet(name = "GoogleLoginController", urlPatterns = {"/login-google"})
public class GoogleLoginController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()){
            HttpSession session = request.getSession();
            UserDAO userDAO = new UserDAO();
            String code = request.getParameter("code");
            System.out.println(code);
            String accessToken = getToken(code);
            UserGoogleDTO user = getUserInfo(accessToken);
            System.out.println(user);
            if(!(userDAO.checkGoogleUserID(user.getId()))){
                userDAO.addGoogleUser(user);
            }
            session.setAttribute("user", userDAO.getUserByGoogleID(user.getId()));
            response.sendRedirect("home");
        } catch (Exception e){
            e.printStackTrace();
        }

    }

    public static String getToken(String code) throws ClientProtocolException, IOException {
        // call api to get token
        String response = Request.Post(GoogleConstants.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", GoogleConstants.GOOGLE_CLIENT_ID)
                        .add("client_secret", GoogleConstants.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", GoogleConstants.GOOGLE_REDIRECT_URI).add("code", code)
                        .add("grant_type", GoogleConstants.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();

        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        System.out.println(jobj.get("access_token"));
        return jobj.get("access_token").toString().replaceAll("\"", "");
    }

    public static UserGoogleDTO getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = GoogleConstants.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();
        return new Gson().fromJson(response, UserGoogleDTO.class);
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