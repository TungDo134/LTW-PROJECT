package controller;

import dao.CategoryDAO;
import dao.HomePictureDAO;
import dao.ProductDAO;
import entity.Category;
import entity.HomePicture;
import entity.Product;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomeController", value = "/home")
public class HomeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Tải ảnh của trang home
        HomePictureDAO dao = new HomePictureDAO();
        HomePicture homePic = dao.getHomePic();

        // Tải danh sách sản phẩm bán chạy
        ProductDAO productDAO = new ProductDAO();
        List<Product> bestP = productDAO.getBestSeller();

        // Tải danh sách sản phẩm mới
        List<Product> newProducts = productDAO.getNewPro();

        // Tải danh sách danh mục
        CategoryDAO cateDao = new CategoryDAO();
        List<Category> listCate = cateDao.getAllCate();

        // Truyền dữ liệu sang JSP
        request.setAttribute("homepictures", homePic);
        request.setAttribute("products", bestP);
        request.setAttribute("newProducts", newProducts);
        request.setAttribute("listCate", listCate);

        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
