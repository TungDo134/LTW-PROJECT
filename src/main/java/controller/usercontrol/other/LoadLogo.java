package controller.usercontrol.other;

import dao.HomePictureDAO;
import entity.HomePicture;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "LoadLogo", value = "/load-logo")
public class LoadLogo extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HomePictureDAO dao = new HomePictureDAO();
        HomePicture hp = dao.getHomePic();
        String logoName = hp.getLogo();


        response.setContentType("application/json");
        response.getWriter().write("{\"logoName\":\"" + logoName + "\"}");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}