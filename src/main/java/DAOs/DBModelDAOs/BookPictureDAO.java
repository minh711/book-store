package DAOs.DBModelDAOs;

import Models.DBModels.BookPicture;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Book picture data access object.
 * @author MinhTD
 */
public class BookPictureDAO {
    
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;
    
    public BookPictureDAO() {
        conn = DBConnection.DbConnection.getConnection();
    }
    
    public BookPicture[] getAllByBookId(int bookId) {
        List<BookPicture> ls = new ArrayList<>();
        String sql
                = "SELECT * "
                + "FROM BookPicture "
                + "WHERE bookId = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, bookId);
            rs = ps.executeQuery();
            while (rs.next()) {
                ls.add(new BookPicture(
                        rs.getInt("id"), 
                        rs.getString("picture"), 
                        rs.getInt("bookId")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(BookPicture.class.getName()).log(Level.SEVERE, null, ex);
        }
        BookPicture[] arr = new BookPicture[ls.size()];
        ls.toArray(arr);
        return arr;
    }
    
    public int addNew(BookPicture bookPicture) {
        int result = 0;
        String sql
                = "INSERT INTO BookPicture "
                + "(picture, bookId) "
                + "VALUES "
                + "(?, ?)";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, bookPicture.getPicture());
            ps.setInt(2, bookPicture.getBookId());
            result = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BookPictureDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
}
