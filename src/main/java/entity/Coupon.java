package entity;

public class Coupon {
    public int couponId;
    public String code;
    public double discount;

    public Coupon(int couponId, String code, double discount) {
        this.couponId = couponId;
        this.code = code;
        this.discount = discount;
    }

    public int getCouponId() {
        return couponId;
    }

    public String getCode() {
        return code;
    }

    public double getDiscount() {
        return discount;
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
