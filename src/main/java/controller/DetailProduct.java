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
//        int cId = Integer.parseInt(request.getParameter("cID"));

        // Hiển thị chi tiết sản phẩm
        ProductDAO productDAO = new ProductDAO();
        Product product = productDAO.getProductByID(pid);

        // Hiển thị reviews của sản phẩm
        ReviewDAO reviewDAO = new ReviewDAO();
        List<Review> reviews = reviewDAO.getAllReviewByPID(pid);

        // Lấy các sản phẩm cùng thể loại
//        ProductDAO proDao = new ProductDAO();
//        List<Product> productByCate = proDao.getProductByCate(cId);

        // Đặt các đối tượng vào request attributes
        request.setAttribute("detail", product);
        request.setAttribute("reviews", reviews);
//        request.setAttribute("products", productByCate);
        // Chuyển tiếp đến trang JSP
        request.getRequestDispatcher("product-detail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}