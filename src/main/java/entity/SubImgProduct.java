package entity;

import java.io.Serializable;

public class SubImgProduct implements Serializable {
    private int id;
    private int productID;
    private String subImg1;
    private String subImg2;

    public SubImgProduct() {
    }

    public SubImgProduct(int id, int productID, String subImg1, String subImg2) {
        this.id = id;
        this.productID = productID;
        this.subImg1 = subImg1;
        this.subImg2 = subImg2;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getSubImg1() {
        return subImg1;
    }

    public void setSubImg1(String subImg1) {
        this.subImg1 = subImg1;
    }

    public String getSubImg2() {
        return subImg2;
    }

    public void setSubImg2(String subImg2) {
        this.subImg2 = subImg2;
    }

    @Override
    public String toString() {
        return "SubImgProduct{" +
                "productID=" + productID +
                ", id=" + id +
                ", subImg1='" + subImg1 + '\'' +
                ", subImg2='" + subImg2 + '\'' +
                '}';
    }
}
