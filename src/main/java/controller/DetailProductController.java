package controller;

import dao.ProductDAO;
import entity.Product;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "DetailProductController", value = "/detail")
public class DetailProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pid = request.getParameter("pid");
        int pID = Integer.parseInt(pid);
        System.out.println(pID);

        ProductDAO dao = new ProductDAO();
        Product product= dao.getProductByID(pID);

        request.setAttribute("detail",product);
        request.getRequestDispatcher("product-detail.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}