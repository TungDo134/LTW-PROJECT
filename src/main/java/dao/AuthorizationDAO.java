package dao;

import context.JDBIContext;
import entity.*;
import entity.authorization.*;

import java.util.List;
import java.util.Optional;

public class AuthorizationDAO {

    // LẤY DANH SÁCH TẤT CẢ ACTIONS
    public List<Action> getAllActions() {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createQuery("SELECT * FROM actions ORDER BY actionID")
                        .mapToBean(Action.class)
                        .list()
        );
    }

    // LẤY TẤT CẢ PERMISSIONS
    public List<Permission> getAllPermissions() {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createQuery("SELECT * FROM permissions")
                        .mapToBean(Permission.class)
                        .list()
        );
    }

    // LẤY PERMISSIONS CỦA MỘT ROLE
    public List<Permission> getPermissionsByRole(int roleID) {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createQuery("""
                                    SELECT p.permissionID, p.function_name, p.actionID
                                    FROM role_permission rp
                                    JOIN permissions p ON rp.permissionID = p.permissionID
                                    WHERE rp.roleID = :roleID
                                """)
                        .bind("roleID", roleID)
                        .mapToBean(Permission.class)
                        .list()
        );
    }


    // LẤY DANH SÁCH ROLE
    public List<Role> getAllRoles() {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createQuery("SELECT * FROM roles")
                        .mapToBean(Role.class)
                        .list()
        );
    }

    // LẤY ROLE CỦA 1 CUSTOMER
    public List<Role> getRolesByCustomer(int customerID) {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createQuery("""
                                    SELECT r.roleID, r.name
                                    FROM user_role cr
                                    JOIN roles r ON cr.roleID = r.roleID
                                    WHERE cr.customerID = :customerID
                                """)
                        .bind("customerID", customerID)
                        .mapToBean(Role.class)
                        .list()
        );
    }

    // LẤY ACTION THEO ID
    public Optional<Action> getActionByID(int id) {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createQuery("SELECT * FROM actions WHERE actionID = :id")
                        .bind("id", id)
                        .mapToBean(Action.class)
                        .findOne()
        );
    }

    // LẤY PERMISSION THEO ID
    public Optional<Permission> getPermissionByID(int permissionID) {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createQuery("SELECT * FROM permissions WHERE permissionID = :id")
                        .bind("id", permissionID)
                        .mapToBean(Permission.class)
                        .findOne()
        );
    }

    // LẤY ROLE THEO USER
    public List<String> getRoleNamesByCustomerID(int customerID) {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createQuery("SELECT name FROM roles r JOIN user_role ur ON ur.roleID = r.roleID WHERE ur.customerID = :customerID")
                        .bind("customerID", customerID)
                        .mapTo(String.class)
                        .list()
        );
    }

    // THÊM MỚI ROLE
    public boolean insertRole(String role_name) {
        int rowsAffected = JDBIContext.getJdbi().withHandle(handle ->
                handle.createUpdate("INSERT INTO roles (name) VALUES (:name)")
                        .bind("name", role_name)
                        .execute()
        );
        return rowsAffected > 0;
    }

    // THÊM MỚI USER-ROLE
    public boolean insertUserRole(String customerID, String roleID) {
        int rowsAffected = JDBIContext.getJdbi().withHandle(handle ->
                handle.createUpdate("INSERT INTO user_role (roleID,customerID) VALUES (:roleID, :customerID)")
                        .bind("roleID", roleID)
                        .bind("customerID", customerID)
                        .execute()
        );
        return rowsAffected > 0;
    }


    public static void main(String[] args) {
        AuthorizationDAO dao = new AuthorizationDAO();
        System.out.println(dao.getRoleNamesByCustomerID(73));
    }
}
