package controller.admincontrol;

import dao.CouponDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "updateVoucher", value = "/admin/update-voucher")
public class UpdateVoucher extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String code = request.getParameter("code").toUpperCase();
        String discount = request.getParameter("discount");

        CouponDAO cdao = new CouponDAO();
        int row = cdao.updateCoupon(id, code, discount);

        response.sendRedirect("all-coupon");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}