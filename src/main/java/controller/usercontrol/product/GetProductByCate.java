package controller.usercontrol.product;

import dao.ProductDAO;
import entity.Inventory;
import entity.Product;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "getPByCate", value = "/product-cate")
public class GetProductByCate extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cID = request.getParameter("cID");
        int cId = Integer.parseInt(cID);

        ProductDAO dao = new ProductDAO();
        List<Product> product= dao.getProductByCate(cId);

        // lấy ra số lượng của product từ kho
        Map<Integer, Inventory> inventoryMap = dao.getInventoryMap();
        request.setAttribute("inventoryMap", inventoryMap);

        request.setAttribute("products",product);
        request.getRequestDispatcher("product.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}