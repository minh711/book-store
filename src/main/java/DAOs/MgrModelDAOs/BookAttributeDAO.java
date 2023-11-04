package DAOs.MgrModelDAOs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DuyenLTM
 */
public class BookAttributeDAO {

    private Connection conn;

    public BookAttributeDAO() {
        conn = DBConnection.DbConnection.getConnection();
    }

    //UPDATE-----------------------------------------------------------
    public int updateAuthor(int id, String name) {
        int kq = 0;
        String sql = "update Author\n"
                + "set author=?\n"
                + "where id=?;";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setInt(2, id);
            kq = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BookAttributeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }

    public int updateGenre(int genreId, String genre) {
        int kq = 0;
        String sql = "update Genre\n"
                + "set genre=?\n"
                + "where id=?;";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, genre);
            ps.setInt(2, genreId);
            kq = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BookAttributeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }

    public int updateLanguage(int languageId, String language) {
        int kq = 0;
        String sql = "update Language\n"
                + "set language=?\n"
                + "where id=?;";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, language);
            ps.setInt(2, languageId);
            kq = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BookAttributeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }

    public int updatePublisher(int publisherId, String publisher) {
        int kq = 0;
        String sql = "update Publisher\n"
                + "set publisher=?\n"
                + "where id=?;";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, publisher);
            ps.setInt(2, publisherId);
            kq = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BookAttributeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }

    //DELETE-------------------------------------------------------------------------
    public int deleteAuthor(int authorId) {
        int kq = 0;
        String sql = "update Author\n"
                + "set isAvailable=0\n"
                + "where id=?;";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, authorId);
            kq = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BookAttributeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }

    public int deleteGenre(int genreId) {
        int kq = 0;
        String sql = "update Genre\n"
                + "set isAvailable=0\n"
                + "where id=?;";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, genreId);
            kq = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BookAttributeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }

    public int deleteLanguage(int laguageId) {
        int kq = 0;
        String sql = "update Language\n"
                + "set isAvailable=0\n"
                + "where id=?;";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, laguageId);
            kq = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BookAttributeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }

    public int deletePublisher(int publisherId) {
        int kq = 0;
        String sql = "update Publisher\n"
                + "set isAvailable=0\n"
                + "where id=?;";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, publisherId);
            kq = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BookAttributeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }
}
