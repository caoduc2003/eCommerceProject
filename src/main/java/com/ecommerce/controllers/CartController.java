/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package com.ecommerce.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import com.ecommerce.DAO.CartDAO;
import com.ecommerce.models.CartItemDTO;
import com.ecommerce.models.User;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


/**
 *
 * @author brian
 */
@WebServlet(name="CartController", urlPatterns={"/cart/*"})
public class CartController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        CartDAO dao = new CartDAO();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        try {
            ArrayList<CartItemDTO> cartItems = dao.getCartItemsByUserID(user.getUserID());
            int total = dao.getTotalCartItemsPriceByUserID(user.getUserID());
            if (cartItems != null) {
                request.setAttribute("cartItems", cartItems);
                request.setAttribute("total", total);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        RequestDispatcher rd = request.getRequestDispatcher("Cart.jsp");
        rd.forward(request, response);
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()){
            HttpSession session = request.getSession();
            User currUser = (User) session.getAttribute("user");
            String path = request.getPathInfo().substring(1);
            switch (path){
                case "add":
                    int productID = Integer.parseInt(String.valueOf(request.getParameter("productId")));
                    int quantity = Integer.parseInt(request.getParameter("quantity"));
                    CartDAO cartDAO = new CartDAO();
                    int status = cartDAO.addToCart(currUser.getUserID(), productID, quantity);
                    if (status == 1) {
                        out.print("added");
                    } else {
                        out.println("error");
                    }
                    break;
                default:
                    processRequest(request,response);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
