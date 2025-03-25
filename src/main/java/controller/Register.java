package controller;

import dao.CustomerDAO;
import entity.Customer;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
import helper.CheckValidEmail;
import helper.MaHoaMK;
import org.json.JSONObject;

import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Scanner;

@WebServlet(name = "Register", value = "/Register")
public class Register extends HttpServlet {
    private static final String SECRET_KEY = "6LdjZ_wqAAAAAJn2ysFxobW5IL-0n7qcoVSWNRhg";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String rePassword = request.getParameter("rePassword");

        String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
        // Kiểm tra CAPTCHA
        boolean isCaptchaValid = verifyRecaptcha(gRecaptchaResponse);

        String msg = "";

        if (isCaptchaValid) {
            // check valid email
            if (!CheckValidEmail.checkValidEmail(email)) {
                msg = "Email không hợp lệ";
                request.setAttribute("msg", msg);
                request.getRequestDispatcher("forms/signup-login.jsp").forward(request, response);
                return;
            }

            CustomerDAO cusDao = new CustomerDAO();
            // check email
            if (cusDao.isUserExistsByEmail(email)) {
                msg = "Email đã tồn tại, vui lòng kiểm tra lại";
                request.setAttribute("msg", msg);
                request.getRequestDispatcher("forms/signup.jsp").forward(request, response);
            } else {
                // check password
                if (!password.equals(rePassword)) {
                    msg = "Mật khẩu nhập lại không chính xác";
                    request.setAttribute("msg", msg);
                    request.getRequestDispatcher("forms/signup.jsp").forward(request, response);

                } else {
                    password = MaHoaMK.toSHA1(password);
                    Customer customer = new Customer();
                    customer.setName(username);
                    customer.setEmail(email);
                    customer.setPass(password);
                    customer.setRole((byte) 0);

                    cusDao.createNewCustomer(customer);

                    // lưu session cho đăng nhập mới
                    HttpSession session = request.getSession(true);
                    session.setAttribute("customer", customer);

                    customer.setPass("");

                    msg = "Đăng ký thành công";
                    request.setAttribute("success", msg);
//                response.sendRedirect("home");
                    request.getRequestDispatcher("forms/signup.jsp").forward(request, response);
                }
            }
        } else {
            request.setAttribute("msg", "Chưa tích vào captcha");
            request.getRequestDispatcher("forms/signup.jsp").forward(request, response);
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