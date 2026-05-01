import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String host = "switchyard.proxy.rlwy.net";
            String port = "19169";
            String database = "railway";
            String user = "root";
            String password = "rCygbYnzyHvaFlmUiJBhXisaDtKyIihA";
            String url = "jdbc:mysql://" + host + ":" + port + "/" + database +
                "?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
            con = DriverManager.getConnection(url, user, password);
            System.out.println("Database Connected!");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}