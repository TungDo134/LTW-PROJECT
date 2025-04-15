package dao;

import context.JDBIContext;
import entity.Cart;

import java.util.List;

public class CartDAO {
    // lấy tất cả các cart
    public List<Cart> getAllCart() {
        return JDBIContext.getJdbi().withHandle(handle ->
                (handle.createQuery("select * from carts").mapToBean(Cart.class).list())
        );
    }

    // Tạo mới 1 cart
    public int createCart(int customerID, byte isCheckedOut) {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createUpdate("INSERT INTO carts (customerID ,isCheckedOut)\n" +
                                "VALUES (:customerID, :isCheckedOut);")
                        .bind("customerID", customerID)
                        .bind("isCheckedOut", isCheckedOut)
                        .executeAndReturnGeneratedKeys("id") // Trả về khóa tự động tăng của cột `id`
                        .mapTo(int.class) // Map giá trị `id` sang kiểu `int`
                        .one() // Lấy giá trị duy nhất (ID)
        );
    }

    // Ktra user có cart 'CHƯA' check out ?
    public Cart getCartCheckOutByCusId(int cusId) {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createQuery("select * from carts where customerID= :customerID AND isCheckedOut= :isCheckedOut")
                        .bind("customerID", cusId)
                        .bind("isCheckedOut", 1)
                        .mapToBean(Cart.class).findOne().orElse(null)
        );
    }


    // lấy cartID
    public Integer getCartIDByCusID(int cusId) {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createQuery("SELECT cartID FROM carts WHERE customerID = :customerID")
                        .bind("customerID", cusId)
                        .mapTo(Integer.class)
                        .one() // Lấy một giá trị duy nhất
        );
    }

    // thêm cart item từ cartID
    public void insertCartItemByCartID(int cartID) {

    }

    public static void main(String[] args) {
        CartDAO cartDAO = new CartDAO();
    }


}
