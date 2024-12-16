package context;

import org.jdbi.v3.core.Jdbi;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBIContext {
    private static Jdbi jdbi;

    public static Jdbi getJdbi() {
        if (jdbi == null) {
            try {
                String url = "jdbc:mysql://localhost:3306/ltw";
                String username = "root";
                String password = "";
                Connection connection = DriverManager.getConnection(url, username, password);



                // Khởi tạo JDBI với kết nối JDBC
                jdbi = Jdbi.create(connection);
            } catch (SQLException e) {
                System.err.println("Failed to connect to the database.");
                e.printStackTrace();
            }
        }
        return jdbi;
    }
}
