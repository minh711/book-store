package DAO.DBModels;


import DBConnection.DbConnection;
import Models.DBModels.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DatNTT
 */
public class loginDao extends DbConnection {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public loginDao() {
        conn = DBConnection.DbConnection.getConnection();
    }

    public Account checkPass(String user, String pass) throws SQLException {
        String sql = "SELECT * FROM [dbo].[Account] WHERE username=? AND password=?";
//        pass = Utilities.MD5Hash.MD5Hash(pass);
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();

            if (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getDate(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getBoolean(10), rs.getInt(11));
            }

        } catch (SQLException ex) {
            Logger.getLogger(loginDao.class.getName()).log(Level.SEVERE, null, ex);
            
        }
        
        
        return null;

    }
    
    
    public Account checkUser(String user) throws SQLException {
        String sql = "SELECT * FROM [dbo].[Account] WHERE username=? ";

        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, user);

            rs = ps.executeQuery();

            if (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getDate(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getBoolean(10), rs.getInt(11));
            }

        } catch (SQLException ex) {
            Logger.getLogger(loginDao.class.getName()).log(Level.SEVERE, null, ex);
            
        }
        
        
        return null;

    }
    
    
    

}
