package controller.admincontrol.product;

import dao.ProductDAO;
import entity.SubImgProduct;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.lang.reflect.Field;

@WebServlet(name = "EditSubImg", value = "/admin/edit-sub-img")
public class EditSubImg extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idTxt = request.getParameter("id");
        ProductDAO pdao = new ProductDAO();

        int id = 0;
        if (idTxt != null) {
            id = Integer.parseInt(idTxt);
        }


        // Lấy ra đối tượng sub img của sản phẩm
        SubImgProduct subImgP = pdao.getListSubImg(id);


        List<Object> values = new ArrayList<>();
        Field[] fields = subImgP.getClass().getDeclaredFields();
        int count = 0;
        for (Field field : fields) {
            if (count >= 2) {
                try {
                    field.setAccessible(true);
                    values.add(field.get(subImgP));
                } catch (IllegalAccessException e) {
                    throw new RuntimeException(e);
                }
            }
            count++;
        }

//        System.out.println(values);

        request.setAttribute("sub", values);
        request.setAttribute("subId", idTxt);
        request.getRequestDispatcher("editSubImg.jsp").

                forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}