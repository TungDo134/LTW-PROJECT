package context;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConntext {
    public static Connection getConnection() {
        Connection c = null;

        try {
            DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
            // Các thông số
            String url = "jdbc:mySQL://localhost:3306/ltw";
            String username = "root";
            String password = "";

            // Tạo kết nối
            c = DriverManager.getConnection(url, username, password);

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return c;
    }

    public static void closeConnection(Connection c) {
        try {
            if (c != null) {
                c.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void printInfo(Connection c) {
        try {
            if (c != null) {
                DatabaseMetaData mtdt = c.getMetaData();
                // Lấy tên sản phẩm cơ sở dữ liệu
                System.out.println("Database Product Name: " + mtdt.getDatabaseProductName());
                // Lấy phiên bản sản phẩm cơ sở dữ liệu
                System.out.println("Database Product Version: " + mtdt.getDatabaseProductVersion());
                // Lấy tên cơ sở dữ liệu hiện tại
                System.out.println("Current Database: " + c.getCatalog());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public static void main(String[] args) {
        DBConntext.getConnection();
        printInfo(DBConntext.getConnection());
    }

}
