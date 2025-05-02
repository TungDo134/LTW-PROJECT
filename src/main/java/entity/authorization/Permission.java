package entity.authorization;

public class Permission {
    private int permissionID;
    private String functionName;
    private int actionID;

    public Permission() {
    }

    public Permission(int permissionID, String functionName, int actionID) {
        this.permissionID = permissionID;
        this.functionName = functionName;
        this.actionID = actionID;
    }

    public int getPermissionID() {
        return permissionID;
    }

    public void setPermissionID(int permissionID) {
        this.permissionID = permissionID;
    }

    public String getFunctionName() {
        return functionName;
    }

    public void setFunctionName(String functionName) {
        this.functionName = functionName;
    }

    public int getActionID() {
        return actionID;
    }

    public void setActionID(int actionID) {
        this.actionID = actionID;
    }

    @Override
    public String toString() {
        return "Permission{" +
                "permissionID=" + permissionID +
                ", functionName='" + functionName + '\'' +
                ", actionID=" + actionID +
                '}';
    }
}
