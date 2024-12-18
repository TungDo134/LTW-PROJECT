package controller.admincontrol;

import dao.ReviewDAO;
import entity.Review;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "GetAllReview", value = "/all-review")
public class GetAllReview extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ReviewDAO dao = new ReviewDAO();
        List<Review> reviews = dao.getAllReview();
        request.setAttribute("reviews", reviews);
        request.getRequestDispatcher("admin/listReviews.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}