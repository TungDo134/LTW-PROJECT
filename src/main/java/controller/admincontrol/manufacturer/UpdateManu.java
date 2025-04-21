package controller.admincontrol.manufacturer;

import dao.ManufacturerDAO;
import entity.Manufacturer;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "UpdateManufacturer", value = "/admin/update-manufacturer")
public class UpdateManu extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int manuID = Integer.parseInt(request.getParameter("manuID"));
        String manuName = request.getParameter("manuName");
        String brandOrigin = request.getParameter("brandOrigin");
        String manufactureLocation = request.getParameter("manufactureLocation");

        Manufacturer m = new Manufacturer();
        m.setManuID(manuID);
        m.setManuName(manuName);
        m.setBrandOrigin(brandOrigin);
        m.setManufactureLocation(manufactureLocation);

        ManufacturerDAO dao = new ManufacturerDAO();
        dao.updateManufacturer(m);

        response.sendRedirect(request.getContextPath() + "/admin/all-manufacturer");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

}
