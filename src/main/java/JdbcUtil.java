import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

public class JdbcUtil {

    private static final Properties properties = new Properties();

    static {

        try (InputStream input = JdbcUtil.class.getClassLoader().getResourceAsStream("db.properties")) {
            if (input == null) {
                throw new RuntimeException("Sorry, unable to find db.properties in the classpath");
            }
            properties.load(input);

            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("Driver Registered and Properties Loaded Successfully");

        } catch (ClassNotFoundException | IOException e) {
            throw new RuntimeException("Failed to initialize JdbcUtil", e);
        }
    }

    public static Connection getConnection() throws SQLException {


        String url = properties.getProperty("db.url");
        String user = properties.getProperty("db.user");
        String password = properties.getProperty("db.password");

        return DriverManager.getConnection(url, user, password);
    }

    public static void CloseReso(Statement stat, Connection con) throws SQLException {

        stat.close();
        con.close();
    }


}