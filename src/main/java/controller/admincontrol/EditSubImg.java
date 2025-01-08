package controller.admincontrol;

import dao.ProductDAO;
import entity.SubImgProduct;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "EditSubImg", value = "/edit-sub-img")
public class EditSubImg extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idTxt = request.getParameter("id");
        String code = request.getParameter("code");
        ProductDAO pdao = new ProductDAO();

        int id = 0;
        if (idTxt != null) {
            id = Integer.parseInt(idTxt);
        }
        // cập nhật
        if("1".equals(code)){
            // update
        }



        // Hiển thị sub img của sản phẩm
        SubImgProduct subImgP = pdao.getListSubImg(id);

        request.setAttribute("sub", subImgP);
        request.getRequestDispatcher("admin/editSubImg.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}