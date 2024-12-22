package dao;

import context.JDBIContext;
import entity.Order;
import entity.OrderDetail;

import java.util.List;

public class OrderDetailDAO {

    // hiển thị tất cả voucher
    public List<OrderDetail> getAllOrderDetail(String orderId) {
        return JDBIContext.getJdbi().withHandle(handle ->
                (handle.createQuery("select * from orderdetails where orderId = :orderId")
                        .bind("orderId", orderId)
                        .mapToBean(OrderDetail.class).list())
        );
    }

}
