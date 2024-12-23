package dao;

import context.JDBIContext;
import entity.Payment;
import entity.Shipping;

import java.io.Serializable;

public class PaymentDAO implements Serializable {
        public Payment getPaymentByOrdID(int ordID) {
            return JDBIContext.getJdbi().withHandle(handle ->
                    handle.createQuery("select * from payments where ordID= :ordID")
                            .bind("ordID", ordID)
                            .mapToBean(Payment.class).findOne().orElse(null)
            );
        }

    public static void main(String[] args) {
        PaymentDAO dao = new PaymentDAO();
        System.out.println(dao.getPaymentByOrdID(20));;
    }

}
