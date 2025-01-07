package controller.admincontrol;

import dao.ProductDAO;
import entity.Product;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "UpdateProduct", value = "/update-product")
public class UpdateProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productID = Integer.parseInt(request.getParameter("id"));
        String productName = request.getParameter("productName");
        String productDes = request.getParameter("productDes");
        double productPrice = Double.parseDouble(request.getParameter("productPrice"));
        int productInventory = Integer.parseInt(request.getParameter("productInventory"));
        int cateID = Integer.parseInt(request.getParameter("cateID"));
        String shortDes = request.getParameter("shortDes");

        String productImage = request.getParameter("productImage");
        String oldImg = request.getParameter("oldImg");

        int productOrder = Integer.parseInt(request.getParameter("productOrder"));
        int productStock = Integer.parseInt(request.getParameter("productStock"));

        ProductDAO productDAO = new ProductDAO();
        String imgUpdate;
        if (!"".equals(productImage)) {
            imgUpdate = productImage;
        } else {
            imgUpdate = oldImg;
        }

        Product product = productDAO.getProductByID(productID);
        product.setProductName(productName);
        product.setProductDes(productDes);
        product.setProductPrice(productPrice);
        product.setProductInventory(productInventory);
        product.setProductOrder(productOrder);
        product.setProductStock(productStock);
        product.setCateID(cateID);
        product.setShortDes(shortDes);
        product.setProductImage(imgUpdate);

        System.out.println();


        productDAO.updateProduct(product);

        response.sendRedirect("load-pAdmin");
    }
}