package dao;


import context.JDBIContext;
import entity.Category;


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
                        .execute())
        );
    }

    // thêm danh mục
    public int removeCate(String cID) {
        return JDBIContext.getJdbi().withHandle(handle ->
                (handle.createUpdate(" DELETE FROM categories WHERE  cateID =:cateID")
                        .bind("cateID", cID)
                        .execute())
        );
    }

}
