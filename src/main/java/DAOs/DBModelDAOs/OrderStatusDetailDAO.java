/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs.DBModelDAOs;

import Models.DBModels.OrderStatusDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * modifications in OrderStatusDetail table
 *
 * @author HienHT
 */
public class OrderStatusDetailDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public OrderStatusDetailDAO() {
        conn = DBConnection.DbConnection.getConnection();
    }

    /**
     * Add data to OrderStatusDetail table
     *
     * @param tem is OrderStatusDetail object
     */
    public void AddOrderStatusDetail(OrderStatusDetail tem) {
        String sql = "INSERT INTO [dbo].[OrderStatusDetail]([date],[orderId],[orderStatusId])VALUES (?,?,?)";
        try {
            ps = conn.prepareStatement(sql);
            ps.setTimestamp(1, tem.getDate());
            ps.setInt(2, tem.getOrderId());
            ps.setInt(3, tem.getOrderStatusId());
            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
