package entity.authorization;

public class UserRole {
    private int customerID;
    private int roleId;

    public UserRole() {
    }

    public UserRole(int customerID, int roleId) {
        this.customerID = customerID;
        this.roleId = roleId;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    @Override
    public String toString() {
        return "UserRole{customerID=" + customerID + ", roleId=" + roleId + "}";
    }
}
