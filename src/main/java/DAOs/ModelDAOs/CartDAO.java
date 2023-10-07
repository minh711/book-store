/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs.ModelDAOs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author HienHT
 */
public class CartDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public CartDAO() {
        conn = DBConnection.DbConnection.getConnection();
    }

    /**
     * this method is used when user place an order, as a logic, all ordered
     * items in cart have to be removed
     *
     * @param BookID is a ordered item ID
     */
    public void RemoveOrderItem(int BookID) {
        String sql = "DELETE FROM [dbo].[Cart] WHERE bookId =?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, BookID);
            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
