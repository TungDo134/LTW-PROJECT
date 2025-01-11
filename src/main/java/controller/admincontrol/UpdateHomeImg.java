package controller.admincontrol;

import dao.AboutUsPicDAO;
import dao.HomePictureDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "UpdateHomeImg", value = "/admin/update-homePic")
public class UpdateHomeImg extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String target = request.getParameter("target");
        String value = request.getParameter("value");
        String choice = request.getParameter("choice");

        if ("1".equals(choice)) {
            request.setAttribute("target", target);
            request.setAttribute("value", value);
            request.getRequestDispatcher("editHomeImg.jsp").forward(request, response);
        } else {
            // lấy thông tin để edit
            HomePictureDAO dao = new HomePictureDAO();
            dao.updateImg(target,value);
            response.sendRedirect("all-homePic");

        }
    }
}