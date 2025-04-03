package dao;

import context.JDBIContext;
import entity.Discount;

import java.util.List;

public class DiscountDAO {

    // lấy hết các giảm giá
    public List<Discount> getAllDiscount() {
        return JDBIContext.getJdbi().withHandle(handle ->
                (handle.createQuery("select * from discount ")
                        .mapToBean(Discount.class)
                        .list())
        );
    }


}
