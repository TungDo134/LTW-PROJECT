package dao;


import context.JDBIContext;
import entity.Coupon;

import java.util.List;

public class CouponDAO {

    // hiển thị tất cả voucher
    public List<Coupon> getAllCoupon() {
        return JDBIContext.getJdbi().withHandle(handle ->
                (handle.createQuery("select * from coupons order by couponID desc").mapToBean(Coupon.class).list())
        );
    }

    // thêm mới 1 voucher
    public int addCoupon(String code, double discount) {
        return JDBIContext.getJdbi().withHandle(handle -> (
                handle.createUpdate("INSERT INTO coupons (code, discount) VALUES (:code, :discount)")
                        .bind("code", code)
                        .bind("discount", discount)
                        .executeAndReturnGeneratedKeys("id") // Trả về khóa tự động tăng của cột `id`
                        .mapTo(int.class) // Map giá trị `id` sang kiểu `int`
                        .one()) // Lấy giá trị duy nhất (ID)
        );
    }

    // lấy 1 voucher dựa vào ID
    public Coupon getCouponByID(int couponID) {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createQuery("select * from coupons  where couponID = :couponID")
                        .bind("couponID", couponID)
                        .mapToBean(Coupon.class).findOne().orElse(null)
        );
    }

    // lấy 1 voucher dựa vào name
    public Coupon getCouponByName(String name) {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createQuery("select * from coupons  where code = :code")
                        .bind("code", name)
                        .mapToBean(Coupon.class).findOne().orElse(null)
        );
    }

    // kiểm tra có tồn tại  dựa vào name
    public boolean isCouponExist(String name) {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createQuery("SELECT EXISTS (SELECT 1 FROM coupons WHERE code = :code)")
                        .bind("code", name)
                        .mapTo(Boolean.class)
                        .one()
        );
    }


    // cập nhật voucher dựa vào ID
    public int updateCoupon(int couponID, String code, String discount) {
        return JDBIContext.getJdbi().withHandle(handle -> (
                handle.createUpdate("Update coupons  set code =:code, discount =:discount  where couponID =:couponID")
                        .bind("couponID", couponID)
                        .bind("code", code)
                        .bind("discount", discount)
                        .execute())
        );
    }

    // xóa voucher dựa vào ID
    public int deleteCoupon(int couponID) {
        return JDBIContext.getJdbi().withHandle(handle -> (
                handle.createUpdate("DELETE FROM coupons WHERE couponID =:couponID")
                        .bind("couponID", couponID)
                        .execute())
        );
    }


}
