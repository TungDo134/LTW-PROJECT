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
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int manuID = Integer.parseInt(request.getParameter("manuID"));
        Manufacturer manufacturer = new ManufacturerDAO().getManufacturerById(manuID);


        request.setAttribute("manuID", manufacturer.getManuID());
        request.setAttribute("manuName", manufacturer.getManuName());
        request.setAttribute("brandOrigin", manufacturer.getBrandOrigin());
        request.setAttribute("manufactureLocation", manufacturer.getManufactureLocation());
        request.getRequestDispatcher("/admin/EditManu.jsp").forward(request, response);
    }
}
