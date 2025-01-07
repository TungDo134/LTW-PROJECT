package controller.admincontrol;

import context.JDBIContext;
import dao.CategoryDAO;
import dao.ProductDAO;
import entity.Category;
import entity.Product;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

@WebServlet(name = "AddProductController", value = "/add-product")
public class AddProductController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy thông tin từ form
        String productName = request.getParameter("productName");
        String productDes = request.getParameter("productDes");
        double productPrice = Double.parseDouble(request.getParameter("productPrice"));
        int productInventory = Integer.parseInt(request.getParameter("productInventory"));
        int cateID = Integer.parseInt(request.getParameter("cateID"));
        String shortDes = request.getParameter("shortDes");
        String productImage = request.getParameter("productImage");


//         Tạo đối tượng Product
        Product product = new Product();
        product.setProductName(productName);
        product.setProductDes(productDes);
        product.setProductPrice(productPrice);
        product.setProductInventory(productInventory);
        product.setProductOrder(0);
        product.setProductStock(productInventory);
        product.setCateID(cateID);
        product.setShortDes(shortDes);
        product.setProductImage(productImage);

        // Thêm sản phẩm
        ProductDAO productDAO = new ProductDAO();
        int result = productDAO.addProduct(product);

        // Kiểm tra kết quả và chuyển hướng
        if (result > 0) {
            request.setAttribute("msg", "Thêm sản phẩm thành công!");
            request.getRequestDispatcher("/admin/addProduct.jsp").forward(request, response);
            return;
        } else {
            request.setAttribute("msg", "Thêm sản phẩm thất bại!");
            request.getRequestDispatcher("/admin/addProduct.jsp").forward(request, response);
        }
    }
}
