package utilDB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class UtilDB 
{
    public static Connection getPostgresConnection() throws ClassNotFoundException, SQLException
    {
        Class.forName("org.postgresql.Driver");
        String url = "jdbc:postgresql://ec2-54-75-249-162.eu-west-1.compute.amazonaws.com:5432/d3ga2duri9utgj?ssl=true&sslfactory=org.postgresql.ssl.NonValidatingFactory";
        Connection conn = DriverManager.getConnection(url, "zdymfuwbsaeywh", "b3582156c187362dbfceff3dccffcb75a751506311aeb819186374276221bdba");
        return conn;
    }
}
