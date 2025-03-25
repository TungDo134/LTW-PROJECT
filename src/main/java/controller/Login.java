package controller;
import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Scanner;
import dao.CustomerDAO;
import entity.Customer;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
import helper.MaHoaMK;
import org.json.JSONObject;

import java.io.IOException;

import static javax.crypto.Cipher.SECRET_KEY;

@WebServlet(name = "LoginControl", value = "/login")
public class Login extends HttpServlet {
    private static final String SECRET_KEY = "6LdjZ_wqAAAAAJn2ysFxobW5IL-0n7qcoVSWNRhg";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String emailLogin = request.getParameter("email-login");
        String passLogin = request.getParameter("password-login");

        String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
        // Kiểm tra CAPTCHA
        boolean isCaptchaValid = verifyRecaptcha(gRecaptchaResponse);

        if (isCaptchaValid) {
            // Xử lý đăng ký
            CustomerDAO cusDao = new CustomerDAO();
            Customer cus = new Customer();
            cus.setEmail(emailLogin);
            passLogin = MaHoaMK.toSHA1(passLogin);
            cus.setPass(passLogin);

            cus = cusDao.getUserByEmailPass(cus);

            if (cus == null) {
//          response.sendRedirect("forms/signup-login.jsp");
                request.setAttribute("error", "Sai tài khoản hoặc mật khẩu");
                request.getRequestDispatcher("forms/login.jsp").forward(request, response);
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("customer", cus);
                cus.setPass("");
                response.sendRedirect("home");
            }
        } else {
            request.setAttribute("error", "Chưa tích vào captcha");
            request.getRequestDispatcher("forms/login.jsp").forward(request, response);
        }
    }

    private boolean verifyRecaptcha(String gRecaptchaResponse) throws IOException {
        String url = "https://www.google.com/recaptcha/api/siteverify";
        String params = "secret=" + SECRET_KEY + "&response=" + gRecaptchaResponse;

        HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
        conn.setRequestMethod("POST");
        conn.setDoOutput(true);

        try (OutputStream out = conn.getOutputStream()) {
            out.write(params.getBytes());
            out.flush();
        }

        Scanner scanner = new Scanner(conn.getInputStream());
        String responseBody = scanner.useDelimiter("\\A").next();
        scanner.close();

        JSONObject json = new JSONObject(responseBody);
        return json.getBoolean("success");
    }

}