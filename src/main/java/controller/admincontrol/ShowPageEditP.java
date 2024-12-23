package controller.admincontrol;

import dao.ProductDAO;
import entity.Product;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "ShowPageEditP", value = "/show-product-edit")
public class ShowPageEditP extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        ProductDAO dao = new ProductDAO();
        Product p = dao.getProductByID(id);
        request.setAttribute("p",p);
        request.getRequestDispatcher("admin/EditProduct.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}