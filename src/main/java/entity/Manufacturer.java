package entity;

public class Manufacturer {
    public int manuID;
    public String manuName;

    public String brandOrigin;

    public String manufactureLocation;

    public Manufacturer(int manuID, String manuName) {
        this.manuID = manuID;
        this.manuName = manuName;

    }

    public Manufacturer() {
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

    public int getManuID() {
        return manuID;
    }

    public void setManuID(int manuID) {
        this.manuID = manuID;
    }

    public String getManuName() {
        return manuName;
    }

    public void setManuName(String manuName) {
        this.manuName = manuName;
    }

    @Override
    public String toString() {
        return "Manufacturer{" +
                "manuID=" + manuID +
                ", manuName='" + manuName + '\'' +
                ", brandOrigin='" + brandOrigin + '\'' +
                ", manufactureLocation='" + manufactureLocation + '\'' +
                '}';
    }
}