 import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    public static Connection getConnection() {
        Connection con = null;
        try {
            String url = "jdbc:mysql://switchyard.proxy.rlwy.net:19169/railway?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
            String user = "root";
            String password = "rCygbYnzyHvaFlmUiJBhXisaDtKyIihA";
            con = DriverManager.getConnection(url, user, password);
            System.out.println("Database Connected!");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}
