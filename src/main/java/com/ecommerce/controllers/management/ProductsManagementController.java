package com.ecommerce.controllers.management;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;

import com.ecommerce.DAO.CategoriesDAO;
import com.ecommerce.DAO.ProductsDAO;
import com.ecommerce.DAO.UserDAO;
import com.ecommerce.models.Products;
import com.ecommerce.models.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ProductsManagementController", urlPatterns = {"/products-management/*"})
public class ProductsManagementController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            ProductsDAO dao = new ProductsDAO();
            request.setAttribute("productsList", dao.getAllProductsPreview());
            request.getRequestDispatcher("/admin/AdminProducts.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/htmlcharset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            User u = (User) request.getSession().getAttribute("user");
            if (u == null || !u.getRole().equalsIgnoreCase("admin")) {
                response.sendRedirect(request.getContextPath() + "/home");
                return;
            }
            ProductsDAO dao = new ProductsDAO();
            CategoriesDAO categoriesDAO = new CategoriesDAO();
            String path = request.getPathInfo();
            if (path != null && !path.equals("/")) {
                switch (path.substring(1)) {
                    case "update":
                        int id = Integer.parseInt(request.getParameter("productID"));
                        request.setAttribute("ctList", categoriesDAO.getAllCategoriesDetails());
                        request.setAttribute("product", dao.getProduct(id));
                        request.getRequestDispatcher("/update/UpdateProduct.jsp").forward(request, response);
                        break;
                    case "create":
                        request.setAttribute("ctList", categoriesDAO.getAllCategoriesDetails());
                        request.getRequestDispatcher("/create/CreateProduct.jsp").forward(request, response);
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
        try (PrintWriter out = response.getWriter()) {
            ProductsDAO dao = new ProductsDAO();
            String path = request.getPathInfo().substring(1);
            switch (path) {
                case "submit":
                    String productName = request.getParameter("productName");
                    String productDescription = request.getParameter("productDescription");
                    String productImage = request.getParameter("productImage");
                    int categoryID = Integer.parseInt(request.getParameter("whichCategory"));
                    int productPrice = Integer.parseInt(request.getParameter("productPrice"));
                    int productID = Integer.parseInt(request.getParameter("productID"));
                    Products product = new Products(productID, productName, productDescription, productImage, productPrice, categoryID, null, null);
                    int status = dao.updateProduct(product);
                    if (status == 1) {
                        out.print("updated");
                    } else {
                        out.print("error");
                    }
                    break;
                case "submit-create":
                    String nProductName = request.getParameter("productName");
                    String nProductDescription = request.getParameter("productDescription");
                    String nProductImage = request.getParameter("productImage");
                    int nCategoryID = Integer.parseInt(request.getParameter("whichCategory"));
                    int nProductPrice = Integer.parseInt(request.getParameter("productPrice"));
                    LocalDate ld = LocalDate.now();
                    Date ndateCreated = Date.valueOf(ld);
                    if (dao.addProduct(new Products(-1, nProductName, nProductDescription, nProductImage, nProductPrice, nCategoryID, ndateCreated, null))) {
                        out.print("created");
                    } else {
                        out.print("error");
                    }
                    break;
                case "delete":
                    int id = Integer.parseInt(request.getParameter("id"));
                    if (!dao.canDeleteProduct(id)) {
                        out.print("cannot-delete");
                        return;
                    }
                    int status1 = dao.deleteProduct(id);
                    if (status1 == 1) {
                        out.print("deleted");
                    } else {
                        out.print("error");
                    }
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