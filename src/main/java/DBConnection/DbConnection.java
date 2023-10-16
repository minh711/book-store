package DBConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;



/**
 * Class for managing a database connection using JDBC.
 * @author mummykiara
 */
public class DbConnection {
    
    private static Connection conn = null;
    
    /**
     * Retrieves a database connection. If a connection does not exist, it creates one.
     * @return The database connection.
     * @author MinhTD
     */
    public static Connection getConnection() {
        if (conn == null) {
            // Rename to match your database here
            String server = "MUMMYKIARABFCE\\SQLEXPRESS";
            String port = "1433";
            String database = "SWPProject";
            String user = "sa";
            String password = "nhulnt";
          
            try {
                // Declare driver
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                conn = DriverManager.getConnection("jdbc:sqlserver://"
                        + server + ":" + port + ";databaseName=" + database + ";"
                        + "user=" + user + ";password=" + password
                        + ";encrypt=true;" + "trustServerCertificate=true;");
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(DbConnection.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return conn;
    }
    
    public static void main(String[]args){
        DbConnection a = new DbConnection();
    }
}