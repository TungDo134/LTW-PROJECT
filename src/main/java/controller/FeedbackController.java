package controller;

import dao.FeedbackDAO;
import entity.Feedback;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "FeedbackController", value = "/feedback")
public class FeedbackController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy thông tin từ form trong JSP
        String customerName = request.getParameter("customerName");
        String email = request.getParameter("email");
        String fContent = request.getParameter("fContent");

        // Kiểm tra dữ liệu có hợp lệ không
        if (customerName != null && !customerName.isEmpty() &&
                email != null && !email.isEmpty() &&
                fContent != null && !fContent.isEmpty()) {

            // Tạo đối tượng Feedback
            Feedback feedback = new Feedback();
            feedback.setCustomerName(customerName);
            feedback.setEmail(email);
            feedback.setfContent(fContent);

            // Gọi FeedbackDAO để thêm phản hồi vào cơ sở dữ liệu
            FeedbackDAO feedbackDAO = new FeedbackDAO();
            feedbackDAO.addFeedback(feedback);

            // Chuyển hướng tới trang xác nhận sau khi gửi phản hồi thành công
            response.sendRedirect("contact-us.jsp");

        } else {
            // Nếu có dữ liệu thiếu, thông báo lỗi
            request.setAttribute("error", "Vui lòng điền đầy đủ thông tin.");
            request.getRequestDispatcher("contact-us.jsp").forward(request, response);
        }
    }
}
