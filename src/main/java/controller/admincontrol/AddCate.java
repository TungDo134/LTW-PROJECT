package controller.admincontrol;

import dao.CategoryDAO;
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
        String name = request.getParameter("cate");
        CategoryDAO categoryDAO= new CategoryDAO();
//        categoryDAO.insertCate(name);
        String url=request.getContextPath();
        response.sendRedirect(url+"/admin/addCategory.jsp");
    }
}