package DAOs.DBModelDAOs;

import DBConnection.DbConnection;
import Models.DBModels.Rating;
import Models.MgrModels.BookRatingDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author NhuLNT
 */
public class BookRatingDAO extends DbConnection {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public BookRatingDAO() {
        conn = DBConnection.DbConnection.getConnection();
    }

    public ArrayList<Rating> getBookRating(int bookid) {
        ArrayList<Rating> list = new ArrayList<>();
        String sqlquery = "SELECT * \n"
                + "FROM [Rating]\n"
                + "WHERE [bookId] = ?";

        try {
            ps = conn.prepareStatement(sqlquery);
            ps.setInt(1, bookid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Rating(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getTimestamp(6)));
            }
        } catch (SQLException e) {
            Logger.getLogger(BookRatingDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public ArrayList<BookRatingDetail> getBookRatingWithUserName(int bookid) {
        ArrayList<BookRatingDetail> list = new ArrayList<>();
        String sqlquery = "SELECT Rating.id\n"
                + "	  , Account.fullName\n"
                + "      ,Rating.star\n"
                + "      ,Rating.comment\n"
                + "      ,Rating.bookId\n"
                + "      ,Rating.customerId\n"
                + "      ,Rating.dateRating\n"
                + "  FROM Rating\n"
                + "  LEFT JOIN Account on Account.id = Rating.customerId\n"
                + "  Where Rating.bookId = ?";

        try {
            ps = conn.prepareStatement(sqlquery);
            ps.setInt(1, bookid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new BookRatingDetail(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getInt(5), rs.getInt(6), rs.getTimestamp(7)));
            }
        } catch (SQLException e) {
            Logger.getLogger(BookRatingDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public static void main(String[] args) {
        BookRatingDAO c = new BookRatingDAO();
        ArrayList<Rating> list = c.getBookRating(1);
        for (Rating e : list) {
            System.out.println(e.toString());
        }
    }

}
