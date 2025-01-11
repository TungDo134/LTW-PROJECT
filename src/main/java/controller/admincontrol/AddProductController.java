package controller.admincontrol;

import context.JDBIContext;
import dao.CategoryDAO;
import dao.ProductDAO;
import entity.Category;
import entity.Product;
import entity.SubImgProduct;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.lang.reflect.Field;


@WebServlet(name = "AddProductController", value = "/admin/add-product")
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


        ProductDAO productDAO = new ProductDAO();
        // Tạo đối tượng Product
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

        // Thêm sản phẩm, trả về id mới thêm vô
        int result = productDAO.addProduct(product);

        // lấy thông tin ảnh phụ
        String subImg = request.getParameter("subImg");
        SubImgProduct subImgProduct = new SubImgProduct();
        if (subImg != null) {

            String[] subImgs = subImg.split(",");
            try {
                Field[] fields = SubImgProduct.class.getDeclaredFields();
                var j = 0;
                for (int i = 2; i < fields.length; i++) {
                    fields[i].setAccessible(true);
                    fields[i].set(subImgProduct, subImgs[j]);
                    j++;
                }
                productDAO.insertSubImg(result, subImgProduct);
            } catch (Exception e) {
                e.printStackTrace();
            }

        } else {
            productDAO.insertSubImg(result, subImgProduct);

        }


        // Kiểm tra kết quả và chuyển hướng
        if (result > 0) {
            request.setAttribute("msg", "Thêm sản phẩm thành công!");
            request.getRequestDispatcher("addProduct.jsp").forward(request, response);
            return;
        } else {
            request.setAttribute("msg", "Thêm sản phẩm thất bại!");
            request.getRequestDispatcher("addProduct.jsp").forward(request, response);
        }
    }
}
