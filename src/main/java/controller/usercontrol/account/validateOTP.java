package controller.usercontrol.account;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "validateOTP", value = "/validateOTP")
public class validateOTP extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Object inputOtp = session.getAttribute("otp");

        if (inputOtp == null) {
            request.setAttribute("status", "OTP đã hết hạn hoặc không tồn tại");
            request.getRequestDispatcher("/forms/EnterOtp.jsp").forward(request, response);
            return;
        }
        int expectedOtp = (int) inputOtp;
        int enteredOtp = Integer.parseInt(request.getParameter("otp"));

        if (enteredOtp == expectedOtp) {
            request.setAttribute("status", "success");
            request.getRequestDispatcher("/forms/resetPassword.jsp").forward(request, response);
        } else {
            request.setAttribute("message", "Sai mã OTP");
            request.getRequestDispatcher("/forms/EnterOtp.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request, response);
    }
}