package entity;

import java.time.LocalDateTime;

public class Inventory {
    private int productID;
    private int quantityInStock;
    private int quantitySold;
    private int quantityReserved;
    private int reorderLevel;
    private LocalDateTime lastUpdated;
    private String productName;  // Thêm thuộc tính productName

    public Inventory(int productID, int quantityInStock, int quantitySold, int quantityReserved, int reorderLevel, LocalDateTime lastUpdated) {
        this.productID = productID;
        this.quantityInStock = quantityInStock;
        this.quantitySold = quantitySold;
        this.quantityReserved = quantityReserved;
        this.reorderLevel = reorderLevel;
        this.lastUpdated = lastUpdated;
    }

    public Inventory() {
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getQuantityInStock() {
        return quantityInStock;
    }

    public void setQuantityInStock(int quantityInStock) {
        this.quantityInStock = quantityInStock;
    }

    public int getQuantitySold() {
        return quantitySold;
    }

    public void setQuantitySold(int quantitySold) {
        this.quantitySold = quantitySold;
    }

    public int getQuantityReserved() {
        return quantityReserved;
    }

    public void setQuantityReserved(int quantityReserved) {
        this.quantityReserved = quantityReserved;
    }

    public int getReorderLevel() {
        return reorderLevel;
    }

    public void setReorderLevel(int reorderLevel) {
        this.reorderLevel = reorderLevel;
    }

    public LocalDateTime getLastUpdated() {
        return lastUpdated;
    }

    public void setLastUpdated(LocalDateTime lastUpdated) {
        this.lastUpdated = lastUpdated;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    @Override
    public String toString() {
        return "Inventory{" +
                "productID='" + productID + '\'' +
                ", quantityInStock=" + quantityInStock +
                ", quantitySold=" + quantitySold +
                ", quantityReserved=" + quantityReserved +
                ", reorderLevel=" + reorderLevel +
                ", lastUpdated=" + lastUpdated +
                '}';
    }
}
