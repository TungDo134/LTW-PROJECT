package context;
import java.io.IOException;
import java.util.Properties;

public class DBProperties {
    private static final Properties prop = new Properties();

    static {
        try {
            prop.load(DBProperties.class.getClassLoader().getResourceAsStream("db.properties"));
        } catch (IOException e) {
            throw new RuntimeException("Failed to load database properties file.", e);
        }
    }

    public static String host() {
        return prop.getProperty("db.host", "localhost");
    }

    public static int port() {
        try {
            return Integer.parseInt(prop.getProperty("db.port", "3306"));
        } catch (NumberFormatException e) {
            return 3306;
        }
    }

    public static String username() {
        return prop.getProperty("db.username", "root");
    }

    public static String password() {
        return prop.getProperty("db.password", "");
    }

    public static String name() {
        return prop.getProperty("db.name", "ltw");
    }

    public static String option() {
        return prop.getProperty("db.option", "useUnicode=true&characterEncoding=utf-8");
    }
}
