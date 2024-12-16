package controller;

import dao.CouponDAO;
import entity.Coupon;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "addCouponController", value = "/add-coupon")
public class addCouponController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");
        double discount = Double.parseDouble( request.getParameter("discount").trim());

        CouponDAO couponDAO = new CouponDAO();
        int row = couponDAO.addCoupon(code, discount);

        if (row >= 1) {
            request.setAttribute("msg", "Thêm thành công ");
            request.getRequestDispatcher("all-coupon").forward(request, response);
        } else {
            request.setAttribute("msg", "Them that bai");
            request.getRequestDispatcher("all-coupon").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}