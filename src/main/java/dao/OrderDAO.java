package dao;

import context.JDBIContext;
import entity.Coupon;
import entity.Order;

import java.util.List;

public class OrderDAO {

    // hiển thị tất cả đơn hàng
    public List<Order> getAllOrder() {
        return JDBIContext.getJdbi().withHandle(handle ->
                (handle.createQuery("select * from orders ").mapToBean(Order.class).list())
        );
    }
}
