package dao;


import context.JDBIContext;
import entity.Product;

import java.util.List;

public class ProductDAO {
    public List<Product> getProduct() {
        return JDBIContext.getJdbi().withHandle(handle ->
                (handle.createQuery("select * from products").mapToBean(Product.class).list())
        );
    }
}
