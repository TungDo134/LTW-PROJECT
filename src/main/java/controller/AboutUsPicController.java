package controller;

import dao.AboutUsPicDAO;
import dao.CategoryDAO;
import entity.AboutUsPic;
import entity.Category;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AboutUsPicController", value = "/AboutUsPicController")
public class AboutUsPicController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AboutUsPicDAO aboutUsPicDAO = new AboutUsPicDAO();
        List<AboutUsPic> aboutUsPic= aboutUsPicDAO.getAboutUsPic();

        request.setAttribute("aboutuspictures", aboutUsPic);
        request.getRequestDispatcher("about-us.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}