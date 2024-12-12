package context;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConntext {
    public static Connection getConnection() {
        String jdbcURL = "jdbc:mysql://localhost:3306/test_222"; // Thay bằng tên database của bạn
        String username = "root"; // Thay bằng username của bạn
        String password = ""; // Thay bằng mật khẩu của bạn

        try {
            // Kết nối đến MySQL
            Connection connection = DriverManager.getConnection(jdbcURL, username, password);
            System.out.println("Kết nối thành công!");
            return connection;
        } catch (SQLException e) {
            System.out.println("Lỗi kết nối: " + e.getMessage());
            return null; // Trả về null nếu kết nối thất bại
        }
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
                System.out.println(mtdt.getDatabaseProductName());
                System.out.println(mtdt.getDatabaseProductVersion());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        Connection connection = DBConntext.getConnection();
        DBConntext.printInfo(connection);
        DBConntext.closeConnection(connection);
    }
}
