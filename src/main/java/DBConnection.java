
import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    public static Connection getConnection() {
        Connection con = null;
        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");

            String host = System.getenv("MYSQLHOST") != null ? 
                System.getenv("MYSQLHOST") : "switchyard.proxy.rlwy.net";
            String port = System.getenv("MYSQLPORT") != null ? 
                System.getenv("MYSQLPORT") : "19169";
            String database = System.getenv("MYSQLDATABASE") != null ? 
                System.getenv("MYSQLDATABASE") : "railway";
            String user = System.getenv("MYSQLUSER") != null ? 
                System.getenv("MYSQLUSER") : "root";
            String password = System.getenv("MYSQLPASSWORD") != null ? 
                System.getenv("MYSQLPASSWORD") : "rCygbYnzyHvaFlmUiJBhXisaDtKyIihA";

            String url = "jdbc:mysql://" + host + ":" + port + "/" + database +
                "?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";

            System.out.println("Connecting to: " + url);

            con = DriverManager.getConnection(url, user, password);
            System.out.println("Database Connected Successfully!");

        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}