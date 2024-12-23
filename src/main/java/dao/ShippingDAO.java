package dao;

import context.JDBIContext;
import entity.Category;
import entity.Order;
import entity.Shipping;

import java.io.Serializable;

public class ShippingDAO implements Serializable {

    public Shipping getShippingByOrdID(int ordID) {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createQuery("select * from shippings where orderID= :orderID")
                        .bind("orderID", ordID)
                        .mapToBean(Shipping.class).findOne().orElse(null)
        );
    }

    public int insertShipping(Shipping shipping) {
        return JDBIContext.getJdbi().withHandle(handle ->
                (handle.createUpdate(" INSERT INTO shippings (orderID, status) VALUES ( :orderID, :status)")
                        .bind("orderID", shipping.getOrderID())
                        .bind("status", shipping.getStatus())
                        .execute())
        );
    }

    public static void main(String[] args) {
        ShippingDAO dao = new ShippingDAO();
        System.out.println(dao.getShippingByOrdID(20));
        ;
    }
}
