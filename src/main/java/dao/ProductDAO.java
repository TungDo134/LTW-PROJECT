package dao;

import context.DBConntext;
import context.JDBIContext;
import entity.Feedback;
import entity.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
//    public  List<Product> getProduct() {
//
//        ArrayList<Product> list = new ArrayList<>();
//
//        try {
//            Connection conn = DBConntext.getConnection();
//
//            String query = "SELECT * FROM products";
//            PreparedStatement pst = conn.prepareStatement(query);
//
//            System.out.println(query);
//            ResultSet rs = pst.executeQuery();
//
//            while (rs.next()) {
//                list.add(new Product(
//                        rs.getInt(1),
//                        rs.getString(2),
//                        rs.getString(3),
//                        rs.getDouble(4),
//                        rs.getInt(5),
//                        rs.getInt(6),
//                        rs.getInt(7),
//                        rs.getString(8),
//                        rs.getInt(9),
//                        rs.getString(10)
//
//                ));
//            }
//            DBConntext.closeConnection(conn);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return list;
//    }

    public List<Product> getProduct() {
        return JDBIContext.getJdbi().withHandle(handle ->
                (handle.createQuery("select * from products").mapToBean(Product.class).list())
        );
    }
}
