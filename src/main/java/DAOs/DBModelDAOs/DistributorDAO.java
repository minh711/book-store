package DAOs.DBModelDAOs;

import Models.DBModels.Distributor;
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
public class DistributorDAO {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;
    
    public DistributorDAO() {
        conn = DBConnection.DbConnection.getConnection();
    }
    
    /**
     * Get all available Distributors.
     * 
     * @return Distributor array.
     * @author MinhTD
     */
    public Distributor[] getAll() {
        List<Distributor> ls = new ArrayList<>();
        String sql
                = "SELECT * "
                + "FROM Distributor "
                + "WHERE isAvailable = 1"; // 1 means True in BIT data type
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                ls.add(new Distributor(
                        rs.getInt("id"), 
                        rs.getString("distributor"), 
                        rs.getBoolean("isAvailable")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Distributor.class.getName()).log(Level.SEVERE, null, ex);
        }
        Distributor[] arr = new Distributor[ls.size()];
        ls.toArray(arr);
        return arr;
    }
    
    /**
     * Add new Distributor.
     * 
     * Since Distributor only have one attribute that matter, the isAvailable 
     * attribute is always True when first added, so that one parameter is 
     * enough.
     * @param distributor Name of the distributor.
     * @return Number of rows effected. 0 mean failed.
     * @author MinhTD
     */
    public int addNew(String distributor) {
        int result = 0;
        String sql 
                = "INSERT INTO Distributor "
                + "(distributor, isAvailable) "
                + "VALUES "
                + "(?, 1)"; // 1 is True value for BIT in isAvailable column
        try {
            ps = conn.prepareStatement(sql);
            ps.setNString(1, distributor);
            result = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DistributorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
    
    /**
     * Update a Distributor.
     * 
     * Since it only possible to update available Distributors, so there is no
     * need to include isAvailable attribute in here.
     * @param distributor Distributor object, to get the id and distributor's name.
     * @return Number of rows effected. 0 mean failed.
     * @author MinhTD
     */
    public int update(Distributor distributor) {
        int result = 0;
        String sql 
                = "UPDATE Distributor "
                + "SET distributor = ? "
                + "WHERE id = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setNString(1, distributor.getDistributor());
            ps.setInt(2, distributor.getId());
            result = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DistributorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
    
    public int delete(int id) {
        int result = 0;
        String sql
                = "UPDATE Distributor "
                + "SET isAvailable = 0" // 0 mean False in BIT data type
                + "WHERE id = ?"; 
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            result = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DistributorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
}