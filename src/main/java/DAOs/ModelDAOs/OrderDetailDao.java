/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs.ModelDAOs;

import Models.DBModels.OrderDetail;
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
public class OrderDetailDao {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public OrderDetailDao() {
        conn = DBConnection.DbConnection.getConnection();
    }

    /**
     * add order data to OrderDetail table
     *
     * @param tem is an OrderDetail object
     */
    public void AddOrderDetails(OrderDetail tem) {
        String sql = "INSERT INTO [dbo].[OrderDetail] ([orderId],[bookId],[quantity],[salePrice],[price]) VALUES(?,?,?,?,?)";

        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, tem.getOrderId());
            ps.setInt(2, tem.getBookId());
            ps.setInt(3, tem.getQuantity());
            ps.setInt(4, tem.getSalePrice());
            ps.setInt(5, tem.getPrice());
            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
