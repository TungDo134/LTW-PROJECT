package controller;

import context.JDBIContext;
import dao.HomePictureDAO;
import entity.HomePicture;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
import org.jdbi.v3.core.Jdbi;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomeController", value = "/home")
public class HomeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HomePictureDAO dao = new HomePictureDAO();
        HomePicture homePic = dao.getHomePic();

        request.setAttribute("homepictures", homePic);
        request.getRequestDispatcher("index.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}