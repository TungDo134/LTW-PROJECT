package context;

import org.jdbi.v3.core.Jdbi;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBIContext {
    private static Jdbi jdbi;

    private JDBIContext() {
    }

    public static Jdbi getJdbi() {
        if (jdbi == null) {
            // Tạo kết nối JDBC

            String url = "jdbc:mySQL://localhost:3306/ltw";
            String username = "root";
            String password = "";

            Connection connection = null;
            try {
                DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
                connection = DriverManager.getConnection(url, username, password);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

            // Tạo instance JDBI từ kết nối
            jdbi = Jdbi.create(connection);
        }
        return jdbi;
    }
}
