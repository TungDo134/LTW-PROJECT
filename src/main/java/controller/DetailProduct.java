package controller;

import dao.ProductDAO;
import dao.ReviewDAO;
import entity.Product;
import entity.Review;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "DetailProductController", value = "/detail")
public class DetailProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pid = request.getParameter("pid");

        // hiển thị ctsp
        ProductDAO productDAO = new ProductDAO();
        Product product = productDAO.getProductByID(pid);

        // hiển thị reviews của sp đó nếu có
        ReviewDAO reviewDAO = new ReviewDAO();
        List<Review> reviews = reviewDAO.getAllReviewByPID(pid);

        request.setAttribute("detail", product);
        request.setAttribute("reviews", reviews);
        request.getRequestDispatcher("product-detail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}