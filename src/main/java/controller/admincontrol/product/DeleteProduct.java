package controller.admincontrol.product;

import dao.ProductDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "DeleteProduct", value = "/admin/delete-pro")
public class DeleteProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pro_id = Integer.parseInt(request.getParameter("pID").trim());
        ProductDAO dao= new ProductDAO();
        dao.deleteProductById(pro_id);
        response.sendRedirect("load-pAdmin");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}