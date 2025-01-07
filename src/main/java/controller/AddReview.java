package controller;

import dao.FeedbackDAO;
import dao.ReviewDAO;
import entity.Customer;
import entity.Feedback;
import entity.Product;
import entity.Review;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "AddReview", value = "/add-review")
public class AddReview extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String productID = request.getParameter("productID");  // Lấy productID từ form
        String customerName = request.getParameter("customerName");
        String rating = request.getParameter("rating");
        String comment = request.getParameter("comment");

        // Kiểm tra dữ liệu nhập vào
        if (productID == null || productID.isEmpty() || rating == null || rating.isEmpty()) {
            request.setAttribute("error", "Vui lòng điền đầy đủ thông tin.");
            request.getRequestDispatcher("detail").forward(request, response);  // Chuyển hướng về trang chi tiết sản phẩm
            return;
        }

        // Nếu các thông tin hợp lệ
        if (customerName != null && !customerName.isEmpty() && rating != null && !rating.isEmpty() && comment != null && !comment.isEmpty()) {

            // Tạo đối tượng Review
            Review rv = new Review();
            rv.setCustomerName(customerName);
            rv.setProductID(Integer.parseInt(productID));  // Sử dụng productID nhận được
            rv.setRating(Integer.parseInt(rating));
            rv.setComment(comment);

            // Gọi ReviewDAO để thêm đánh giá vào cơ sở dữ liệu
            ReviewDAO rdao = new ReviewDAO();
            rdao.addReview(rv);

            // Chuyển hướng sau khi thêm đánh giá thành công
            response.sendRedirect("detail?pid=" + productID);  // Chuyển hướng về trang chi tiết sản phẩm với pid
        } else {
            // Nếu có dữ liệu thiếu, thông báo lỗi
            request.setAttribute("error", "Vui lòng điền đầy đủ thông tin.");
            request.getRequestDispatcher("detail?pid=" + productID).forward(request, response);  // Chuyển hướng về trang chi tiết sản phẩm
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}