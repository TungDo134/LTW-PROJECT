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
        request.setCharacterEncoding("UTF-8"); // Nhận đúng tiếng Việt
        response.setContentType("application/json");

        // Lấy dữ liệu từ request
        String supplierName = request.getParameter("supplierName");
        String brand = request.getParameter("brand");
        String brandOrigin = request.getParameter("brandOrigin");
        String manufactureLocation = request.getParameter("manufactureLocation");
        String color = request.getParameter("color");
        String material = request.getParameter("material");
        String weightStr = request.getParameter("weight");
        String dimensions = request.getParameter("dimensions");
        String bestSellerStr = request.getParameter("bestSeller");

        JsonObject json = new JsonObject();

        try {
            double weight = Double.parseDouble(weightStr);
            boolean bestSeller = Boolean.parseBoolean(bestSellerStr);

            Manufacturer m = new Manufacturer();
            m.setSupplierName(supplierName);
            m.setBrand(brand);
            m.setBrandOrigin(brandOrigin);
            m.setManufactureLocation(manufactureLocation);
            m.setColor(color);
            m.setMaterial(material);
            m.setWeight(weight);
            m.setDimensions(dimensions);
            m.setBestSeller(bestSeller);

            ManufacturerDAO dao = new ManufacturerDAO();
            int row = dao.addManufacturer(m);

            if (row > 0) {
                json.addProperty("isSuccess", true);
            } else {
                json.addProperty("isSuccess", false);
                json.addProperty("msg", "Không thể thêm nhà sản xuất vào database.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            json.addProperty("isSuccess", false);
            json.addProperty("msg", "Dữ liệu không hợp lệ: " + e.getMessage());
        }

        PrintWriter out = response.getWriter();
        out.print(json.toString());
        out.flush();
    }
}
