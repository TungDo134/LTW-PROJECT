package dao;

import context.JDBIContext;
import entity.Order;
import entity.OrderDetail;

import java.sql.Date;
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

    public int createOrderDetail(String ordID, int quantity, double price, String pName, String img) {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createUpdate("INSERT INTO orderdetails (orderID, quantity, price, productName, productImage)\n" +
                                "VALUES (:orderID, :quantity, :price, :productName, :productImage);")
                        .bind("orderID", ordID)
                        .bind("quantity", quantity)
                        .bind("price", price)
                        .bind("productName", pName)
                        .bind("productImage", img)
                        .execute()
        );
    }

}
