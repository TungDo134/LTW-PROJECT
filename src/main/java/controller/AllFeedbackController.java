package controller;

import dao.FeedbackDAO;
import entity.Feedback;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/all-feedback")
public class AllFeedbackController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        FeedbackDAO feedbackDAO = new FeedbackDAO();
        List<Feedback> listF = feedbackDAO.getFeedback();
        request.setAttribute("listF", listF);
        request.getRequestDispatcher("./listFeedback.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}