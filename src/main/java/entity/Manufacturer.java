package entity;

public class Manufacturer {
    private int manuID;
    private String supplierName;
    private String brand;
    private String brandOrigin;
    private String manufactureLocation;
    private String color;
    private String material;
    private double weight;
    private String dimensions;
    private boolean bestSeller;

    public Manufacturer(int manuID, String supplierName, String brand, String brandOrigin, String manufactureLocation, String color, String material, double weight, String dimensions, boolean bestSeller) {
        this.manuID = manuID;
        this.supplierName = supplierName;
        this.brand = brand;
        this.brandOrigin = brandOrigin;
        this.manufactureLocation = manufactureLocation;
        this.color = color;
        this.material = material;
        this.weight = weight;
        this.dimensions = dimensions;
        this.bestSeller = bestSeller;
    }

    public Manufacturer() {
    }

    public int getManuID() {
        return manuID;
    }

    public void setManuID(int manuID) {
        this.manuID = manuID;
    }

    public String getSupplierName() {
        return supplierName;
    }

    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getBrandOrigin() {
        return brandOrigin;
    }

    public void setBrandOrigin(String brandOrigin) {
        this.brandOrigin = brandOrigin;
    }

    public String getManufactureLocation() {
        return manufactureLocation;
    }

    public void setManufactureLocation(String manufactureLocation) {
        this.manufactureLocation = manufactureLocation;
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

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
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
        return "Manufacturer{" +
                "manuID=" + manuID +
                ", supplierName='" + supplierName + '\'' +
                ", brand='" + brand + '\'' +
                ", brandOrigin='" + brandOrigin + '\'' +
                ", manufactureLocation='" + manufactureLocation + '\'' +
                ", color='" + color + '\'' +
                ", material='" + material + '\'' +
                ", weight=" + weight +
                ", dimensions='" + dimensions + '\'' +
                ", bestSeller=" + bestSeller +
                '}';
    }
}
