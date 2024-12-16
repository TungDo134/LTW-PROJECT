package controller;

import dao.CouponDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "addCouponController", value = "/add-coupon")
public class addCouponController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String code = request.getParameter("code");
    String discountText = request.getParameter("discount");
    double discount = Double.parseDouble(discountText);

        CouponDAO couponDAO = new CouponDAO();
       if( couponDAO.addCoupon(code, discount)>0){
           request.setAttribute("msg","Them thanh cong");
       }else{
           request.setAttribute("msg","Them that bai");

       }
        response.sendRedirect("admin/addVoucher.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}