package entity;

import java.io.Serializable;

public class Shipping  implements Serializable {
    private int shipID;
    private int orderID;
    private String status;

    public Shipping(int shipID, int orderID, String status) {
        this.shipID = shipID;
        this.orderID = orderID;
        this.status = status;
    }

    public Shipping() {
    }

    public int getShipID() {
        return shipID;
    }

    public void setShipID(int shipID) {
        this.shipID = shipID;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Shipping{" +
                "shipID=" + shipID +
                ", orderID=" + orderID +
                ", status='" + status + '\'' +
                '}';
    }
}
