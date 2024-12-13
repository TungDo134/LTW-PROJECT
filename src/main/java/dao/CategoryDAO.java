package dao;

import context.DBConntext;
import entity.Category;
import entity.Customer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO {
    public List<Category> getAllCate() {
        ArrayList<Category> list = new ArrayList<>();
        try {
            Connection conn = DBConntext.getConnection();

            String query = "SELECT * FROM Category";
            PreparedStatement pst = conn.prepareStatement(query);

            System.out.println(query);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                list.add(new Category(
                        rs.getInt(1),
                        rs.getString(2)
                ));
            }
            DBConntext.closeConnection(conn);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
