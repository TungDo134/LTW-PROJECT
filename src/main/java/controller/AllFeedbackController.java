package controller;

import dao.FeedbackDAO;
import entity.Feedback;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AllFeedbackController", value = "/all-feedback")
public class AllFeedbackController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        FeedbackDAO feedDAO = new FeedbackDAO();
        List<Feedback> listF = feedDAO.getFeedback();
        request.setAttribute("listF", listF);
        request.getRequestDispatcher("admin/listFeedback.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}