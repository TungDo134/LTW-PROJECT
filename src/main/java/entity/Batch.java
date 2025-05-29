package entity;

import java.sql.Date;
import java.sql.Timestamp;

public class Batch {
    private int batchID;
    private int productID;
    private String batchNumber;
    private int quantity;
    private Double price;
    private String importDate;
    private Integer supplierID;
    private String createdAt;
    private byte isDeleted;
    private byte isUsed;
    private String productName; // Thêm để hiển thị tên sản phẩm
    private String supplierName; // Thêm để hiển thị tên nhà cung cấp

    // Constructor mặc định
    public Batch() {
    }

    // Constructor đầy đủ (bao gồm productName và supplierName)
    public Batch(int batchID, int productID, String batchNumber, int quantity, double price,
                 String importDate, Integer supplierID,
                 String createdAt, byte isDeleted, byte isUsed, String productName, String supplierName) {
        this.batchID = batchID;
        this.productID = productID;
        this.batchNumber = batchNumber;
        this.quantity = quantity;
        this.price = price;
        this.importDate = importDate;
        this.supplierID = supplierID;
        this.createdAt = createdAt;
        this.isDeleted = isDeleted;
        this.isUsed = isUsed;
        this.productName = productName;
        this.supplierName = supplierName;
    }

    // Constructor cho nghiệp vụ đọc qua file excel để thêm lô
    public Batch( int productID, String batchNumber, int quantity, double price,
                 String importDate, Integer supplierID,
                 String createdAt, byte isDeleted, byte isUsed) {
        this.productID = productID;
        this.batchNumber = batchNumber;
        this.quantity = quantity;
        this.price = price;
        this.importDate = importDate;
        this.supplierID = supplierID;
        this.createdAt = createdAt;
        this.isDeleted = isDeleted;
        this.isUsed = isUsed;
    }


    // Getters and Setters
    public int getBatchID() {
        return batchID;
    }

    public void setBatchID(int batchID) {
        this.batchID = batchID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getBatchNumber() {
        return batchNumber;
    }

    public void setBatchNumber(String batchNumber) {
        this.batchNumber = batchNumber;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getImportDate() {
        return importDate;
    }

    public void setImportDate(String importDate) {
        this.importDate = importDate;
    }


    public Integer getSupplierID() {
        return supplierID;
    }

    public void setSupplierID(Integer supplierID) {
        this.supplierID = supplierID;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public byte getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(byte isDeleted) {
        this.isDeleted = isDeleted;
    }

    public byte getIsUsed() {
        return isUsed;
    }

    public void setIsUsed(byte isUsed) {
        this.isUsed = isUsed;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getSupplierName() {
        return supplierName;
    }

    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Batch{" +
                "batchID=" + batchID +
                ", productID=" + productID +
                ", batchNumber='" + batchNumber + '\'' +
                ", quantity=" + quantity +
                ", price=" + price +
                ", importDate='" + importDate + '\'' +
                ", supplierID=" + supplierID +
                ", createdAt='" + createdAt + '\'' +
                ", isDeleted=" + isDeleted +
                ", isUsed=" + isUsed +
                ", productName='" + productName + '\'' +
                ", supplierName='" + supplierName + '\'' +
                '}';
    }
}