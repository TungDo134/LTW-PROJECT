package dao;


import context.JDBIContext;
import entity.Category;
import entity.Coupon;


import java.util.List;

public class CategoryDAO {

    // lấy hết danh mục
    public List<Category> getAllCate() {
        return JDBIContext.getJdbi().withHandle(handle ->
                (handle.createQuery("select * from categories Order by cateID DESC ").mapToBean(Category.class).list())
        );
    }

    // thêm danh mục
    public int insertCate(Category category) {
        return JDBIContext.getJdbi().withHandle(handle ->
                (handle.createUpdate(" INSERT INTO categories (cateName,cateImg) VALUES ( :cateName, :cateImg)")
                        .bind("cateName", category.getName())
                        .bind("cateImg", category.getCateImg())
                        .executeAndReturnGeneratedKeys("id") // Trả về khóa tự động tăng của cột `id`
                        .mapTo(int.class) // Map giá trị `id` sang kiểu `int`
                        .one()) // Lấy giá trị duy nhất (ID))
        );
    }

    // xóa danh mục
    public int removeCate(String cID) {
        return JDBIContext.getJdbi().withHandle(handle ->
                (handle.createUpdate(" DELETE FROM categories WHERE  cateID =:cateID")
                        .bind("cateID", cID)
                        .execute())
        );
    }

    // lấy 1 category dựa vào ID
    public Category getCateByID(int cateID) {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createQuery("select * from categories  where cateID = :cateID")
                        .bind("cateID", cateID)
                        .mapToBean(Category.class).findOne().orElse(null)
        );
    }

    // cập nhật danh mục dựa vào ID
    public int updateCate(int cateID, String cateName, String cateImg) {
        return JDBIContext.getJdbi().withHandle(handle -> (
                handle.createUpdate("Update categories  set cateName =:cateName, cateImg =:cateImg  where cateID =:cateID")
                        .bind("cateID", cateID)
                        .bind("cateName", cateName)
                        .bind("cateImg", cateImg)
                        .execute())
        );
    }


}
