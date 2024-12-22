package dao;

import context.JDBIContext;
import entity.Coupon;
import entity.Customer;
import entity.Order;

import java.util.List;

public class OrderDAO {

    // hiển thị tất cả đơn hàng
    public List<Order> getAllOrder() {
        return JDBIContext.getJdbi().withHandle(handle ->
                (handle.createQuery("select * from orders ").mapToBean(Order.class).list())
        );
    }
    public Order getOrderById(String id) {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createQuery("select * from orders where orderID= :orderID")
                        .bind("orderID", id)
                        .mapToBean(Order.class).findOne().orElse(null)
        );
    }

    public static void main(String[] args) {
        OrderDAO dao = new OrderDAO();
        System.out.println(dao.getOrderById("35"));
    }
}
