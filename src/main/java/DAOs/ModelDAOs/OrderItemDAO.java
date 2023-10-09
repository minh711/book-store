/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs.ModelDAOs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import Models.MngModels.OrderItem;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author HienHT
 */
public class OrderItemDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public OrderItemDAO() {
        conn = DBConnection.DbConnection.getConnection();
    }

    /**
     * get a certain order item
     *
     * @param bookID is a id of a book
     * @return an OrderItem object including bookID, title, price, salePrice
     */
    public OrderItem getOrderItem(int bookID) {
        OrderItem item = null;
        String sql = "SELECT book.id, book.title, book.price, book.salePrice,"
                + "cart.quantity, book.thumbnail FROM Cart cart"
                + " LEFT JOIN Book book on cart.bookId = book.id  WHERE book.id = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, bookID);
            rs = ps.executeQuery();
            if (rs.next()) {
                item = new OrderItem(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getInt("price"),
                        rs.getInt("saleprice"),
                        rs.getInt("quantity"),
                        rs.getString("thumbnail"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderItemDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return item;
    }

}
