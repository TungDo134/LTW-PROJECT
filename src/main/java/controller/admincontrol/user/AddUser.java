package controller.admincontrol.user;

import dao.CustomerDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
import helper.MaHoaMK;
import org.json.JSONObject;

import java.io.IOException;

@WebServlet(name = "AddUser", value = "/admin/add-user")
public class AddUser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String customerName = request.getParameter("username");
        String email = request.getParameter("email");
        String pass = request.getParameter("password");
        String phone = request.getParameter("numberPhone");
        String address = request.getParameter("address");
        String addressShipping = request.getParameter("address");
        String role = request.getParameter("role");


        request.setAttribute("customerName", customerName);
        request.setAttribute("email", email);
        request.setAttribute("pass", pass);
        request.setAttribute("phone", phone);
        request.setAttribute("address", address);
        request.setAttribute("addressShipping", addressShipping);

        String msg = "";
        boolean isSuccess = false;

        if (customerName.isBlank() || email.isBlank()) {
            msg = "Vui lòng nhập đầy đủ tên và email";

        } else {
            CustomerDAO cusDao = new CustomerDAO();
            // Mã hóa mk
            String hashPass = MaHoaMK.toSHA1(pass);

            try {
                // Gọi hàm thêm khách hàng
                int cus = cusDao.insertCustomer(customerName, email, hashPass, phone, address, addressShipping, role);

                // Kiểm tra kết quả trả về từ phương thức insert
                if (cus < 1) {
                    // Không thêm thành công
                    msg = "Có lỗi, vui lòng kiểm tra lại thông tin.";

                } else {
                    // Thêm thành công
                    msg = "Thêm thành công.";
                    isSuccess = true;
                }

            } catch (Exception e) {
                // Bắt lỗi không mong muốn khác
                e.printStackTrace(); // Ghi log lỗi
                msg = "Đã có lỗi xảy ra. Vui lòng thử lại.";
            }
        }

        JSONObject jsonResponse = new JSONObject();
        jsonResponse.put("msg", msg);
        jsonResponse.put("isSuccess", isSuccess);

        response.setContentType("application/json");
        response.getWriter().write(jsonResponse.toString());
    }
}