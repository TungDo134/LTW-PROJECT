package controller;

import dao.CategoryDAO;
import entity.Category;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "showallcate", value = "/show-all-cate")
public class getAllCateController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CategoryDAO cateDao = new CategoryDAO();
        List<Category> listC = cateDao.getAllCate();
        request.setAttribute("listC", listC);
        request.getRequestDispatcher("admin/listCategory.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}