package entity;

import java.io.Serializable;

public class CartItem implements Serializable {
    private int id;
    private String title;
    private double price;
    private String img;
    private int quantity;
    private double totalCt;

    public CartItem(int id, String title, double price, String img, int quantity, double totalCt) {
        this.id = id;
        this.title = title;
        this.price = price;
        this.img = img;
        this.quantity = quantity;
        this.totalCt = totalCt;
    }


    public CartItem() {
    }

    public double getTotalCt() {
        return totalCt = quantity * price;
//        return totalCt;
    }

    public void setTotalCt(double totalCt) {
        this.totalCt = totalCt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotalPrice() {
        return this.price * this.quantity;
    }

    @Override
    public String toString() {
        return "CartItem{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", price=" + price +
                ", img='" + img + '\'' +
                ", quantity=" + quantity +
                ", totalCt=" + totalCt +
                '}';
    }


}