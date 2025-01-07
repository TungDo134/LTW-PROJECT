package controller.cartcontrol;

import dao.FeedbackDAO;
import dao.ReviewDAO;
import entity.Customer;
import entity.Feedback;
import entity.Review;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "AddReview", value = "/add-review")
public class AddReview extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String productID = request.getParameter("productID");
        String customerName = request.getParameter("customerName");
        String rating = request.getParameter("rating");
        String comment = request.getParameter("comment");


        if (customerName != null && !customerName.isEmpty() &&
                rating != null && !rating.isEmpty() &&
                comment != null && !comment.isEmpty()) {

            // Tạo đối tượng Review
            Review rv = new Review();
            rv.setCustomerName(customerName);
            rv.setProductID(Integer.parseInt(productID));
            rv.setRating(Integer.parseInt(rating));
            rv.setComment(comment);

            // Gọi ReviewDAO để thêm đánh giá vào cơ sở dữ liệu
            ReviewDAO rdao = new ReviewDAO();
            rdao.addReview(rv);

            // Chuyển hướng tới trang xác nhận sau khi gửi phản hồi thành công
            response.sendRedirect("products");
        } else {
            // Nếu có dữ liệu thiếu, thông báo lỗi
            request.setAttribute("error", "Vui lòng điền đầy đủ thông tin.");
            request.getRequestDispatcher("products").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
