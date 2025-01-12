package controller.admincontrol;

import dao.ProductDAO;
import entity.SubImgProduct;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.lang.reflect.Field;

@WebServlet(name = "UpdateSubImg", value = "/admin/update-sub-img")
public class UpdateSubImg extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // lấy thông tin ảnh phụ
        String subImg = request.getParameter("subImg");
        String subId = request.getParameter("subId");
        SubImgProduct subImgProduct = new SubImgProduct();

        if (subImg != null) {

            String[] subImgs = subImg.split(",");

            try {
                Field[] fields = SubImgProduct.class.getDeclaredFields();


                var j = 0;
                for (int i = 1; i <= fields.length && j < subImgs.length; i++) {
                    fields[i].setAccessible(true);
                    if (i == 1) {
                        fields[i].set(subImgProduct, Integer.parseInt(subId));
                    } else {
                        fields[i].set(subImgProduct, subImgs[j]);
                    j++;
                    }
                }

                System.out.println(subImgProduct);

                // cập nhật
                ProductDAO productDAO = new ProductDAO();
                productDAO.updateSubImg(subImgProduct.getProductID(), subImgProduct);

                // Phản hồi lại client
                response.setContentType("application/json");
                response.getWriter().write("{\"success\": \"Cập nhật thành công!\"}");


            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {

    }
}