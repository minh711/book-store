package DAOs.DBModelDAOs;

import Models.DBModels.BookTransactionDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Book Transaction Detail data access object.
 * 
 * @author MinhTD
 */
public class BookTransactionDetailDAO {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;
    
    public BookTransactionDetailDAO() {
        conn = DBConnection.DbConnection.getConnection();
    }
    
    public BookTransactionDetail[] getAllByBookTransactionId(int bookTransactionId) {
        List<BookTransactionDetail> ls = new ArrayList<>();
        String sql 
                = "SELECT * "
                + "FROM BookTransactionDetail "
                + "WHERE bookTransactionId = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, bookTransactionId);
            rs = ps.executeQuery();
            while (rs.next()) {
                ls.add(new BookTransactionDetail(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5)
                ));
            }
        } catch (SQLException ex) {
            Logger.getLogger(BookTransactionDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        BookTransactionDetail[] arr = new BookTransactionDetail[ls.size()];
        ls.toArray(arr);
        return arr;
    }
    
    public int addNew(BookTransactionDetail bookTransactionDetail) {
        int result = 0;
        String sql
                = "INSERT INTO BookTransactionDetail "
                + "VALUES "
                + "(?, ?, ?, ?, ?)";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, bookTransactionDetail.getBookTransactionId());
            ps.setInt(2, bookTransactionDetail.getBookId());
            ps.setInt(3, bookTransactionDetail.getDistributorId());
            ps.setInt(4, bookTransactionDetail.getQuantity());
            ps.setInt(5, bookTransactionDetail.getTotal());
            result = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BookTransactionDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
}
