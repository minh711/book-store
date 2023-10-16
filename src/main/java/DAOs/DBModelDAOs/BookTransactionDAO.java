package DAOs.DBModelDAOs;

import Models.DBModels.BookTransaction;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Book Transaction data access object.
 * 
 * Including getAll and addNew methods. The data is generated by the system so
 * that don't need update and delete.
 * @author MinhTD
 */
public class BookTransactionDAO {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;
    
    public BookTransactionDAO() {
        conn = DBConnection.DbConnection.getConnection();
    }
    
    /**
     * Get all Book Transaction.
     * 
     * @return BookTransaction object array.
     * @author MinhTD
     */
    public BookTransaction[] getAll() {
        List<BookTransaction> ls = new ArrayList<>();
        String sql
                = "SELECT * "
                + "FROM BookTransaction";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                ls.add(new BookTransaction(
                        rs.getInt(1), 
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getTimestamp(6),
                        rs.getInt(7)
                ));
            }
        } catch (SQLException ex) {
            Logger.getLogger(BookTransactionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        BookTransaction[] arr = new BookTransaction[ls.size()];
        ls.toArray(arr);
        return arr;
    }
    
    /**
     * Add new Book Transaction.
     * 
     * @param bookTransaction Book Transaction object.
     * @return 
     */
    public int addNew(BookTransaction bookTransaction) {
        int result = 0;
        String sql 
                = "INSERT INTO BookTransaction "
                + "(bookId, distributorId, executorId, quantity, date, total) "
                + "VALUES "
                + "(?, ?, ?, ?, ?, ?)";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, bookTransaction.getBookId());
            ps.setInt(2, bookTransaction.getDistributorId());
            ps.setInt(3, bookTransaction.getExecutorId());
            ps.setInt(4, bookTransaction.getQuantity());
            ps.setTimestamp(5, bookTransaction.getDate());
            ps.setInt(6, bookTransaction.getTotal());
            result = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BookTransactionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
    
    public int delete(int id) {
        int result = 0;
        String sql 
                = "DELETE FROM BookTransaction "
                + "WHERE id = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            result = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BookTransactionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
}
