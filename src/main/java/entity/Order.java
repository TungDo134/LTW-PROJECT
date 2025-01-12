package entity;

import java.io.Serializable;
import java.util.Date;

public class Order implements Serializable {
    private int orderID;
    private int cusID;
    private double totalPrice;
    private String status;
    private int quantity;
    private int couponID;
    private Date date;
    private String address;

    public Order(int orderID, int cusID, double totalPrice, String status, int quantity, int couponID, Date date, String address) {
        this.orderID = orderID;
        this.cusID = cusID;
        this.totalPrice = totalPrice;
        this.status = status;
        this.quantity = quantity;
        this.couponID = couponID;
        this.date = date;
        this.address = address;
    }

    public Order() {

    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getCusID() {
        return cusID;
    }

    public void setCusID(int cusID) {
        this.cusID = cusID;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getCouponID() {
        return couponID;
    }

    public void setCouponID(int couponID) {
        this.couponID = couponID;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "Order{" +
                "orderID=" + orderID +
                ", cusID=" + cusID +
                ", totalPrice=" + totalPrice +
                ", status='" + status + '\'' +
                ", quantity=" + quantity +
                ", couponID=" + couponID +
                '}';
    }
}
