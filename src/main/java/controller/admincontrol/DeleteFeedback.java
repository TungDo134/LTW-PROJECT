package controller.admincontrol;

import dao.FeedbackDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "DeleteFeedback", value = "/delete-feedback")
public class DeleteFeedback extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int feedback_id = Integer.parseInt(request.getParameter("fID"));
        FeedbackDAO dao = new FeedbackDAO();
        dao.deleteFeedback(feedback_id);
        response.sendRedirect("all-feedback");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}