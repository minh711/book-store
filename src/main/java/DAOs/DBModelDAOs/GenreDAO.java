package DAOs.DBModelDAOs;

import Models.DBModels.Genre;
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
public class GenreDAO {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public GenreDAO() {
        conn = DBConnection.DbConnection.getConnection();
    }

    /**
     * Get all available Publishers.
     *
     * @return Publisher array.
     * @author MinhTD
     */
    public Genre[] getAll() {
        List<Genre> ls = new ArrayList<>();
        String sql
                = "SELECT * "
                + "FROM [Genre] "
                + "WHERE [isAvailable] = 1"; // 1 means True in BIT data type
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                ls.add(new Genre(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getBoolean(3)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(GenreDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        Genre[] arr = new Genre[ls.size()];
        ls.toArray(arr);
        return arr;
    }
    
    public int addNew(String genre) {
        int result = 0;
        String sql
                = "INSERT INTO [Genre] "
                + "(genre, isAvailable) "
                + "VALUES"
                + "(?, 1)";
        try {
            ps = conn.prepareStatement(sql);
            ps.setNString(1, genre);
            result = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(GenreDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
}
