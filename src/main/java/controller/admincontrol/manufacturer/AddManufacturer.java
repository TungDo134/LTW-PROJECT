package controller.admincontrol.manufacturer;

import com.google.gson.JsonObject;
import dao.ManufacturerDAO;
import entity.Manufacturer;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "AddManufacturer", value = "/admin/AddManufacturer")
public class AddManufacturer extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        String manuName = request.getParameter("manuName");
        String brandOrigin = request.getParameter("brandOrigin");
        String manufactureLocation = request.getParameter("manufactureLocation");

        JsonObject json = new JsonObject();

        try {
            Manufacturer m = new Manufacturer();
            m.setManuName(manuName);
            m.setBrandOrigin(brandOrigin);
            m.setManufactureLocation(manufactureLocation);

            ManufacturerDAO dao = new ManufacturerDAO();
            int row = dao.addManufacturer(m);

            json.addProperty("isSuccess", row > 0);
            if (row <= 0) {
                json.addProperty("msg", "Không thể thêm nhà sản xuất vào database.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            json.addProperty("isSuccess", false);
            json.addProperty("msg", "Lỗi: " + e.getMessage());
        }

        PrintWriter out = response.getWriter();
        out.print(json.toString());
        out.flush();
    }
}


