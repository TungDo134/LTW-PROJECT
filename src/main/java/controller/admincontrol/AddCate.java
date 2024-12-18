package controller.admincontrol;

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

        CategoryDAO categoryDAO = new CategoryDAO();
        Category category = new Category();
        category.setName(name);
        category.setCateImg(img);

        int row = categoryDAO.insertCate(category);
        if (row >= 1) {

        }
        request.getRequestDispatcher("get-all-cate").forward(request, response);
    }
}