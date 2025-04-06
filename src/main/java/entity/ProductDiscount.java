package entity;

public class ProductDiscount {
    private int productID;
    private int discountID;

    public ProductDiscount(int productID, int discountID) {
        this.productID = productID;
        this.discountID = discountID;
    }

    public ProductDiscount() {
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getDiscountID() {
        return discountID;
    }

    public void setDiscountID(int discountID) {
        this.discountID = discountID;
    }

    @Override
    public String toString() {
        return "ProductDiscount{" +
                "productID=" + productID +
                ", discountID=" + discountID +
                '}';
    }
}


