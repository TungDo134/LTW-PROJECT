package dao;

import context.JDBIContext;
import entity.Coupon;
import entity.Customer;
import entity.Order;

import java.sql.Date;
import java.time.LocalDate;
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

    public Order getOrderByCusId(int id) {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createQuery("select * from orders where cusID= :cusID")
                        .bind("cusID", id)
                        .mapToBean(Order.class).findOne().orElse(null)
        );
    }

    public int createOrder(int id, double totalPrice, String status, int quantity, Date date) {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createUpdate("INSERT INTO orders (cusID, totalPrice, status, quantity, date)\n" +
                                "VALUES (:cusID, :totalPrice, :status, :quantity, :date);")
                        .bind("cusID", id)
                        .bind("totalPrice", totalPrice)
                        .bind("status", status)
                        .bind("quantity", quantity)
                        .bind("date", date)
                        .executeAndReturnGeneratedKeys("id") // Trả về khóa tự động tăng của cột `id`
                        .mapTo(int.class) // Map giá trị `id` sang kiểu `int`
                        .one() // Lấy giá trị duy nhất (ID)

        );
    }


    public static void main(String[] args) {
        System.out.println(Date.valueOf(LocalDate.now()));
    }
}
