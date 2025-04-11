//detail
package controller;

import dao.ManufacturerDAO;
import dao.ProductDAO;
import dao.ReviewDAO;
import entity.Manufacturer;
import entity.Product;
import entity.Review;
import entity.SubImgProduct;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "DetailProductController", value = "/detail")
public class DetailProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pid = request.getParameter("pid");


        // Hiển thị chi tiết sản phẩm
        ProductDAO productDAO = new ProductDAO();
        Product product = productDAO.getProductByID(pid);

        // Hiển thị sub img của sản phẩm
        SubImgProduct subImgP = productDAO.getListSubImg(product.getProductID());

        // Hiển thị reviews của sản phẩm
        ReviewDAO reviewDAO = new ReviewDAO();
        List<Review> reviews = reviewDAO.getAllReviewByPID(pid);


        // Lấy các sản phẩm cùng thể loại
        ProductDAO proDao = new ProductDAO();
        List<Product> productByCate = proDao.getProductByCateLimit(product.getCateID());

        //nhà sx
        ManufacturerDAO manufacturerDAO = new ManufacturerDAO();
        Manufacturer manufacturer = manufacturerDAO.getByCateID(product.getCateID());
            request.setAttribute("manufacturer", manufacturer);


        // Thống kê số lượng đánh giá theo các mức sao
        int[] ratingCounts = new int[5]; // Mảng để đếm số lượng đánh giá cho mỗi sao (1 sao đến 5 sao)
        int totalScore = 0; // Tổng điểm đánh giá
        int totalReviews = reviews.size(); // Tổng số đánh giá

        for (Review review : reviews) {
            int rating = review.getRating();
            if (rating >= 1 && rating <= 5) {
                ratingCounts[rating - 1]++; // Tăng số lượng đánh giá cho mức sao tương ứng
                totalScore += rating; // Cộng điểm vào tổng điểm
            }
        }

        // Tính điểm trung bình
        double averageRating = totalReviews > 0 ? (double) totalScore / totalReviews : 0;
        averageRating = Math.round(averageRating * 10.0) / 10.0;  // Làm tròn tới 1 chữ số sau dấu phẩy

        // Tính tỷ lệ phần trăm cho mỗi mức sao
        double[] ratingPercentages = new double[5];
        for (int i = 0; i < 5; i++) {
            ratingPercentages[i] = totalReviews == 0 ? 0 : (ratingCounts[i] / (double) totalReviews) * 100;
        }


        // Đặt các đối tượng vào request attributes
        request.setAttribute("detail", product);
        request.setAttribute("reviews", reviews);
        request.setAttribute("listSubImg", subImgP);
        request.setAttribute("averageRating", averageRating);  // Truyền điểm trung bình
        request.setAttribute("ratingCounts", ratingCounts);  // Truyền số lượng đánh giá
        request.setAttribute("ratingPercentages", ratingPercentages);  // Truyền tỷ lệ phần trăm
        request.setAttribute("totalReviews", totalReviews);  // Truyền tổng số đánh giá
        request.setAttribute("manufacturer", manufacturer);  // Truyền tổng số đánh giá

        request.setAttribute("products", productByCate);

        // Chuyển tiếp đến trang JSP
        request.getRequestDispatcher("product-detail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

