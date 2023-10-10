/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs.DBModelDAOs;

import DAOs.MgrModelDAOs.OrderItemDAO;
import Models.DBModels.Order;
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
public class OrderDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public OrderDAO() {
        conn = DBConnection.DbConnection.getConnection();
    }

    /**
     * add data of a new order
     *
     * @param od is a Order Object
     */
    public void AddNew(Order od) {
        String sql
                = "INSERT INTO [Order] (saleTotal, total, fullName, phone,"
                + " [address], isBanking, bankingImage, note, date, customerId)\n"
                + "VALUES (?,?,?,?,?,?,?,?,?,?)";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, od.getSaleTotal());
            ps.setInt(2, od.getTotal());
            ps.setString(3, od.getFullName());
            ps.setString(4, od.getPhone());
            ps.setString(5, od.getAddress());
            if (od.isIsBanking() == true) {
                ps.setInt(6, 1);
                ps.setString(7, od.getBankingImage());
            } else {
                ps.setInt(6, 0);
                ps.setString(7, od.getBankingImage());
            }
            ps.setString(8, od.getNote());
            ps.setTimestamp(9, od.getDate());
            ps.setInt(10, od.getCustomerId());
            System.out.println(sql);
            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * to retrieve the orderID of the user's latest order because the orderID is
     * automatically created we cannot get an correct ID when that order is
     * created
     *
     * @param customerID is a customer ID
     * @return orderID
     */
    public int getLatestOrderID(int customerID) {
        String sql = "SELECT TOP(1) id FROM [Order] WHERE customerId = ? ORDER BY [data] Desc";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, customerID);
            rs = ps.executeQuery();
            if (rs.next()) {

                return rs.getInt("Id");
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderItemDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;

    }

}
