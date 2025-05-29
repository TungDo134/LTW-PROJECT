package entity;

import java.sql.Timestamp;

public class Supplier {
    private int supplierID;
    private String supplierName;
    private String contactInfo;
    private String address;
    private String createdAt;
    private String updatedAt;
    private byte isDeleted;

    // Constructor mặc định
    public Supplier() {
    }

    // Constructor đầy đủ để
    public Supplier(int supplierID, String supplierName, String contactInfo, String address,
                    String createdAt, String updatedAt, byte isDeleted) {
        this.supplierID = supplierID;
        this.supplierName = supplierName;
        this.contactInfo = contactInfo;
        this.address = address;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.isDeleted = isDeleted;
    }

    // Getters và Setters
    public int getSupplierID() {
        return supplierID;
    }

    public void setSupplierID(int supplierID) {
        this.supplierID = supplierID;
    }

    public String getSupplierName() {
        return supplierName;
    }

    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName;
    }

    public String getContactInfo() {
        return contactInfo;
    }

    public void setContactInfo(String contactInfo) {
        this.contactInfo = contactInfo;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public String getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(String updatedAt) {
        this.updatedAt = updatedAt;
    }

    public byte getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(byte isDeleted) {
        this.isDeleted = isDeleted;
    }
}