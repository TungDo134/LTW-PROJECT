package controller.admincontrol.discount;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dao.DiscountDAO;
import dao.ProductDAO;
import entity.Discount;
import entity.Product;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "ApplyDiscount", value = "/admin/apply-discount")
public class ApplyDiscount extends HttpServlet {
    ProductDAO productDAO = new ProductDAO();
    DiscountDAO discountDAO = new DiscountDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] productIds = request.getParameterValues("productIds");
        String discountId = request.getParameter("discountId");
        boolean isSuccess = false;
        /*
         * Thêm data vào bảng productDiscount
         * Từ id mã giảm lấy ra mã ==> lấy ra giá trị của mã và type
         * Từ id sp lấy ra sp ==> lấy ra giá sp đó và tính toán
         * discountType = percent ==> price * (discountValue / 100);
         * discountType = fixedAmount ==> price- discountValue;
         * ==> gọi hàm để update product (id, discountPrice, isDiscount=1)
         */
        if (productIds != null) {

            double discountPrice = 0;

            for (String id : productIds) {
                discountDAO.addProductAndDiscount(id, discountId);

                discountPrice = updateDiscountPrice(id, discountId);

                // update cột discountPrice va isDiscount (table products)
                productDAO.updateDiscountInfo(id, discountPrice);
            }
            isSuccess = true;
        }


        // Phản hồi về client
        JsonObject result = new JsonObject();
        result.addProperty("isSuccess", isSuccess);
        response.setContentType("application/json");

        Gson gson = new Gson();
        response.getWriter().write(gson.toJson(result));

    }

    private double updateDiscountPrice(String id, String discountId) {
        // lấy sp từ id
        Product p = productDAO.getProductByID(id);
        Discount discount = discountDAO.getDiscount(discountId);
        if ("Percent".equals(discount.getDiscountType())) {
            return p.discountPrice = p.productPrice - (p.productPrice * (Double.parseDouble(discount.discountValue) / 100));
        } else {
            return p.discountPrice = p.productPrice - Double.parseDouble(discount.discountValue);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}