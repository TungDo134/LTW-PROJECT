package controller.admincontrol;

import dao.CouponDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "deleteVoucher", value = "/delete-voucher")
public class DeleteVoucher extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int voucher_id = Integer.parseInt(request.getParameter("vID").trim());
        CouponDAO dao= new CouponDAO();
        dao.deleteCoupon(voucher_id);
        response.sendRedirect("all-coupon");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}