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
        String supplierName = request.getParameter("supplierName");
        String brand = request.getParameter("brand");
        String brandOrigin = request.getParameter("brandOrigin");
        String manufactureLocation = request.getParameter("manufactureLocation");
        String color = request.getParameter("color");
        String material = request.getParameter("material");
        double weight = Double.parseDouble(request.getParameter("weight"));
        String dimensions = request.getParameter("dimensions");
        boolean bestSeller = Boolean.parseBoolean(request.getParameter("bestSeller"));

        Manufacturer m = new Manufacturer(manuID, supplierName, brand, brandOrigin,
                manufactureLocation, color, material, weight, dimensions, bestSeller);

        ManufacturerDAO dao = new ManufacturerDAO();
        int result = dao.updateManufacturer(m);

        System.out.println("Ngu lắm mới sai được z'");
        response.sendRedirect(request.getContextPath() + "/admin/all-manufacturer");


    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
