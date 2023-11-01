/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs.DBModelDAOs;

import DBConnection.DbConnection;
import Models.DBModels.BookAuthor;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import Models.MgrModels.BookAuthorDetail;
import java.util.List;

/**
 *
 * @author mummykiara
 */
public class BookAuthorDAO extends DbConnection{
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public BookAuthorDAO() {
        conn = DBConnection.DbConnection.getConnection();
    }
    
    public ArrayList<BookAuthorDetail> getBookAuthorByID(int bookid) {
        ArrayList<BookAuthorDetail> list = new ArrayList<>();
        
        String query = "SELECT\n"
                + "	BookAuthor.bookId,\n"
                + "	Author.author\n"
                + "FROM\n"
                + "    BookAuthor\n"
                + "JOIN\n"
                + "    Author ON BookAuthor.authorId = Author.id\n"
                + "WHERE\n"
                + "    BookAuthor.bookId = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, bookid);
            System.out.println(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                BookAuthorDetail b = new BookAuthorDetail(rs.getInt(1),rs.getString(2));
                list.add(b);
            }
        } catch (SQLException e) {
            System.out.println(e);
            Logger.getLogger(BookAuthorDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        
        return list;
    }
    
    /**
     * Get integer array of Book's Author ID.
     * @param bookId Book's ID.
     * @return BookAuthor's ID integer array.
     * @author MinhTD
     */
    public int[] getBookAuthorByBookId(int bookId) {
        List<Integer> ls = new ArrayList<>();
        String sql
                = "SELECT BookAuthor.authorId "
                + "FROM BookAuthor "
                + "JOIN Author ON BookAuthor.authorId = Author.id "
                + "WHERE BookAuthor.bookId = ? AND isAvailable = 1";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, bookId);
            rs = ps.executeQuery();
            while (rs.next()) {
                ls.add(rs.getInt("authorId"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(BookAuthorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        int[] arr = new int[ls.size()];
        for (int i = 0; i < ls.size(); i++) {
            arr[i] = ls.get(i);
        }
        return arr;
    }
    
    /**
     * Add new book genre while creating or updating book.
     * @param ba Book author.
     * @return Number of rows effected.
     */
    public int addNew(BookAuthor ba) {
        int result = 0;
        String sql
                = "INSERT INTO BookAuthor "
                + "(bookId, authorId) "
                + "VALUES "
                + "(?, ?)";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, ba.getBookId());
            ps.setInt(2, ba.getAuthorId());
            result = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BookAuthorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
    
    /**
     * Delete Book Author.
     * @param ba Book author.
     * @return Number of rows effected.
     * @author MinhTD
     */
    public int delete(BookAuthor ba) {
        int result = 0;
        String sql
                = "DELETE FROM BookAuthor "
                + "WHERE bookId = ? and authorId = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, ba.getBookId());
            ps.setInt(2, ba.getAuthorId());
            result = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BookAuthorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
}
