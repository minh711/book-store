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
     * Get all Distributors.
     * 
     * @return Distributor array.
     * @author MinhTD
     */
    public Distributor[] getAll() {
        List<Distributor> ls = new ArrayList<>();
        String sql
                = "SELECT * "
                + "FROM Distributor "
                + "WHERE isAvailable = 1";
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
}
