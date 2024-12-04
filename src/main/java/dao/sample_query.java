package dao;

import context.DBConntext;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class sample_query {
    public static void getProduct() {
        String query = "select * from customers";

        try {
            Connection conn = DBConntext.getConnection();
            Statement statement = conn.createStatement();
            ResultSet rs = statement.executeQuery(query);
            while (rs.next()) {
                int id = rs.getInt("CusID"); // Lấy giá trị của cột "id"
                String name = rs.getString("Cusname"); // Lấy giá trị của cột "name"
                String email = rs.getString("email"); // Lấy giá trị của cột "email"
                System.out.println("ID: " + id + ", Name: " + name + ", Email: " + email);
            }
            DBConntext.closeConnection(conn);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
    getProduct();
    }
}
