package controller.admincontrol.discount;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dao.CategoryDAO;
import dao.DiscountDAO;
import entity.Category;
import entity.Discount;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "LoadDiscount", value = "/admin/load-discount")
public class LoadDiscount extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            // tải danh mục
            CategoryDAO categorydao = new CategoryDAO();
            List<Category> list_cate = categorydao.getAllCate();

            // tải các giảm giá có sẵn
            DiscountDAO discountdao = new DiscountDAO();
            List<Discount> list_discount = discountdao.getAllDiscount();

            request.setAttribute("list_cate", list_cate);
            request.setAttribute("list_discount", list_discount);
            request.getRequestDispatcher("discountProduct.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}