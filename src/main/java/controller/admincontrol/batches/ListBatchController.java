package controller.admincontrol.batches;

import dao.BatchDAO;
import dao.ProductDAO;
import dao.SupplierDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "ListBatchController", value = "/admin/list-batches")
public class ListBatchController extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            BatchDAO batchDAO = new BatchDAO();
            SupplierDAO supplierDAO = new SupplierDAO();
            ProductDAO productDAO = new ProductDAO();

            request.setAttribute("batches", batchDAO.getAllBatches());
            request.setAttribute("suppliers", supplierDAO.getAllSuppliers());
            request.setAttribute("products", productDAO.getProduct());

            request.getRequestDispatcher("/admin/batches.jsp").forward(request, response);

    }
}
