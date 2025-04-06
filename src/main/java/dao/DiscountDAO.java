package dao;

import context.JDBIContext;
import entity.Discount;
import entity.Product;

import java.sql.Timestamp;
import java.util.List;

public class DiscountDAO {

    // lấy hết các giảm giá
    public List<Discount> getAllDiscount() {
        return JDBIContext.getJdbi().withHandle(handle ->
                (handle.createQuery("select * from discounts ")
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
                                " JOIN discounts d ON pd.discountID = d.discountID;\n")
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
                                " JOIN discounts d ON pd.discountID = d.discountID )")
                        .mapToBean(Product.class)
                        .list()
        );
    }

    // thêm các sản phẩm và mã giảm tương ứng
    public void addProductAndDiscount(String pId, String discountID) {
        String sql = "INSERT INTO productdiscount (productID, discountID) VALUES (:productID, :discountID)";
        JDBIContext.getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("productID", pId)
                        .bind("discountID", discountID)
                        .execute()
        );
    }

    // lấy object discount từ id
    public Discount getDiscount(String discountId) {
        return JDBIContext.getJdbi().withHandle(handle ->
                (handle.createQuery("select * from discounts where discountID = :discountID ")
                        .bind("discountID", discountId)
                        .mapToBean(Discount.class)
                        .one())
        );
    }

    // thêm mới discount
    public void addDiscount(String discountType, String discountValue, Timestamp startDate, Timestamp endDate) {
        String sql = "INSERT INTO discounts (discountType, discountValue, startDate, endDate) " +
                "VALUES (:discountType, :discountValue, :startDate, :endDate)";
        JDBIContext.getJdbi().withHandle(handle -> (
                handle.createUpdate(sql)
                        .bind("discountType", discountType)
                        .bind("discountValue", discountValue)
                        .bind("startDate", startDate)
                        .bind("endDate", endDate)
                        .execute()
        ));
    }

    public static void main(String[] args) {
        DiscountDAO dao = new DiscountDAO();
        System.out.println(dao.getDiscount("3"));
    }
}
