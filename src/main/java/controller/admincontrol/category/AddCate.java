package controller.admincontrol.category;

import dao.CategoryDAO;
import entity.Category;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "AddCateController", value = "/add-newCate")
public class AddCate extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("nameCate");
        String img = request.getParameter("imgCate");

        if (name.isBlank() || img.isBlank()) {
            request.setAttribute("msg", "Dữ liệu nhập vào không được trống");
            request.getRequestDispatcher("admin/get-all-cate").forward(request, response);

        } else {
            CategoryDAO categoryDAO = new CategoryDAO();
            Category category = new Category();
            category.setName(name.trim());
            System.out.println(name);
            category.setCateImg(img.trim());

            int row = categoryDAO.insertCate(category);
            if (row >= 1) {
                response.sendRedirect("admin/get-all-cate");
            }
        }


    }
}