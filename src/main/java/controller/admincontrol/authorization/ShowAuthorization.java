package controller.admincontrol.authorization;

import dao.AuthorizationDAO;
import entity.Permission;
import entity.Role;
import entity.RolePermission;
import entity.UserRole;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ShowAuthorization", value = "/admin/show-auth")
public class ShowAuthorization extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AuthorizationDAO auth = new AuthorizationDAO();
        List<Role> roles = auth.getAllRoles();
        List<UserRole> userRoles = auth.getAllUserRoles();
        List<Permission> permissions = auth.getAllPermissions();
        List<RolePermission> rolePermissions = auth.getAllRolePermissions();

        request.setAttribute("roles", roles);
        request.setAttribute("userRoles", userRoles);
        request.setAttribute("permissions", permissions);
        request.setAttribute("rolePermissions", rolePermissions);

        request.getRequestDispatcher("Authorization.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}