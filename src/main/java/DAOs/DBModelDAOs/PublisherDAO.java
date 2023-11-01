package DAOs.DBModelDAOs;

import Models.DBModels.Distributor;
import Models.DBModels.Publisher;
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
public class PublisherDAO {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public PublisherDAO() {
        conn = DBConnection.DbConnection.getConnection();
    }

    /**
     * Get all available Publishers.
     *
     * @return Publisher array.
     * @author MinhTD
     */
    public Publisher[] getAll() {
        List<Publisher> ls = new ArrayList<>();
        String sql
                = "SELECT * "
                + "FROM [Publisher] "
                + "WHERE [isAvailable] = 1"; // 1 means True in BIT data type
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                ls.add(new Publisher(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getBoolean(3)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PublisherDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        Publisher[] arr = new Publisher[ls.size()];
        ls.toArray(arr);
        return arr;
    }

    public int addNew(String publisher) {
        int result = 0;
        String sql
                = "INSERT INTO [Publisher] "
                + "(publisher, isAvailable) "
                + "VALUES"
                + "(?, 1)";
        try {
            ps = conn.prepareStatement(sql);
            ps.setNString(1, publisher);
            result = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PublisherDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
}
