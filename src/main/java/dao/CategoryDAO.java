package dao;

import context.DBConntext;
import context.JDBIContext;
import entity.Category;
import entity.Customer;
import entity.Feedback;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO {
    public List<Category> getAllCate() {
        return JDBIContext.getJdbi().withHandle(handle ->
                (handle.createQuery("select * from categories").mapToBean(Category.class).list())
        );
    }

//    public void insertCate(String name){
//        try {
//            Connection conn = DBConntext.getConnection();
//            String query = "INSERT INTO  categories (CateName) values (?) ";
//            PreparedStatement pst = conn.prepareStatement(query);
//            pst.setString(1, name);
//
//            System.out.println(query);
//            pst.executeUpdate();
//            DBConntext.closeConnection(conn);
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
}
