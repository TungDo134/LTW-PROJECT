
package entity;

import java.sql.Timestamp;

public class InventoryTransaction {
    private int transactionID;
    private int productID;
    private String transactionType; // import, export, reserve, release, adjust
    private int quantity;
    private Integer orderDetailID; // Có thể null
    private String description;
    private Integer createdBy; // Có thể null
    private Timestamp createdAt;
    private String productName; // Tên sản phẩm từ bảng products, dùng để hiển thị
    private String createdByName; // Tên người dùng từ bảng users, dùng để hiển thị

    // Constructor mặc định
    public InventoryTransaction() {
    }

    // Constructor đầy đủ
    public InventoryTransaction(int transactionID, int productID, String transactionType,
                                int quantity, Integer orderDetailID, String description,
                                Integer createdBy, Timestamp createdAt, String productName,
                                String createdByName) {
        this.transactionID = transactionID;
        this.productID = productID;
        this.transactionType = transactionType;
        this.quantity = quantity;
        this.orderDetailID = orderDetailID;
        this.description = description;
        this.createdBy = createdBy;
        this.createdAt = createdAt;
        this.productName = productName;
        this.createdByName = createdByName;
    }

    // Getters and Setters
    public int getTransactionID() { return transactionID; }
    public void setTransactionID(int transactionID) { this.transactionID = transactionID; }

    public int getProductID() { return productID; }
    public void setProductID(int productID) { this.productID = productID; }

    public String getTransactionType() { return transactionType; }
    public void setTransactionType(String transactionType) { this.transactionType = transactionType; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public Integer getOrderDetailID() { return orderDetailID; }
    public void setOrderDetailID(Integer orderDetailID) { this.orderDetailID = orderDetailID; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public Integer getCreatedBy() { return createdBy; }
    public void setCreatedBy(Integer createdBy) { this.createdBy = createdBy; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }

    public String getProductName() { return productName; }
    public void setProductName(String productName) { this.productName = productName; }

    public String getCreatedByName() { return createdByName; }
    public void setCreatedByName(String createdByName) { this.createdByName = createdByName; }
}
