package controller.admincontrol;

import dao.CategoryDAO;
import dao.CouponDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "UpdateCategory", value = "/update-cate")
public class UpdateCategory extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String img = request.getParameter("img");

        CategoryDAO cdao = new CategoryDAO();
        int row = cdao.updateCate(id, name, img);

        response.setContentType("application/json");
        response.getWriter().write("{\"nameCate\":\"" + name + "\", \"img\":\"" + img + "\"}");


//        <%=request.getContextPath()%>/assets/pic/products/img
//        response.sendRedirect("get-all-cate");
    }
}