package controller.admincontrol.manufacturer;

import dao.ManufacturerDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "DeleteManufacturer", value = "/admin/delete-manufacturer")
public class deleteManufacturer extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("manuID"));
        ManufacturerDAO dao = new ManufacturerDAO();
        dao.deleteManufacturer(id);

        response.sendRedirect(request.getContextPath() + "/admin/all-manufacturer");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
