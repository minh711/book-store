package DAOs.DBModelDAOs;

import Models.DBModels.Notification;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author MinhTD
 */
public class NotificationDAO {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public NotificationDAO() {
        conn = DBConnection.DbConnection.getConnection();
    }
    
    public Notification[] getAllByAccountId(int accountId) {
        List<Notification> ls = new ArrayList<>();
        String sql
                = "SELECT * "
                + "FROM [Notification] "
                + "WHERE [isViewed] = 0"; // 0 means False in BIT data type
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                ls.add(new Notification(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getBoolean(3),
                        rs.getInt(4)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(NotificationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        Notification[] arr = new Notification[ls.size()];
        ls.toArray(arr);
        return arr;
    }
    
    public int addNew(Notification n) {
        int result = 0;
        String sql
                = "INSERT INTO [Notification] "
                + "(notification, isViewed, accountId) "
                + "VALUES"
                + "(?, 0, ?)";
        try {
            ps = conn.prepareStatement(sql);
        } catch (SQLException ex) {
            Logger.getLogger(NotificationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
    
    public int setViewed(int id) {
        int result = 0;
        String sql
                = "UPDATE Notification "
                + "SET isViewed = 1 "
                + "WHERE id = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            result = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(NotificationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
}
