package com.ecommerce.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.ecommerce.DAO.CategoriesDAO;
import com.ecommerce.DAO.ProductsDAO;
import com.ecommerce.models.Categories;
import com.ecommerce.models.Products;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "SearchController", urlPatterns = {"/search"})
public class SearchController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String keyword = request.getParameter("keyword");
            ProductsDAO dao = new ProductsDAO();
            CategoriesDAO catDAO = new CategoriesDAO();
            List<Products> listProducts = dao.getProductsBySearch(keyword);
            List<Categories> listCategories = catDAO.getAllCategories();
            request.setAttribute("allProducts", listProducts);
            request.setAttribute("allCategories", listCategories);
            RequestDispatcher rd = request.getRequestDispatcher("ProductsList.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
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