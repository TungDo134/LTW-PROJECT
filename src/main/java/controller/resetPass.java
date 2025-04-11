package controller;

import dao.CustomerDAO;
import dao.TokenForgotDAO;
import entity.Customer;
import entity.resetService;
import entity.tokenForgotPassword;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "resetPass", value = "/resetPass")
public class resetPass extends HttpServlet {
    TokenForgotDAO daoToken = new TokenForgotDAO();
    CustomerDAO cusDao = new CustomerDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String token = request.getParameter("token");


        HttpSession session = request.getSession();
        if (token != null) {
            tokenForgotPassword tokenPassword = daoToken.getTokenPassword(token);
            resetService service = new resetService();
            if (tokenPassword == null) {
                request.setAttribute("mess", "token invalid");
                request.getRequestDispatcher("/forms/forgotPassword.jsp").forward(request, response);
                return;
            }
            if (tokenPassword.isIsUsed()) {
                request.setAttribute("mess", "token is used");
                request.getRequestDispatcher("/forms/forgotPassword.jsp").forward(request, response);
                return;
            }
            if (service.isExpireTime(tokenPassword.getExpiryTime())) {
                request.setAttribute("mess", "token is expired time");
                request.getRequestDispatcher("/forms/forgotPassword.jsp").forward(request, response);
                return;
            }

        } else {
            request.getRequestDispatcher("/forms/login.jsp").forward(request, response);
        }
        request.getRequestDispatcher("/forms/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String token = (String) session.getAttribute("token");
        tokenForgotPassword tokenPassword = daoToken.getTokenPassword(token);
//        Customer cus = cusDao.getCusByID(tokenPassword.getUserId());
//        request.setAttribute("email", cus.getEmail());
//
//        request.getRequestDispatcher("/forms/resetPassword.jsp").forward(request, response);
        if (tokenPassword == null || tokenPassword.isIsUsed()) {
            request.setAttribute("mess", "Token không hợp lệ hoặc đã sử dụng.");
            request.getRequestDispatcher("/forms/resetPassword.jsp").forward(request, response);
            return;
        }

        String password = request.getParameter("password");
        String rePassword = request.getParameter("rePassword");

        if (!password.equals(rePassword)) {
            request.setAttribute("mess", "Mật khẩu nhập lại không khớp.");
            request.setAttribute("email", cusDao.getCusByID(tokenPassword.getUserId()).getEmail());
            request.getRequestDispatcher("/forms/resetPassword.jsp").forward(request, response);
            return;
        }
        Customer cus = cusDao.getCusByID(tokenPassword.getUserId());
        cusDao.updatePassword(cus.getEmail(), password);
        tokenPassword.setUsed(true);
        daoToken.updateStatus(tokenPassword);

        session.removeAttribute("token");

        request.setAttribute("success", "Đổi mật khẩu thành công!");
        request.getRequestDispatcher("/forms/login.jsp").forward(request, response);
    }
}