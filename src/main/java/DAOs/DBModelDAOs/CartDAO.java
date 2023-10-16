/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs.DBModelDAOs;

import Models.DBModels.Cart;
import Models.MgrModels.UserCartDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author HienHT and NhuLNT
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

    public void RemoveUserCartProduct(int customerid, int bookid) {
        String sqlquery = "DELETE FROM [dbo].[Cart]\n"
                + "      WHERE customerId =  ? and bookId = ?";
        try {
            ps = conn.prepareStatement(sqlquery);
            ps.setInt(1, customerid);
            ps.setInt(2, bookid);
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public void AddNewItemToCart(Cart cart) {

        String sqlquery = "INSERT INTO [dbo].[Cart]\n"
                + "           ([quantity]\n"
                + "           ,[bookId]\n"
                + "           ,[customerId])\n"
                + "     VALUES\n"
                + "           (?,?,?)";
        try {
            ps = conn.prepareStatement(sqlquery);
            ps.setInt(1, cart.getQuantity());
            ps.setInt(2, cart.getBookId());
            ps.setInt(3, cart.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public ArrayList<UserCartDetail> GetCartByID(int userid) {
        ArrayList<UserCartDetail> list = new ArrayList<>();
        String sqlquery = "SELECT\n"
                + "                    Book.title,\n"
                + "                    Book.thumbnail,\n"
                + "                    Book.salePrice,\n"
                + "                    Cart.quantity,\n"
                + "                    Account.id,\n"
                + "                    Book.id\n"
                + "                FROM\n"
                + "                    Cart\n"
                + "				JOIN\n"
                + "                    Book ON Book.id = Cart.bookId\n"
                + "                JOIN\n"
                + "                    Account ON Cart.customerId = Account.id\n"
                + "                WHERE \n"
                + "                    Account.id = ?;";

        try {
            ps = conn.prepareStatement(sqlquery);
            ps.setInt(1, userid);
            rs = ps.executeQuery();
            while (rs.next()) {
                UserCartDetail us = new UserCartDetail(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getInt(5), rs.getInt(6));
                list.add(us);
            }
        } catch (SQLException e) {
            System.out.println(e);
            Logger.getLogger(BookAuthorDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

}
