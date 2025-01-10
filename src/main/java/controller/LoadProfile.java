package controller;

import dao.CustomerDAO;
import dao.OrderDAO;
import dao.OrderDetailDAO;
import dao.PaymentDAO;
import entity.Customer;
import entity.Order;
import entity.OrderDetail;
import entity.Payment;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "LoadProfile", value = "/load-profile")
public class LoadProfile extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //code = 1 khi ng dùng muốn sửa info
        String code = request.getParameter("code");

        // lấy session customer
        HttpSession session = request.getSession(true);
        Customer cus = (Customer) session.getAttribute("customer");

        // neu chua login thi chuyen ve trang login
        if (cus == null) {
            response.sendRedirect("forms/signup-login.jsp");
            return;
        }
        request.setAttribute("cus", cus);

        // check xem ng dung co phai dg muon doi thong tin hay khong
        if ("1".equals(code)) {
            request.getRequestDispatcher("editProfile.jsp").forward(request, response);
        }

        // lấy danh sách order
        OrderDAO oDao = new OrderDAO();
        List<Order> listOrder = oDao.getListOrderByCusId(cus.getId());

        // khi ng dung da mua hang
        if (listOrder != null) {
            request.setAttribute("orders", listOrder);
        }

        // khi ng dung chua mua hang
        else {
            request.setAttribute("orders", null);
        }

        request.setAttribute("addressShip", cus.getAddressShipping());
        request.getRequestDispatcher("profile.jsp").forward(request, response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}