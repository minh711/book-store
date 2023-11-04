package DAOs.DBModelDAOs;

import DBConnection.DbConnection;
import Models.DBModels.Book;
import Models.DBModels.Rating;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
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

    public void addRating(Rating bookrating) {
        String query = "INSERT INTO [Rating]\n"
                + "           ([star]\n"
                + "           ,[comment]\n"
                + "           ,[bookId]\n"
                + "           ,[customerId]\n"
                + "           ,[dateRating])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?)";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, bookrating.getStar());
            ps.setString(2, bookrating.getComment());
            ps.setInt(3, bookrating.getBookId());
            ps.setInt(4, bookrating.getCustomerId());
            ps.setTimestamp(5, bookrating.getDateRating());
            ps.executeQuery();
        } catch (SQLException e) {
            Logger.getLogger(BookRatingDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public int UpdateBookDetailRating(Book book) {
        String sql = "UPDATE [Book]\n"
                + "   SET [title] = ?\n"
                + "      ,[description] = ?\n"
                + "      ,[thumbnail] = ?\n"
                + "      ,[salePrice] = ?\n"
                + "      ,[price] = ?\n"
                + "      ,[discount] = ?\n"
                + "      ,[quantity] = ?\n"
                + "      ,[soleTotal] = ?\n"
                + "      ,[isAvailable] = ?\n"
                + "      ,[publisherId] = ?\n"
                + "      ,[languageId] = ?\n"
                + "      ,[totalRating] = ?\n"
                + "      ,[totalRatingStar] = ?\n"
                + "      ,[avgRating] = ?\n"
                + " WHERE id = ?\n";
        int result = 0;
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, book.getTitle());
            ps.setString(2, book.getDescription());
            ps.setString(3, book.getThumbnail());
            ps.setInt(4, book.getSalePrice());
            ps.setInt(5, book.getPrice());
            ps.setInt(6, book.getDiscount());
            ps.setInt(7, book.getQuantity());
            ps.setInt(8, book.getSoleTotal());
            ps.setBoolean(9, book.isIsAvailable());
            ps.setInt(10, book.getPubisherId());
            ps.setInt(11, book.getLanguageId());
            ps.setInt(12, book.getTotalRating());
            ps.setInt(13, book.getTotalRatingStar());
            ps.setFloat(14, book.getAvgRating());
            ps.setInt(15, book.getId());
            result = ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(BookRatingDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return result;
    }
}
