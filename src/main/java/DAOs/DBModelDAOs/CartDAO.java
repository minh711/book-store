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
        String sqlquery = "DELETE FROM [Cart]\n"
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

        String sqlquery 
                = "INSERT INTO [dbo].[Cart] "
                + "    ([quantity], [bookId], [customerId]) "
                + "VALUES (?,?,?)";
        try {
            ps = conn.prepareStatement(sqlquery);
            ps.setInt(1, cart.getQuantity());
            ps.setInt(2, cart.getBookId());
            ps.setInt(3, cart.getCustomerId());
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public ArrayList<Cart> GetCartByID(int userid, int bookid) {
        ArrayList<Cart> list = new ArrayList<>();
        String sqlquery = "SELECT [customerId],"
                + "[quantity]\n"
                + ",[bookId]\n"
                + "  FROM [Cart]\n"
                + "  WHERE bookId = ? and customerId = ?";
        try {
            ps = conn.prepareStatement(sqlquery);
            ps.setInt(1, bookid);
            ps.setInt(2, userid);
            rs = ps.executeQuery();
            while (rs.next()) {
                Cart cart = new Cart(rs.getInt(1), rs.getInt(2), rs.getInt(3));
                list.add(cart);

            }
        } catch (SQLException e) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public ArrayList<UserCartDetail> GetUserCartDetailByID(int userid) {
        ArrayList<UserCartDetail> list = new ArrayList<>();
        String sqlquery = "SELECT\n"
                + "                    Book.title,\n"
                + "                    Book.thumbnail,\n"
                + "                    Book.salePrice,\n"
                + "                    Cart.quantity,\n"
                + "                    Account.id,\n"
                + "                    Book.id,"
                + "                    Book.quantity\n"
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
                UserCartDetail us = new UserCartDetail(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getInt(5), rs.getInt(6), rs.getInt(7));
                list.add(us);
            }
        } catch (SQLException e) {
            System.out.println(e);
            Logger.getLogger(BookAuthorDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public int UpdateCart(int quantity, int customerid, int bookid) {
        String sqlquery = "UPDATE [Cart]\n"
                + "   SET [quantity] = ?\n"
                + "      ,[bookId] = ?\n"
                + "      ,[customerId] = ?\n"
                + " WHERE bookId = ? and customerId = ?";
        int p = 0;
        try {
            ps = conn.prepareStatement(sqlquery);
            ps.setInt(1, quantity);
            ps.setInt(2, bookid);
            ps.setInt(3, customerid);
            ps.setInt(4, bookid);
            ps.setInt(5, customerid);
            p = ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return p;
    }
    
    public static void main(String[] args) {
        CartDAO c = new CartDAO();
        int a= c.UpdateCart(5, 1, 1);
        System.out.println(a);
    }
}
