package controller.admincontrol.category;

import dao.CategoryDAO;
import entity.Category;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "GetOneCategory", value = "/admin/get-cate")
public class GetOneCategory extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int cate_id = Integer.parseInt(request.getParameter("cID").trim());
        CategoryDAO dao = new CategoryDAO();
        Category cate = dao.getCateByID(cate_id);

        if(cate==null) response.sendRedirect("get-all-cate");
        request.setAttribute("cate", cate);
        request.getRequestDispatcher("editCategory.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}