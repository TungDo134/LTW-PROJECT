package controller.admincontrol.supplier;

import dao.SupplierDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "ListSupplier", value = "/admin/list-supplier")
public class ListSupplier extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("suppliers", new SupplierDAO().getAllSuppliers());
        request.setAttribute("archiveSupplier", new SupplierDAO().getArchiveSuppliers());

        request.getRequestDispatcher("/admin/supplier.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}