package entity.authorization;

public class Action {
    private int actionID;
    private String name;

    public Action(int actionID, String name) {
        this.actionID = actionID;
        this.name = name;
    }

    public Action() {
    }

    public int getActionID() {
        return actionID;
    }

    public void setActionID(int actionID) {
        this.actionID = actionID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Action{" +
                "actionID=" + actionID +
                ", name='" + name + '\'' +
                '}';
    }
}
