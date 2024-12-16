package entity;

public class Feedback {
    public int fID;
    public String customerName;
    public String email;
    public String fContent;

    public Feedback(int fID, String customerName, String email, String fContent) {
        this.fID = fID;
        this.customerName = customerName;
        this.email = email;
        this.fContent = fContent;
    }

    public Feedback() {
    }

    public void setfID(int fID) {
        this.fID = fID;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setfContent(String fContent) {
        this.fContent = fContent;
    }

    public int getfID() {
        return fID;
    }

    public String getCustomerName() {
        return customerName;
    }

    public String getEmail() {
        return email;
    }

    public String getfContent() {
        return fContent;
    }

    @Override
    public String toString() {
        return "Feedback{" +
                "fID=" + fID +
                ", customerName='" + customerName + '\'' +
                ", email='" + email + '\'' +
                ", fContent='" + fContent + '\'' +
                '}';
    }
}
