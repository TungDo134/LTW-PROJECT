package dao;

import context.DBConntext;
import context.JDBIContext;
import entity.Coupon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CouponDAO {
    public List<Coupon> getAllCoupon() {
        return JDBIContext.getJdbi().withHandle(handle ->
                (handle.createQuery("select * from coupons").mapToBean(Coupon.class).list())
        );
    }
    public int addCoupon(String code, double discount) {
        return JDBIContext.getJdbi().withHandle(handle -> (
            handle.createUpdate("INSERT INTO coupons (code, discount) VALUES (:code, :discount)")
                    .bind("code", code)
                    .bind("discount", discount)
                    .execute())


         );
    }

}
