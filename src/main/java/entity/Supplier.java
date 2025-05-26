package entity;

import java.sql.Timestamp;

public class Supplier {
    private int supplierID;
    private String supplierName;
    private String contactInfo;
    private String address;
    private Timestamp createdAt;
    private Timestamp updatedAt;

    // Constructor mặc định
    public Supplier() {
    }

    // Constructor đầy đủ để
    public Supplier(int supplierID, String supplierName, String contactInfo, String address,
                    Timestamp createdAt, Timestamp updatedAt) {
        this.supplierID = supplierID;
        this.supplierName = supplierName;
        this.contactInfo = contactInfo;
        this.address = address;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    // Getters và Setters
    public int getSupplierID() { return supplierID; }
    public void setSupplierID(int supplierID) { this.supplierID = supplierID; }

    public String getSupplierName() { return supplierName; }
    public void setSupplierName(String supplierName) { this.supplierName = supplierName; }

    public String getContactInfo() { return contactInfo; }
    public void setContactInfo(String contactInfo) { this.contactInfo = contactInfo; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }

    public Timestamp getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(Timestamp updatedAt) { this.updatedAt = updatedAt;}
}