package context;

import com.mysql.cj.jdbc.MysqlDataSource;
import org.jdbi.v3.core.Jdbi;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBIContext {
    static String url = "jdbc:mysql://" + DBProperties.host() + ":" + DBProperties.port() + "/" + DBProperties.name() + "?" + DBProperties.option();
    private static Jdbi jdbi;


    private JDBIContext() {
    }

    public static Jdbi getJdbi() {
        if (jdbi == null) {
            makeConnect();
        }
        return jdbi;
    }

    private static void makeConnect() {
        MysqlDataSource ds = new MysqlDataSource();
        ds.setURL(url);
        ds.setUser(DBProperties.username());
        ds.setPassword(DBProperties.password());

        try {
            ds.setUseCompression(true);
            ds.setAutoReconnect(true);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        jdbi = Jdbi.create(ds);
    }
}
