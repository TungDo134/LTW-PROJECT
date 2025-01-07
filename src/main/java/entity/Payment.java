package entity;

import java.io.Serializable;

public class Payment implements Serializable {
    private int payID;
    private int ordID;
    private String payMethods;

    public Payment(int payID, int ordID, String payMethods) {
        this.payID = payID;
        this.ordID = ordID;
        this.payMethods = payMethods;
    }

    public Payment() {
    }

    public int getPayID() {
        return payID;
    }

    public void setPayID(int payID) {
        this.payID = payID;
    }

    public int getOrdID() {
        return ordID;
    }

    public void setOrdID(int ordID) {
        this.ordID = ordID;
    }

    public String getPayMethods() {
        return payMethods;
    }

    public void setPayMethods(String payMethods) {
        this.payMethods = payMethods;
    }

    @Override
    public String toString() {
        return "Payment{" +
                "payID=" + payID +
                ", ordID=" + ordID +
                ", payMethods='" + payMethods + '\'' +
                '}';
    }
}
