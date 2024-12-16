package dao;


import context.JDBIContext;
import entity.Category;



import java.util.List;

public class CategoryDAO {
    public List<Category> getAllCate() {
        return JDBIContext.getJdbi().withHandle(handle ->
                (handle.createQuery("select * from categories").mapToBean(Category.class).list())
        );
    }

}
