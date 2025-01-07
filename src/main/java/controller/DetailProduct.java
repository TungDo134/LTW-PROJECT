package controller;

import dao.ProductDAO;
import dao.ReviewDAO;
import entity.Product;
import entity.Review;
import entity.SubImgProduct;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "DetailProductController", value = "/detail")
public class DetailProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pid = Integer.parseInt(request.getParameter("pid"));


        // Hiển thị chi tiết sản phẩm
        ProductDAO productDAO = new ProductDAO();
        Product product = productDAO.getProductByID(pid);

        // Hiển thị sub img của sản phẩm
        SubImgProduct subImgP =  productDAO.getListSubImg(product.getProductID());

        // Hiển thị reviews của sản phẩm
        ReviewDAO reviewDAO = new ReviewDAO();
        List<Review> reviews = reviewDAO.getAllReviewByPID(pid);


        // Lấy các sản phẩm cùng thể loại
        ProductDAO proDao = new ProductDAO();
        List<Product> productByCate = proDao.getProductByCate(product.getCateID());

        // Đặt các đối tượng vào request attributes
        request.setAttribute("detail", product);
        request.setAttribute("reviews", reviews);
        request.setAttribute("listSubImg", subImgP);
        request.setAttribute("totalReviews", reviews.size());

        request.setAttribute("products", productByCate);

        // Chuyển tiếp đến trang JSP
        request.getRequestDispatcher("product-detail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}