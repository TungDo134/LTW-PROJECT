package controller.admincontrol;

import dao.CategoryDAO;
import entity.Category;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "CateController", value = "/get-all-cate")
public class CateController extends HttpServlet {
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