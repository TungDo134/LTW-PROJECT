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

@WebServlet(name = "requestPass", value = "/forgotPass")
public class forgotPassword extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/forms/forgotPassword.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CustomerDAO cdao = new CustomerDAO();
        String email = request.getParameter("email");
        Customer cus = cdao.getUserByEmail(email);
        if(cus == null) {
            request.setAttribute("error", "Email không tồn tại");
            request.getRequestDispatcher("/forms/forgotPassword.jsp").forward(request, response);
        }
        resetService service = new resetService();

        String token = service.generateToken();
        String linkReset ="http://localhost:8080/LTW_Project/forms/resetPassword.jsp?token="+ token;
        tokenForgotPassword newTokenForgot = new tokenForgotPassword(
                token, service.expireDateTime(),false,cus.getId());

        TokenForgotDAO daoToken = new TokenForgotDAO();
        boolean isInsert = daoToken.insertTokenForgot(newTokenForgot);

        int otp = service.generateOTP();
        HttpSession session = request.getSession();
        session.setAttribute("otp", otp);
        session.setAttribute("email", email);
        session.setAttribute("token", newTokenForgot.getToken());

        boolean isService = service.sendEmail(email, cus.getName(), otp);
        if (!isService){
            request.setAttribute("mess", "can not send request");
            request.getRequestDispatcher("/forms/forgotPassword.jsp").forward(request, response);
            return;
        }
        request.setAttribute("success", "OTP is sent to your email id");
        request.getRequestDispatcher("/forms/EnterOtp.jsp").forward(request, response);
    }
}