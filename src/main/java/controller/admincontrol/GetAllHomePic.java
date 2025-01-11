package controller.admincontrol;

import dao.CouponDAO;
import dao.HomePictureDAO;
import entity.Coupon;
import entity.HomePicture;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "GetAllHomePic", value = "/admin/all-homePic")
public class GetAllHomePic extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HomePictureDAO homeDao = new HomePictureDAO();
        List<HomePicture> listH = homeDao.getAllHomePic();
        request.setAttribute("listH", listH);
        request.getRequestDispatcher("homeImg.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}