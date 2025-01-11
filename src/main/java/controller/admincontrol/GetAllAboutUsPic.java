package controller.admincontrol;

import dao.AboutUsPicDAO;
import dao.HomePictureDAO;
import entity.AboutUsPic;
import entity.HomePicture;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "GetAllAboutUsPic", value = "/admin/all-aboutUs")
public class GetAllAboutUsPic extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AboutUsPicDAO aboutUsPicDAO = new AboutUsPicDAO();
        List<AboutUsPic> listA = aboutUsPicDAO.getAboutUsPic();
        request.setAttribute("listA", listA);
        request.getRequestDispatcher("AboutUsImg.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}