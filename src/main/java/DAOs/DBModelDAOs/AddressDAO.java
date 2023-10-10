/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs.DBModelDAOs;

import DAOs.MgrModelDAOs.OrderItemDAO;
import Models.DBModels.Address;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * address method to get data from DB
 *
 * @author HienHT
 */
public class AddressDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public AddressDAO() {
        conn = DBConnection.DbConnection.getConnection();
    }

    /**
     * this method is to retrieve all addresses of an certain user based on
     * their id
     *
     * @param customerID is user ID which helps filtering in DB
     * @return ArrayList of Address object
     */
    public ArrayList<Address> getAll(int customerID) {
        ArrayList<Address> list = new ArrayList<>();
        String sql = "SELECT * FROM Address WHERE customerId = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, customerID);
            rs = ps.executeQuery();
            while (rs.next()) {
                Address tem = new Address(rs.getInt("id"), rs.getString("fullname"),
                        rs.getString("phone"), rs.getString("address"), rs.getInt("customerId"));
                list.add(tem);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderItemDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    /**
     * this method is to get a certain address of an user
     *
     * @param customerID helps filtering in DB
     * @param addressID helps filtering in DB
     * @return an Address object
     */
    public Address getAddressByID(int customerID, int addressID) {

        String sql = "SELECT * FROM Address WHERE customerId = ? AND Id= ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, customerID);
            ps.setInt(2, addressID);
            rs = ps.executeQuery();
            if (rs.next()) {
                Address tem = new Address(rs.getInt("id"), rs.getString("fullname"),
                        rs.getString("phone"), rs.getString("address"), rs.getInt("customerId"));
                return tem;
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderItemDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
