package dao;

import context.JDBIContext;
import entity.OrderDetail;

import java.util.List;

public class OrderDetailDAO {

    // hiển thị tất cả voucher
    public List<OrderDetail> getAllOrderDetail() {
        return JDBIContext.getJdbi().withHandle(handle ->
                (handle.createQuery("select * from orderdetails ").mapToBean(OrderDetail.class).list())
        );
    }
}
