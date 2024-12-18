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
            return handle.createQuery("SELECT * FROM customers where email = :email and pass = :pass")
                    .bind("email", email)
                    .bind("pass", pass)
                    .mapToBean(Customer.class).one();
        }
    }


}
