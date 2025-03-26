package controller.admincontrol.voucher;

import dao.CouponDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "deleteVoucher", value = "/admin/delete-voucher")
public class DeleteVoucher extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int voucher_id = Integer.parseInt(request.getParameter("vID").trim());
        CouponDAO dao = new CouponDAO();
        boolean isSuccess = dao.deleteCoupon(voucher_id) > 0;

        response.setContentType("application/json");
        response.getWriter().write("{\"isSuccess\":" + isSuccess + "}");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}