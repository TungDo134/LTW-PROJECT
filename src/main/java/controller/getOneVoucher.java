package controller;

import dao.CouponDAO;
import entity.Coupon;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "getOneVoucher", value = "/get-voucher")
public class getOneVoucher extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int voucher_id = Integer.parseInt(request.getParameter("vID").trim());
        CouponDAO couponDAO = new CouponDAO();
        Coupon coupon = couponDAO.getCouponByID(voucher_id);

        if(coupon==null) response.sendRedirect("all-coupon");
        request.setAttribute("coupon", coupon);
        request.getRequestDispatcher("admin/editVoucher.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}