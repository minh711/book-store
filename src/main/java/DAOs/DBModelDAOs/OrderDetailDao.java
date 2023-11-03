/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs.DBModelDAOs;

import Models.DBModels.OrderDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author HienHT & NhuLNT
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
     * @author HienHT
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

    public ArrayList<OrderDetail> GetOrderDetailByOrderId(int orderid) {
        ArrayList<OrderDetail> list = new ArrayList<>();
        
        String sqlquery = "SELECT [orderId]\n"
                + "      ,[bookId]\n"
                + "      ,[quantity]\n"
                + "      ,[salePrice]\n"
                + "      ,[price]\n"
                + "  FROM [OrderDetail]\n"
                + "  WHERE [orderId] = ?;";
        try {
            ps = conn.prepareStatement(sqlquery);
            ps.setInt(1,orderid);
            rs = ps.executeQuery();
            while(rs.next()){
                list.add(new OrderDetail(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getInt(4),rs.getInt(5)));
            }
        } catch (SQLException e) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

}
