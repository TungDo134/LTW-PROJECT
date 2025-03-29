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

    public int createOrderDetail(String ordID, int productID, int quantity, double price, String pName, String img) {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createUpdate("INSERT INTO orderdetails (orderID, quantity,productID, price, productName, productImage)\n" +
                                "VALUES (:orderID, :quantity, :productID, :price, :productName, :productImage);")
                        .bind("orderID", ordID)
                        .bind("quantity", quantity)
                        .bind("productID", productID)
                        .bind("price", price)
                        .bind("productName", pName)
                        .bind("productImage", img)
                        .execute()
        );
    }

    public static void main(String[] args) {
        OrderDetailDAO od = new OrderDetailDAO();
        od.createOrderDetail("61", 19, 1, 5200.00, "Bút bi 1.0mm (xanh)",
                "but (11).avif");
    }
}
