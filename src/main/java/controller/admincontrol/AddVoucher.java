package controller.admincontrol;

import dao.CouponDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "addCouponController", value = "/add-coupon")
public class AddVoucher extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");
        String txt_Discount = request.getParameter("discount");

        if (code.isBlank() || txt_Discount.isBlank()) {
            request.setAttribute("msg", "Thiếu mã giảm hoặc giá trị của mã");
            request.getRequestDispatcher("all-coupon").forward(request, response);

        } else {
            double discount = Double.parseDouble(txt_Discount.trim());
            CouponDAO couponDAO = new CouponDAO();
            int row = couponDAO.addCoupon(code, discount);

            if (row >= 1) {
                response.sendRedirect("all-coupon");
            }
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}