package controller.admincontrol;

import dao.AboutUsPicDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "UpdateImgAbUs", value = "/update-img-ab")
public class UpdateImgAbUs extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nameImg = request.getParameter("txt");
        String target = request.getParameter("txtVal");
        String choice = request.getParameter("choice");

        if ("1".equals(choice)) {
            request.setAttribute("nameImg", nameImg);
            request.setAttribute("target", target);
            request.getRequestDispatcher("admin/editImg.jsp").forward(request,response);
        } else {
            // lấy thông tin để edit
            AboutUsPicDAO dao = new AboutUsPicDAO();
            dao.updateImg(target, nameImg);
            response.sendRedirect("all-aboutUs");
        }


    }
}