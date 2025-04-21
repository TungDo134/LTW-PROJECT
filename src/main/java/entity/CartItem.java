package entity;

import java.io.Serializable;

public class CartItem implements Serializable {
    private int cartItemID;
    private int cartID;
    private String title;
    private double price;
    private String img;
    private int quantity;
    private double totalCt;
    private int productID;

    public CartItem(int cartItemID, int cartID, String title, double price, String img, int quantity, double totalCt, int productID) {
        this.cartItemID = cartItemID;
        this.cartID = cartID;
        this.title = title;
        this.price = price;
        this.img = img;
        this.quantity = quantity;
        this.totalCt = totalCt;
        this.productID = productID;
    }

    public CartItem() {
    }

    public double getTotalCt() {
        setTotalCt(getPrice(), getQuantity());
//        return totalCt = quantity * price;
        return totalCt;
    }

    public void setTotalCt(double price, int quantity) {
        this.totalCt = price * quantity;
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

    public void setTotalCt(double totalCt) {
        this.totalCt = totalCt;
    }

    public int getCartItemID() {
        return cartItemID;
    }

    public void setCartItemID(int cartItemID) {
        this.cartItemID = cartItemID;
    }

    public int getCartID() {
        return cartID;
    }

    public void setCartID(int cartID) {
        this.cartID = cartID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    @Override
    public String toString() {
        return "CartItem{" +
                "cartItemID=" + cartItemID +
                ", cartID=" + cartID +
                ", title='" + title + '\'' +
                ", price=" + price +
                ", img='" + img + '\'' +
                ", quantity=" + quantity +
                ", totalCt=" + totalCt +
                ", productID=" + productID +
                '}';
    }
}