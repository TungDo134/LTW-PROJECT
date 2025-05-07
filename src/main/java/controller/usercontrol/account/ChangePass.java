package controller.usercontrol.account;

import dao.CustomerDAO;
import entity.Customer;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
import helper.MaHoaMK;

import java.io.IOException;

@WebServlet(name = "ChangePass", value = "/change-password")
public class ChangePass extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String password = request.getParameter("password"); // Mật khẩu cũ
        String newPassword = request.getParameter("newPassword"); // Mật khẩu mới
        String rePassword = request.getParameter("rePassword"); // Nhập lại mật khẩu mới

        HttpSession session = request.getSession(false);
        Customer cus = (Customer) session.getAttribute("customer");


        // Mã hóa mật khẩu cũ và mới
        password = MaHoaMK.toSHA1(password);
        newPassword = MaHoaMK.toSHA1(newPassword);

        // Kiểm tra mật khẩu cũ
        CustomerDAO cusDao = new CustomerDAO();
        boolean isChanged = cusDao.changePassword(cus.getId(), password, newPassword);

        if (!isChanged) {
            request.setAttribute("msg", "Mật khẩu cũ không đúng hoặc có lỗi xảy ra.");
            request.getRequestDispatcher("forms/changePassword.jsp").forward(request, response);
        } else {
            session.removeAttribute("customer");
            response.sendRedirect("forms/signup-login.jsp");
        }
    }
}