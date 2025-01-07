package controller.admincontrol;

import dao.CategoryDAO;
import dao.ProductDAO;
import entity.Category;
import entity.Product;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ShowPageEditP", value = "/show-product-edit")
public class ShowPageEditP extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        ProductDAO dao = new ProductDAO();
        Product p = dao.getProductByID(id);

        // lấy ds danh mục
        CategoryDAO cdao = new CategoryDAO();
        List<Category> listC= cdao.getAllCate();

        request.setAttribute("p", p);
        request.setAttribute("des", p.getProductDes());

        request.setAttribute("cateP", p.getCateID());
        request.setAttribute("listCate", listC);

        request.getRequestDispatcher("admin/EditProduct.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}