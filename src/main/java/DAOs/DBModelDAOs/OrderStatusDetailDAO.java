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
import java.util.ArrayList;
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
     * @author HienHT
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
/**
 * this method is used to get the current status of an order
 * @param ID
 * @return 
 * author HienHt
 */
    public OrderStatusDetail getCurrentStatus(int ID) {

        String sql = "SELECT TOP(1) * FROM OrderStatusDetail WHERE orderId = ? ORDER BY date DESC";
        OrderStatusDetail item = null;
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, ID);
            rs = ps.executeQuery();
            if (rs.next()) {
                item = new OrderStatusDetail(
                        rs.getInt(1),
                        rs.getTimestamp(2),
                        rs.getInt(3),
                        rs.getInt(4));

            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderStatusDetail.class.getName()).log(Level.SEVERE, null, ex);
        }
        return item;
    }
/**
 * @author HienHT
 * this method is to get the previous status of an order
 * @param ID
 * @return 
 */
    public OrderStatusDetail getPreviousStatus(int ID) {
        OrderStatusDetail item = null;
        String sql = "SELECT * FROM OrderStatusDetail WHERE orderId = ? ORDER BY date DESC";
        ArrayList<OrderStatusDetail> items = new ArrayList<>();

        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, ID);
            rs = ps.executeQuery();
            while (rs.next()) {
                items.add(new OrderStatusDetail(
                        rs.getInt(1),
                        rs.getTimestamp(2),
                        rs.getInt(3),
                        rs.getInt(4)));

            }
            if (!items.isEmpty()) {
                if (items.size() >= 2) {
                    System.out.println("day ne");
                    return items.get(1);
                }
                if (items.size() == 1) {
                    System.out.println("ua");
                    return items.get(0);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderStatusDetail.class.getName()).log(Level.SEVERE, null, ex);
        }
        return item;
        
       
    }
  
   
}
