package com.ecommerce.controllers;

import java.io.IOException;
import java.io.PrintWriter;

import com.ecommerce.DAO.CategoriesDAO;
import com.ecommerce.DAO.ProductsDAO;
import com.ecommerce.models.Categories;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "CategoriesManagementController", urlPatterns = {"/cartegories-management/*"})
public class CategoriesManagementController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            CategoriesDAO dao = new CategoriesDAO();
            request.setAttribute("categoriesList", dao.getAllCategoriesDetails());
            request.getRequestDispatcher("/admin/AdminCategories.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            CategoriesDAO categoriesDAO = new CategoriesDAO();
            String path = request.getPathInfo();
            if (path != null && !path.equals("/")) {
                switch (path.substring(1)) {
                    case "update":
                        int id = Integer.parseInt(request.getParameter("categoryID"));
                        request.setAttribute("category", categoriesDAO.getCategoryByID(id));
                        request.getRequestDispatcher("/update/UpdateCategory.jsp").forward(request, response);
                        break;
                    case "create":
                        request.getRequestDispatcher("/create/CreateCategory.jsp").forward(request, response);
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
        try (PrintWriter out = response.getWriter()) {
            CategoriesDAO categoriesDAO = new CategoriesDAO();
            String path = request.getPathInfo();
            if (path != null && !path.equals("/")) {
                switch (path.substring(1)) {
                    case "submit-update":
                        String categoryName = request.getParameter("categoryName");
                        String categoryDescription = request.getParameter("categoryDescription");
                        String categoryImage = request.getParameter("categoryImage");
                        boolean isActive = Boolean.parseBoolean(request.getParameter("categoryStatus"));
                        int id = Integer.parseInt(request.getParameter("categoryID"));
                        boolean isUpdated = categoriesDAO.updateCategoryByID(new Categories(id,categoryName, categoryDescription, categoryImage, isActive));
                        if (isUpdated) {
                            out.print("updated");
                        } else {
                            out.print("error");
                        }
                        break;
                    case "submit-create":
                        String cCategoryName = request.getParameter("categoryName");
                        String cCategoryDescription = request.getParameter("categoryDescription");
                        String cCategoryImage = request.getParameter("categoryImage");
                        boolean cIsActive = Boolean.parseBoolean(request.getParameter("categoryStatus"));
                        boolean cIsCreated = categoriesDAO.addCategory(new Categories(-1,cCategoryName, cCategoryDescription, cCategoryImage, cIsActive));
                        if (cIsCreated) {
                            out.print("created");
                        } else {
                            out.print("error");
                        }
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
}