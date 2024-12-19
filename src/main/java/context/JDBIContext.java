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
            // Tạo kết nối
            String url = DBConfig.getProperty("db.url");
            String username = DBConfig.getProperty("db.username");
            String password = DBConfig.getProperty("db.password");
            String driver = DBConfig.getProperty("db.driver");

            Connection connection = null;
            try {
                Class.forName(driver);
//                DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
                connection = DriverManager.getConnection(url, username, password);
            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
            // Tạo instance JDBI từ kết nối
            jdbi = Jdbi.create(connection);
        }
        return jdbi;
    }
}
