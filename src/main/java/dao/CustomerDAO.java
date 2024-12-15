package dao;

import context.DBConntext;
import entity.Customer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO {

    public  List<Customer> getAllUser() {

        ArrayList<Customer> list = new ArrayList<>();

        try {
            Connection conn = DBConntext.getConnection();

            String query = "SELECT * FROM customers";
            PreparedStatement pst = conn.prepareStatement(query);

            System.out.println(query);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                list.add(new Customer(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getByte(7)
                ));
            }
            DBConntext.closeConnection(conn);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public Customer getUserByEmail(String email, String pass){
        try {
            Connection conn = DBConntext.getConnection();

            String query = "SELECT * FROM customers WHERE email = ? AND pass = ?";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setString(1,email);
            pst.setString(2,pass);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                return new Customer(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getByte(7)
                );
            }
            System.out.println(query);
            DBConntext.closeConnection(conn);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
    }
