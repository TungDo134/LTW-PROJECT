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
            return handle.createQuery("SELECT * FROM customers WHERE email = :email and pass = :pass")
                    .bind("email", email)
                    .bind("pass", pass)
                    .mapToBean(Customer.class).findOne().orElse(null);
        }
    }

    public int insertCustomer(String customerName, String email, String pass, String phone, String address, String role) {
        Byte roler = Byte.valueOf(role);
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createUpdate("INSERT INTO customers (customerName, email, pass, phone, address, role)\n" +
                                "VALUES (:customerName, :email, :pass, :phone, :address, :role);")
                        .bind("customerName", customerName)
                        .bind("email", email)
                        .bind("pass", pass)
                        .bind("phone", phone)
                        .bind("address", address)
                        .bind("role", roler)
                        .execute()

        );
    }

    public int deleteUser(int customerID) {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createUpdate("DELETE FROM customers WHERE customerID =:customerID")
                        .bind("customerID", customerID)
                        .execute()
        );
    }

    public int updateUser(String customerName, String email, String phone, String address, String roleTxt) {
        Byte role = Byte.valueOf(roleTxt);
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createUpdate("UPDATE customers set customerName = :customerName, phone =:phone, address = :address, role = :role WHERE email=:email")
                        .bind("customerName", customerName)
                        .bind("email", email)
                        .bind("phone", phone)
                        .bind("address", address)
                        .bind("role", role)
                        .execute()
        );
    }

    public Customer getUserByID(String customerID) {
        return JDBIContext.getJdbi().withHandle(handle ->
                (handle.createQuery("select * from customers where customerID = :customerID")
                        .bind("customerID", customerID)
                        .mapToBean(Customer.class).one()
                ));
    }

    public static void main(String[] args) {
        CustomerDAO dao = new CustomerDAO();
        dao.updateUser("Tùng Đỗ Khùng","tung134@gmail.com",
                "0392929929", "TPHCM", "0" );
    }
}

