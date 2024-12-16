package dao;

import context.JDBIContext;
import entity.Customer;
import org.jdbi.v3.core.Handle;


import java.util.List;

public class JDBI_Customer_DAO {

    public List<Customer> getUsers() {
        // Dùng withHandle để mở handle kết nối và thực hiện truy vấn
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createQuery("SELECT * FROM customers")
                        .mapToBean(Customer.class) // Ánh xạ kết quả thành đối tượng Customer
                        .list() // Trả về danh sách các khách hàng
        );
    }


    public List<Customer> getUserByEmailPass(String email, String pass) {
        try (Handle handle = JDBIContext.getJdbi().open()) {
            return handle.createQuery("SELECT * FROM customers where email = :email and pass = :pass")
                    .bind("email", email)
                    .bind("pass", pass)
                    .mapToBean(Customer.class).list();
        }
    }


//    public static void main(String[] args) {
//        JDBI_Customer_DAO dao = new JDBI_Customer_DAO();
//        List<Customer> users = dao.getUsers();
//        List<Customer> userEmailPass = dao.getUserByEmailPass("tung134@gmail.com", "13042004");
//        for (Customer user : users) {
//            System.out.println(user + "\n");
//        }
//    }
}
