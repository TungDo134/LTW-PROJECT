package dao;

import context.DBConntext;
import entity.Coupon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CouponDAO {
    public List<Coupon> getAllCoupon() {
        ArrayList<Coupon> list = new ArrayList<>();
        try {
            Connection conn = DBConntext.getConnection();
            String query = "SELECT * FROM coupons";
            PreparedStatement pst = conn.prepareStatement(query);

            System.out.println(query);
            ResultSet rs = pst.executeQuery();
            while (rs.next()){
                list.add(new Coupon(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getDouble(3)
                ));
            }
            DBConntext.closeConnection(conn);

        } catch (Exception e){
            e.printStackTrace();
        }
    return list;
    }
}
