package controller.admincontrol.authorization;

import dao.AuthorizationDAO;
import dao.CustomerDAO;
import entity.Customer;
import entity.authorization.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@WebServlet(name = "ShowAuthorization", value = "/admin/show-auth")
public class ShowAuthorization extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        AuthorizationDAO auth = new AuthorizationDAO();
        CustomerDAO cus = new CustomerDAO();

        // Retrieve roles, users, permissions, and actions
        List<Role> roles = auth.getAllRoles();
        List<Customer> customers = cus.getUsers();
        List<Permission> allPermissions = auth.getAllPermissions();
        List<Action> actions = auth.getAllActions();

        // Group permissions by functionName
        Set<String> functions = new HashSet<>();
        for (Permission p : allPermissions) {
            functions.add(p.getFunctionName());
        }

        // Handle selected role
        String roleIdRaw = request.getParameter("roleID");
        List<Permission> assignedPermissions = new ArrayList<>();
        if (roleIdRaw != null && !roleIdRaw.isEmpty()) {
            try {
                int roleID = Integer.parseInt(roleIdRaw);
                assignedPermissions = auth.getPermissionsByRole(roleID);
                request.setAttribute("selectedRoleID", roleID);
            } catch (NumberFormatException e) {
                request.setAttribute("error", "Invalid role ID");
            }
        }

//        Set<Integer> assignedPermissionIDs = new HashSet<>();
//        for (Permission p : assignedPermissions) {
//            assignedPermissionIDs.add(p.getPermissionID());
//        }
//        request.setAttribute("assignedPermissionIDs", assignedPermissionIDs);

        StringBuilder idList = new StringBuilder(",");
        for (Permission p : assignedPermissions) {
            idList.append(p.getPermissionID()).append(",");
        }
        request.setAttribute("assignedPermissionIDString", idList.toString());

        // Handle selected customer (if needed)
        String customerIdRaw = request.getParameter("customerID");
        List<Role> assignedRoles = new ArrayList<>();
        if (customerIdRaw != null && !customerIdRaw.isEmpty()) {
            try {
                int customerID = Integer.parseInt(customerIdRaw);
                assignedRoles = auth.getRolesByCustomer(customerID);
                request.setAttribute("selectedCustomerID", customerID);
            } catch (NumberFormatException e) {
                request.setAttribute("error", "Invalid customer ID");
            }
        }


        // Set request attributes
        request.setAttribute("roles", roles);
        request.setAttribute("customers", customers);
        request.setAttribute("functions", functions);
        request.setAttribute("allPermissions", allPermissions);
        request.setAttribute("assignedPermissions", assignedPermissions);
        request.setAttribute("assignedRoles", assignedRoles);
        request.setAttribute("actions", actions);

        request.getRequestDispatcher("/admin/Authorization.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}