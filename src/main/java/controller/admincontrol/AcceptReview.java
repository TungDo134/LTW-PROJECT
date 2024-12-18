package controller.admincontrol;

import dao.ReviewDAO;
import entity.Review;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "AccptReview", value = "/accept-review")
public class AcceptReview extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String rID = request.getParameter("rID");
        int choice = Integer.parseInt(request.getParameter("choice"));

        System.out.println("ID review la:" + rID);
        System.out.println("lua chon cua ban la:" + choice);

        switch (choice) {
            case 0:
                hiddenR(rID, choice);
                break;
            case 1:
                accept(rID, choice);
                break;
            case -1:
                remove(rID);
                break;
        }
        response.sendRedirect("all-review");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }


    // Duyệt
    public void accept(String rID, int choice) {
        ReviewDAO rd = new ReviewDAO();
        rd.modifyReview(rID, choice);
    }

    // Ẩn
    public void hiddenR(String rID, int choice) {
        ReviewDAO rd = new ReviewDAO();
        rd.modifyReview(rID, choice);
    }

    // Xóa
    public void remove(String rID) {
        ReviewDAO rd = new ReviewDAO();
        rd.removeReview(rID);
    }

}