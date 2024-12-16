package controller;

import dao.CouponDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "updateVoucher", value = "/update-voucher")
public class updateVoucher extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String code = request.getParameter("code");
        String discount = request.getParameter("discount");

        CouponDAO cdao = new CouponDAO();
        int row = cdao.updateCoupon(id, code, discount);

        if (row >= 1) {
            System.out.println("update Voucher success");
        } else {
            System.out.println("update Voucher fail");
        }
        response.sendRedirect("all-coupon");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}