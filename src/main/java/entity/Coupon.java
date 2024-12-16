package entity;

import org.jdbi.v3.core.mapper.reflect.ColumnName;

public class Coupon {
    public int couponId;
    public String code;
    public double discount;

    public Coupon(int couponId, String code, double discount) {
        this.couponId = couponId;
        this.code = code;
        this.discount = discount;
    }

    public Coupon() {
    }

    @ColumnName("CouponID")
    public int getCouponId() {
        return couponId;
    }

    public String getCode() {
        return code;
    }

    public double getDiscount() {
        return discount;
    }

    public void setCouponId(int couponId) {
        this.couponId = couponId;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    @Override
    public String toString() {
        return "Coupon{" +
                "couponId=" + couponId +
                ", code='" + code + '\'' +
                ", discount=" + discount +
                '}';
    }
}
