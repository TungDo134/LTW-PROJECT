package entity;

import java.sql.Date;
import java.sql.Timestamp;

public class Batch {
    private int batchID;
    private int productID;
    private String batchNumber;
    private int quantity;
    private Date importDate;
    private Date expiryDate;
    private Integer supplierID;
    private Timestamp createdAt;
    private String productName; // Thêm để hiển thị tên sản phẩm
    private String supplierName; // Thêm để hiển thị tên nhà cung cấp

    // Constructor mặc định
    public Batch() {
    }

    // Constructor đầy đủ (bao gồm productName và supplierName)
    public Batch(int batchID, int productID, String batchNumber, int quantity,
                 Date importDate, Date expiryDate, Integer supplierID,
                 Timestamp createdAt, String productName, String supplierName) {
        this.batchID = batchID;
        this.productID = productID;
        this.batchNumber = batchNumber;
        this.quantity = quantity;
        this.importDate = importDate;
        this.expiryDate = expiryDate;
        this.supplierID = supplierID;
        this.createdAt = createdAt;
        this.productName = productName;
        this.supplierName = supplierName;
    }

    // Getters and Setters
    public int getBatchID() { return batchID; }
    public void setBatchID(int batchID) { this.batchID = batchID; }

    public int getProductID() { return productID; }
    public void setProductID(int productID) { this.productID = productID; }

    public String getBatchNumber() { return batchNumber; }
    public void setBatchNumber(String batchNumber) { this.batchNumber = batchNumber; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public Date getImportDate() { return importDate; }
    public void setImportDate(Date importDate) { this.importDate = importDate; }

    public Date getExpiryDate() { return expiryDate; }
    public void setExpiryDate(Date expiryDate) { this.expiryDate = expiryDate; }

    public Integer getSupplierID() { return supplierID; }
    public void setSupplierID(Integer supplierID) { this.supplierID = supplierID; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }

    public String getProductName() { return productName; }
    public void setProductName(String productName) { this.productName = productName; }

    public String getSupplierName() { return supplierName; }
    public void setSupplierName(String supplierName) { this.supplierName = supplierName; }
}