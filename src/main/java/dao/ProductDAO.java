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

    public Product getProductByID(int ProID){
        return JDBIContext.getJdbi().withHandle(handle ->
                (handle.createQuery("select * from products where productID = :productID")
                        .bind("productID",ProID)
                        .mapToBean(Product.class).one())
        );

    }
    public List<Product> getProductByCate(int CateID){
        return JDBIContext.getJdbi().withHandle(handle ->
                (handle.createQuery("select * from products where cateID = :cateID")
                        .bind("cateID",CateID)
                        .mapToBean(Product.class).list())
        );

    }
}
