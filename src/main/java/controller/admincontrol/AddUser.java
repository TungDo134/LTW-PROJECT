package controller.admincontrol;

import dao.CustomerDAO;
import entity.Customer;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
import util.MaHoaMK;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "AddUser", value = "/add-user")
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


        if (customerName.isBlank() || email.isBlank()) {
            request.setAttribute("msg", "Vui lòng nhập đầy đủ những thông tin cần thiết");
            request.getRequestDispatcher("admin/addUser.jsp").forward(request, response);

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
                    request.setAttribute("msg", "Có lỗi, vui lòng kiểm tra lại thông tin.");
                    request.getRequestDispatcher("admin/addUser.jsp").forward(request, response);
                    return;
                }

                // Thêm thành công
                request.setAttribute("msg", "Thêm thành công.");
                request.setAttribute("customer", cus);
                request.getRequestDispatcher("admin/addUser.jsp").forward(request, response);
                return;

            } catch (Exception e) {
                // Bắt lỗi không mong muốn khác
                e.printStackTrace(); // Ghi log lỗi
                request.setAttribute("msg", "Đã có lỗi xảy ra. Vui lòng thử lại.");
                request.getRequestDispatcher("admin/addUser.jsp").forward(request, response);
            }

        }
    }
}