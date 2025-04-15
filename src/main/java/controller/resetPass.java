package controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dao.CustomerDAO;
import dao.TokenForgotDAO;
import entity.Customer;
import entity.resetService;
import entity.tokenForgotPassword;
import helper.MaHoaMK;
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
            Customer cus = cusDao.getCusByID(tokenPassword.getUserId());
            request.setAttribute("email", cus.getEmail());
            session.setAttribute("token", tokenPassword.getToken());
            request.getRequestDispatcher("/forms/resetPassword.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("/forms/login.jsp").forward(request, response);
        }
        request.getRequestDispatcher("/forms/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        boolean isSuccess;

        String encryptedPassword = MaHoaMK.toSHA1(password);
        HttpSession session = request.getSession();

        String tokenStr = (String) session.getAttribute("token");
        tokenForgotPassword tokenPassword = daoToken.getTokenPassword(tokenStr);
        resetService service = new resetService();

        if (tokenPassword == null || tokenPassword.isIsUsed()) {
            isSuccess = false;
        } else {
            tokenPassword.setToken(tokenStr);
            tokenPassword.setIsUsed(true);
            cusDao.updatePasswordById(email, encryptedPassword);
            daoToken.updateStatus(tokenPassword);
            isSuccess = true;
        }

//        request.setAttribute("success", "Đổi mật khẩu thành công!");
//        request.getRequestDispatcher("/forms/login.jsp").forward(request, response);

        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("isSuccess", isSuccess);

        Gson gson = new Gson();
        String json = gson.toJson(jsonObject);
        response.getWriter().write(json);

    }
}