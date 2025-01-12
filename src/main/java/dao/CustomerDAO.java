package dao;

import context.JDBIContext;
import entity.Customer;
import org.jdbi.v3.core.Handle;
import helper.MaHoaMK;


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


    public Customer getUserByEmailPass(Customer customer) {
        try (Handle handle = JDBIContext.getJdbi().open()) {
            return handle.createQuery("SELECT * FROM customers WHERE email = :email and pass = :pass")
                    .bind("email", customer.getEmail())
                    .bind("pass", customer.getPass())
                    .mapToBean(Customer.class).findOne().orElse(null);
        }
    }

    public int createNewCustomer(Customer customer) {
        try (Handle handle = JDBIContext.getJdbi().open()) {
            return handle.createUpdate("INSERT INTO customers (customerName, email, pass,role)\n" +
                            "VALUES (:customerName, :email, :pass, :role)")
                    .bind("customerName", customer.getName())
                    .bind("email", customer.getEmail())
                    .bind("pass", customer.getPass())
                    .bind("role", customer.getRole())
                    .execute();
        }
    }

    public int insertCustomer(String customerName, String email, String pass, String phone, String address, String addressShipping, String role) {
        Byte roler = Byte.valueOf(role);
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createUpdate("INSERT INTO customers (customerName, email, pass, phone, address, addressShipping, role)\n" +
                                "VALUES (:customerName, :email, :pass, :phone, :address, :addressShipping, :role);")
                        .bind("customerName", customerName)
                        .bind("email", email)
                        .bind("pass", pass)
                        .bind("phone", phone)
                        .bind("address", address)
                        .bind("addressShipping", addressShipping)
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

    public int updateUser(String customerName, String email, String phone, String address, String addressShipping, String roleTxt) {
        Byte role = Byte.valueOf(roleTxt);
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createUpdate("UPDATE customers set customerName = :customerName, phone =:phone, address = :address, addressShipping=:addressShipping, role = :role WHERE email=:email")
                        .bind("customerName", customerName)
                        .bind("email", email)
                        .bind("phone", phone)
                        .bind("address", address)
                        .bind("addressShipping", addressShipping)
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

    public Customer getCusByID(int cusID) {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createQuery("select * from customers where customerID= :customerID")
                        .bind("customerID", cusID)
                        .mapToBean(Customer.class).findOne().orElse(null)
        );
    }

    public boolean isUserExistsByEmail(String email) {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createQuery("SELECT COUNT(*) FROM customers WHERE email = :email")
                        .bind("email", email)
                        .mapTo(Integer.class)
                        .findOne()
                        .orElse(0) > 0
        );
    }

    public boolean changePassword(int customerID, String oldPassword, String newPassword) {
        return JDBIContext.getJdbi().withHandle(handle -> {
            // Kiểm tra mật khẩu cũ có đúng không
            Customer customer = handle.createQuery("SELECT * FROM customers WHERE customerID = :customerID AND pass = :oldPassword")
                    .bind("customerID", customerID)
                    .bind("oldPassword", oldPassword)
                    .mapToBean(Customer.class)
                    .findOne()
                    .orElse(null);

            if (customer == null) {
                return false; // Mật khẩu cũ không đúng
            }

            // Cập nhật mật khẩu mới
            int rowsUpdated = handle.createUpdate("UPDATE customers SET pass = :newPassword WHERE customerID = :customerID")
                    .bind("newPassword", newPassword)
                    .bind("customerID", customerID)
                    .execute();

            return rowsUpdated > 0; // Nếu có dòng bị ảnh hưởng thì trả về true
        });
    }

    public int resetPassword(String customerID) {
        String sql = "update customers set pass=? where customerID= ?";
        String tempPass= MaHoaMK.toSHA1("0");
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bind(0, tempPass)
                        .bind(1, customerID)
                        .execute()
        );
    }


}

