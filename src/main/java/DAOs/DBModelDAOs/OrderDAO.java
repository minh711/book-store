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
import java.util.ArrayList;
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
     * add data of a new order HienHT
     *
     * @param order is a Order Object
     */
    public void AddNew(Order order) {
        String sql
                = "INSERT INTO [Order] (saleTotal, total, fullName, phone,"
                + " [address], isBanking, bankingImage, note, data, customerId)\n"
                + "VALUES (?,?,?,?,?,?,?,?,?,?)";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, order.getSaleTotal());
            ps.setInt(2, order.getTotal());
            ps.setString(3, order.getFullName());
            ps.setString(4, order.getPhone());
            ps.setString(5, order.getAddress());
            if (order.isIsBanking() == true) {
                ps.setInt(6, 1);
                ps.setString(7, order.getBankingImage());
            } else {
                ps.setInt(6, 0);
                ps.setString(7, order.getBankingImage());
            }
            ps.setString(8, order.getNote());
            ps.setTimestamp(9, order.getDate());
            ps.setInt(10, order.getCustomerId());           
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
     * @author HienHT
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

    /**
     * @author HienHT this method is used to retrieve an order by ID
     * @param ID
     * @return an Order object
     */

    public Order getOrderByID(int ID) {

        String sql = "SELECT * FROM [Order] WHERE id =?";
        Order item = null;
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, ID);
            rs = ps.executeQuery();
            if (rs.next()) {
                item = new Order(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getBoolean(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getTimestamp(10),
                        rs.getInt(11));

            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderItemDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return item;
    }

    /**
     * get order list of a curtain customer by ID
     * @param ID
     * @return ArrayList with Order object
     */
    public  ArrayList<Order> getCustomerOrderList(int ID) {

        String sql = "SELECT * FROM [Order] WHERE customerId =?";
        ArrayList<Order> orders = new ArrayList<>();
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, ID);
            rs = ps.executeQuery();
            while (rs.next()) {
                orders.add(new Order(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getBoolean(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getTimestamp(10),
                        rs.getInt(11)));

            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderItemDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orders;
    }
    
    /**
     * get a status name of an order
     * @param ID
     * @return String name of a status
     */
    public String getOrderStatusName(int ID) {
        String sql = "SELECT TOP(1) odrStatus.[status] FROM [Order] odr\n"
                + "LEFT JOIN [OrderStatusDetail] odrStatusDetail ON odr.id = odrStatusDetail.orderId\n"
                + "LEFT JOIN [OrderStatus] odrStatus ON odrStatus.id = odrStatusDetail.orderStatusId\n"
                + "WHERE odr.id =? \n"
                + "ORDER BY odrStatusDetail.[date] DESC";
        String item = null;
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, ID);
            rs = ps.executeQuery();
            if (rs.next()) {
               item = rs.getString(1);

            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderItemDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return item;
    }
    
     public  ArrayList<Order> getOrderList() {

        String sql = "SELECT * FROM [Order]";
        ArrayList<Order> orders = new ArrayList<>();
        try {
            ps = conn.prepareStatement(sql);          
            rs = ps.executeQuery();
            while (rs.next()) {
                orders.add(new Order(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getBoolean(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getTimestamp(10),
                        rs.getInt(11)));

            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderItemDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orders;
    }
     
     public static void main(String[] args) {
        OrderDAO dao = new OrderDAO();
     ArrayList<Order> orders = dao.getOrderList();
         for (Order order : orders) {
             System.out.println(order.getId());
         }
    }
   
}
