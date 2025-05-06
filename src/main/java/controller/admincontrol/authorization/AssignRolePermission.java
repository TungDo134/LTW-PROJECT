package controller.admincontrol.authorization;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dao.AuthorizationDAO;
import entity.authorization.Permission;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@WebServlet(name = "AssignRolePermission", value = "/admin/assign-role-per")
public class AssignRolePermission extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String roleID = request.getParameter("roleID");
        String[] permissionID = request.getParameterValues("permissions");

        AuthorizationDAO auth = new AuthorizationDAO();
        boolean isSuccessDelete = false;

        // xóa
        Set<String> selectedSet = permissionID != null ? new HashSet<>(Arrays.asList(permissionID)) : new HashSet<>();

        List<Permission> current = auth.getPermissionsByRole(Integer.parseInt(roleID));

        // Xóa những cái không còn trong selectedSet
        for (Permission oldPerm : current) {
            String permIDStr = String.valueOf(oldPerm.getPermissionID());
            if (!selectedSet.contains(permIDStr)) {
                System.out.println("Xóa quyền có id là: " + permIDStr);
                auth.deleteRolePermission(roleID, permIDStr);
            }
        }
        boolean isSuccessAdd = auth.insertRolePermissions(roleID, permissionID);

        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("isSuccessAdd", isSuccessAdd);
        jsonObject.addProperty("isSuccessDelete", isSuccessDelete);

        Gson gson = new Gson();
        String json = gson.toJson(jsonObject);
        response.getWriter().write(json);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}