package entity;

public class Product {
    public int productID;
    public String productName;
    public String productDes;
    public double productPrice;
    public int productInventory;
    public int productOrder;
    public int productStock;
    public String productImage;
    public int cateID;
    public String shortDes;

    public Product(int productID, String productName, String productDes, double productPrice, int productInventory, int productOrder, int productStock, String productImage, int cateID, String shortDes) {
        this.productID = productID;
        this.productName = productName;
        this.productDes = productDes;
        this.productPrice = productPrice;
        this.productInventory = productInventory;
        this.productOrder = productOrder;
        this.productStock = productStock;
        this.productImage = productImage;
        this.cateID = cateID;
        this.shortDes = shortDes;
    }

    public Product(){
    }

    public int getProductID() {
        return productID;
    }

    public String getProductName() {
        return productName;
    }

    public String getProductDes() {
        return productDes;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public int getProductInventory() {
        return productInventory;
    }

    public int getProductOrder() {
        return productOrder;
    }

    public int getProductStock() {
        return productStock;
    }

    public String getProductImage() {
        return productImage;
    }

    public int getCateID() {
        return cateID;
    }

    public String getShortDes() {
        return shortDes;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public void setProductDes(String productDes) {
        this.productDes = productDes;
    }

    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }

    public void setProductInventory(int productInventory) {
        this.productInventory = productInventory;
    }

    public void setProductOrder(int productOrder) {
        this.productOrder = productOrder;
    }

    public void setProductStock(int productStock) {
        this.productStock = productStock;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    public void setCateID(int cateID) {
        this.cateID = cateID;
    }

    public void setShortDes(String shortDes) {
        this.shortDes = shortDes;
    }

    @Override
    public String toString() {
        return "product{" +
                "productID=" + productID +
                ", productName='" + productName + '\'' +
                ", productDes='" + productDes + '\'' +
                ", productPrice=" + productPrice +
                ", productInventory=" + productInventory +
                ", productOrder=" + productOrder +
                ", productStock=" + productStock +
                ", productImage='" + productImage + '\'' +
                ", cateID=" + cateID +
                ", shortDes='" + shortDes + '\'' +
                '}';
    }
}
