package dao;

import context.JDBIContext;
import entity.Cart;
import entity.CartItem;

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

    // Ktra user đã có cart check out || chưa có cart nào
    public Cart getCartCheckedOutOrExistByCusId(int cusId) {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createQuery("select * from carts where customerID= :customerID AND isCheckedOut= :isCheckedOut")
                        .bind("customerID", cusId)
                        .bind("isCheckedOut", 0)
                        .mapToBean(Cart.class).findOne().orElse(null)
        );
    }


    // lấy cartID
    public Integer getCartIDByCusID(int cusId) {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createQuery("SELECT cartID FROM carts WHERE customerID = :customerID")
                        .bind("customerID", cusId)
                        .mapTo(Integer.class)
                        .findOne()
                        .orElse(-1)
        );
    }

    // thêm cart item từ cartID
    public void insertCartItemByCartID(int cartID, CartItem cartItem) {
        JDBIContext.getJdbi().withHandle(handle ->
                handle.createUpdate("INSERT INTO cartitems (cartID, title, price, img, quantity, totalCt, productID)" +
                                "VALUES (:cartID, :title, :price, :img, :quantity, :totalCt, :productID);")
                        .bind("cartID", cartID)
                        .bind("title", cartItem.getTitle())
                        .bind("price", cartItem.getPrice())
                        .bind("img", cartItem.getImg())
                        .bind("quantity", cartItem.getQuantity())
                        .bind("totalCt", cartItem.getTotalCt())
                        .bind("productID", cartItem.getProductID())
                        .execute()
        );
    }

    public boolean getCartItemByProductID(int productID) {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createQuery("SELECT 1 FROM cartitems WHERE productID = :productID LIMIT 1")
                        .bind("productID", productID)
                        .mapTo(Integer.class)
                        .findOne()
                        .isPresent()
        );
    }

    // lấy cart item
    public List<CartItem> getCartItemByCartID(int cartID) {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createQuery("SELECT * FROM cartitems WHERE cartID = :cartID ")
                        .bind("cartID", cartID)
                        .mapToBean(CartItem.class)
                        .list()
        );
    }


    // "ERROR WAITING FIX"
    public void updateProductInCartItem(int productID, int quantity, double totalCt) {
        JDBIContext.getJdbi().withHandle(handle -> (
                handle.createUpdate("Update cartitems  set quantity =:quantity, totalCt =:totalCt  where productID =:productID")
                        .bind("productID", productID)
                        .bind("quantity", quantity)
                        .bind("totalCt", totalCt)
                        .execute())
        );
    }

    public static void main(String[] args) {
        CartDAO cartDAO = new CartDAO();
        System.out.println(cartDAO.getCartIDByCusID(1));
    }


}
