package dao;

import context.JDBIContext;
import entity.Customer;
import org.jdbi.v3.core.Handle;


import java.util.List;

public class CustomerDAO {

    public List<Customer> getUsers() {
        // Dùng withHandle để mở handle kết nối và thực hiện truy vấn
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createQuery("SELECT * FROM customers")
                        .mapToBean(Customer.class) // Ánh xạ kết quả thành đối tượng Customer
                        .list() // Trả về danh sách các khách hàng
        );
    }


    public Customer getUserByEmailPass(String email, String pass) {
        try (Handle handle = JDBIContext.getJdbi().open()) {
            return handle.createQuery("INSERT INTO customers (customerName, email, pass, phone, address, role) " +
                    "VALUES (:customerName, :email, :pass, :phone, :address, :role)")
                    .bind("email", email)
                    .bind("pass", pass)
                    .mapToBean(Customer.class).one();
        }
    }

    public int insertCustomer(String customerName, String email, String pass, String phone, String address, String role){
        Byte roler = Byte.valueOf(role);
        return JDBIContext.getJdbi().withHandle(handle ->
            handle.createUpdate("INSERT INTO customers (customerName, email, pass, phone, address, role)\n" +
                            "VALUES (:customerName, :email, :pass, :phone, :address, :role);")
                    .bind("customerName", customerName)
                    .bind("email", email)
                    .bind("pass",pass)
                    .bind("phone",phone)
                    .bind("address",address)
                    .bind("role", roler)
                    .execute()

        );
    }
}
