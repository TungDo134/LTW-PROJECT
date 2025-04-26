package dao;

import context.JDBIContext;
import entity.Permission;
import entity.Role;
import entity.RolePermission;
import entity.UserRole;

import java.util.List;

public class AuthorizationDAO {
    // lấy all Role
    public List<Role> getAllRoles() {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createQuery("SELECT * FROM roles")
                        .mapToBean(Role.class)
                        .list()
        );
    }

    // lấy all UserRole
    public List<UserRole> getAllUserRoles() {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createQuery("SELECT * FROM user_role")
                        .mapToBean(UserRole.class)
                        .list()
        );
    }

    // lấy all Permission
    public List<Permission> getAllPermissions() {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createQuery("SELECT * FROM permission")
                        .mapToBean(Permission.class)
                        .list()
        );
    }

    // lấy all RolePermission
    public List<RolePermission> getAllRolePermissions() {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createQuery("SELECT * FROM role_permission")
                        .mapToBean(RolePermission.class)
                        .list()
        );
    }

    public static void main(String[] args) {
        AuthorizationDAO dao = new AuthorizationDAO();
        System.out.println(dao.getAllRoles());
        System.out.println(dao.getAllUserRoles());
        System.out.println(dao.getAllPermissions());
        System.out.println(dao.getAllRolePermissions());
    }


}
