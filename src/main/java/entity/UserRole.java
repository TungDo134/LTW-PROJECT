package entity;

public class UserRole {
    private int customerId;
    private int roleId;

    public UserRole() {
    }

    public UserRole(int customerId, int roleId) {
        this.customerId = customerId;
        this.roleId = roleId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    @Override
    public String toString() {
        return "UserRole{customerId=" + customerId + ", roleId=" + roleId + "}";
    }
}
