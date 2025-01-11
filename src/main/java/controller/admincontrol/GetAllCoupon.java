package controller.admincontrol;

import dao.CouponDAO;
import entity.Coupon;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "getAllCouponController", value = "/admin/all-coupon")
public class GetAllCoupon extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CouponDAO couDao = new CouponDAO();
        List<Coupon> listV = couDao.getAllCoupon();
        request.setAttribute("listV", listV);
        request.getRequestDispatcher("listVoucher.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}