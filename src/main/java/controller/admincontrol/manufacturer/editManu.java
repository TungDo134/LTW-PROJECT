package controller.admincontrol.manufacturer;

import dao.ManufacturerDAO;
import entity.Manufacturer;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "EditManufacturer", value = "/admin/edit-manufacturer")
public class editManu extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int manuID = Integer.parseInt(request.getParameter("manuID"));
        Manufacturer manufacturer = new ManufacturerDAO().getManufacturerById(manuID);

        request.setAttribute("manuID", manufacturer.getManuID());
        request.setAttribute("supplierName", manufacturer.getSupplierName());
        request.setAttribute("brand", manufacturer.getBrand());
        request.setAttribute("brandOrigin", manufacturer.getBrandOrigin());
        request.setAttribute("manufactureLocation", manufacturer.getManufactureLocation());
        request.setAttribute("color", manufacturer.getColor());
        request.setAttribute("material", manufacturer.getMaterial());
        request.setAttribute("weight", manufacturer.getWeight());
        request.setAttribute("dimensions", manufacturer.getDimensions());
        request.setAttribute("bestSeller", manufacturer.isBestSeller());

        request.getRequestDispatcher("/admin/EditManu.jsp").forward(request, response);
    }
}