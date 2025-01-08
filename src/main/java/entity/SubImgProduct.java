package entity;

import java.io.Serializable;

public class SubImgProduct implements Serializable {
    private int id;
    private int productID;
    private String subImg1;
    private String subImg2;
    private String subImg3;
    private String subImg4;
    private String subImg5;
    private String subImg6;
    private String subImg7;
    private String subImg8;
    private String subImg9;
    private String subImg10;

    public SubImgProduct() {
    }

    public SubImgProduct(int id, int productID, String subImg1, String subImg2, String subImg3,
                         String subImg4, String subImg5, String subImg6, String subImg7,
                         String subImg8, String subImg9, String subImg10) {
        this.id = id;
        this.productID = productID;
        this.subImg1 = subImg1;
        this.subImg2 = subImg2;
        this.subImg3 = subImg3;
        this.subImg4 = subImg4;
        this.subImg5 = subImg5;
        this.subImg6 = subImg6;
        this.subImg7 = subImg7;
        this.subImg8 = subImg8;
        this.subImg9 = subImg9;
        this.subImg10 = subImg10;
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

    public String getSubImg3() {
        return subImg3;
    }

    public void setSubImg3(String subImg3) {
        this.subImg3 = subImg3;
    }

    public String getSubImg4() {
        return subImg4;
    }

    public void setSubImg4(String subImg4) {
        this.subImg4 = subImg4;
    }

    public String getSubImg5() {
        return subImg5;
    }

    public void setSubImg5(String subImg5) {
        this.subImg5 = subImg5;
    }

    public String getSubImg6() {
        return subImg6;
    }

    public void setSubImg6(String subImg6) {
        this.subImg6 = subImg6;
    }

    public String getSubImg7() {
        return subImg7;
    }

    public void setSubImg7(String subImg7) {
        this.subImg7 = subImg7;
    }

    public String getSubImg8() {
        return subImg8;
    }

    public void setSubImg8(String subImg8) {
        this.subImg8 = subImg8;
    }

    public String getSubImg9() {
        return subImg9;
    }

    public void setSubImg9(String subImg9) {
        this.subImg9 = subImg9;
    }

    public String getSubImg10() {
        return subImg10;
    }

    public void setSubImg10(String subImg10) {
        this.subImg10 = subImg10;
    }

    @Override
    public String toString() {
        return "SubImgProduct{" +
                "id=" + id +
                ", productID=" + productID +
                ", subImg1='" + subImg1 + '\'' +
                ", subImg2='" + subImg2 + '\'' +
                ", subImg3='" + subImg3 + '\'' +
                ", subImg4='" + subImg4 + '\'' +
                ", subImg5='" + subImg5 + '\'' +
                ", subImg6='" + subImg6 + '\'' +
                ", subImg7='" + subImg7 + '\'' +
                ", subImg8='" + subImg8 + '\'' +
                ", subImg9='" + subImg9 + '\'' +
                ", subImg10='" + subImg10 + '\'' +
                '}';
    }
}
