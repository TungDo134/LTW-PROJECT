package controller.admincontrol.supplier;

import dao.SupplierDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "SoftDeleteSupplier", value = "/admin/soft-delete")
public class SoftDeleteSupplier extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String supplierID = request.getParameter("supplierID");
        String option = request.getParameter("option");
        if (option != null) {
            new SupplierDAO().unSoftDeleteSupplier(Integer.parseInt(supplierID));
        } else {
            boolean deleted = new SupplierDAO().softDeleteSupplier(Integer.parseInt(supplierID));
            if (!deleted) {
                // Xóa thất bại, hiển thị lỗi
                request.setAttribute("error", "Xóa thất bại.");
                request.getRequestDispatcher("/admin/supplier/jsp").forward(request, response);
            }
        }

        response.sendRedirect(request.getContextPath() + "/admin/list-supplier");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}