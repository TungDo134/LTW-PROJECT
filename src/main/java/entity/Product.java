package entity;

import java.io.Serializable;

public class Product implements Serializable {
    public int productID;
    public String productName;
    public String productDes;
    public double productPrice;

    public String productImage;
    public int cateID;
    public String shortDes;
    public double discountPrice;
    public byte isDiscount;

    // Các trường từ Manufacturer
    public int manuID;
    public String brand;

    public String color;
    public String material;
    public String weight;
    public String dimensions;
    public boolean bestSeller;

    public Product(int productID, String productName, String productDes, double productPrice, String productImage, int cateID, String shortDes, double discountPrice,
                   byte isDiscount, int manuID, String brand,  String color, String material, String weight, String dimensions, boolean bestSeller) {
        this.productID = productID;
        this.productName = productName;
        this.productDes = productDes;
        this.productPrice = productPrice;
        this.productImage = productImage;
        this.cateID = cateID;
        this.shortDes = shortDes;
        this.discountPrice = discountPrice;
        this.isDiscount = isDiscount;
        this.manuID = manuID;
        this.brand = brand;
        this.color = color;
        this.material = material;
        this.weight = weight;
        this.dimensions = dimensions;
        this.bestSeller = bestSeller;
    }

    public Product() {
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductDes() {
        return productDes;
    }

    public void setProductDes(String productDes) {
        this.productDes = productDes;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }


    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    public int getCateID() {
        return cateID;
    }

    public void setCateID(int cateID) {
        this.cateID = cateID;
    }

    public String getShortDes() {
        return shortDes;
    }

    public void setShortDes(String shortDes) {
        this.shortDes = shortDes;
    }

    public double getDiscountPrice() {
        return discountPrice;
    }

    public void setDiscountPrice(double discountPrice) {
        this.discountPrice = discountPrice;
    }

    public byte getIsDiscount() {
        return isDiscount;
    }

    public void setIsDiscount(byte isDiscount) {
        this.isDiscount = isDiscount;
    }

    public int getManuID() {
        return manuID;
    }

    public void setManuID(int manuID) {
        this.manuID = manuID;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    public String getDimensions() {
        return dimensions;
    }

    public void setDimensions(String dimensions) {
        this.dimensions = dimensions;
    }

    public boolean isBestSeller() {
        return bestSeller;
    }

    public void setBestSeller(boolean bestSeller) {
        this.bestSeller = bestSeller;
    }


    @Override
    public String toString() {
        return "Product{" +
                "productID=" + productID +
                ", productName='" + productName + '\'' +
                ", productDes='" + productDes + '\'' +
                ", productPrice=" + productPrice +
                ", productImage='" + productImage + '\'' +
                ", cateID=" + cateID +
                ", shortDes='" + shortDes + '\'' +
                ", discountPrice=" + discountPrice +
                ", isDiscount=" + isDiscount +
                ", manuID=" + manuID +
                ", brand='" + brand + '\'' +
                ", color='" + color + '\'' +
                ", material='" + material + '\'' +
                ", weight='" + weight + '\'' +
                ", dimensions='" + dimensions + '\'' +
                ", bestSeller=" + bestSeller +
                '}';
    }
}
