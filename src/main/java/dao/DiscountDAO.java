package dao;

import context.JDBIContext;
import entity.Discount;
import entity.Product;

import java.util.List;

public class DiscountDAO {

    // lấy hết các giảm giá
    public List<Discount> getAllDiscount() {
        return JDBIContext.getJdbi().withHandle(handle ->
                (handle.createQuery("select * from discount ")
                        .mapToBean(Discount.class)
                        .list())
        );
    }

    // Lấy sản phẩm có giảm giá
    public List<Product> getDiscountedProducts() {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createQuery("SELECT p.productID, p.productName, p.productPrice, d.discountID, d.discountType, d.discountValue\n" +
                                "FROM products p\n" +
                                " JOIN productdiscount pd ON p.productID = pd.productID\n" +
                                " JOIN discount d ON pd.discountID = d.discountID;\n")
                        .mapToBean(Product.class)
                        .list()
        );
    }

    // Lấy sản phẩm không có giảm giá
    public List<Product> getNonDiscountedProducts() {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createQuery("SELECT p.productID, p.productName, p.productPrice, p.cateID " +
                                "FROM products p " +
                                "WHERE p.productID NOT IN (" +
                                "SELECT pd.productID " +
                                "FROM productDiscount pd " +
                                " JOIN discount d ON pd.discountID = d.discountID )")
                        .mapToBean(Product.class)
                        .list()
        );
    }

    public static void main(String[] args) {
        DiscountDAO dao = new DiscountDAO();
        System.out.println(dao.getDiscountedProducts() + "\n");

        System.out.println("Sp khong co giam gia:");
        System.out.println(dao.getNonDiscountedProducts());
    }

}
