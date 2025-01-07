package entity;

import java.io.Serializable;

public class OrderDetail implements Serializable {
    private int orderDetailID;
    private int orderID;
    private int quantity;
    private double price;
    private String productName;
    private String productImage;

    public OrderDetail(int orderDetailID, int orderID, int quantity, double price, String productName, String productImage) {
        this.orderDetailID = orderDetailID;
        this.orderID = orderID;
        this.quantity = quantity;
        this.price = price;
        this.productName = productName;
        this.productImage = productImage;
    }

    public OrderDetail() {

    }

    public int getOrderDetailID() {
        return orderDetailID;
    }

    public void setOrderDetailID(int orderDetailID) {
        this.orderDetailID = orderDetailID;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    @Override
    public String toString() {
        return "OrderDetail{" +
                "orderDetailID=" + orderDetailID +
                ", orderID=" + orderID +
                ", quantity=" + quantity +
                ", price=" + price +
                ", productName='" + productName + '\'' +
                '}';
    }
}
