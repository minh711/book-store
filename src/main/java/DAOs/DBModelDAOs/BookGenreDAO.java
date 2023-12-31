/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs.DBModelDAOs;

import DBConnection.DbConnection;
import Models.DBModels.BookGenre;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import Models.MgrModels.BookGenreDetail;
import java.util.List;

/**
 *
 * @author mummykiara
 */
public class BookGenreDAO extends DbConnection{
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public BookGenreDAO() {
        conn = DBConnection.DbConnection.getConnection();
    }
    
    public ArrayList<BookGenreDetail> getBookGenreByID(int bookid) {
        ArrayList<BookGenreDetail> list = new ArrayList<>();
        
        String query = "SELECT\n"
                + "	BookGenre.bookId,\n"
                + "	Genre.genre\n"
                + "FROM\n"
                + "    BookGenre \n"
                + "JOIN\n"
                + "    Genre ON BookGenre.genreId = Genre.id\n"
                + "WHERE\n"
                + "    BookGenre.bookId = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, bookid);
            System.out.println(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                BookGenreDetail b = new BookGenreDetail(rs.getInt(1),rs.getString(2));
                list.add(b);
            }
        } catch (SQLException e) {
            System.out.println(e);
            Logger.getLogger(BookGenreDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        
        return list;
        
    }
    
    /**
     * Get integer array of Book's Genre ID.
     * @param bookId Book's ID.
     * @return Book Genre's ID integer array.
     * @author MinhTD
     */
    public int[] getBookGenreByBookId(int bookId) {
        List<Integer> ls = new ArrayList<>();
        String sql
                = "SELECT BookGenre.genreId "
                + "FROM BookGenre "
                + "JOIN Genre ON BookGenre.genreId = Genre.id "
                + "WHERE BookGenre.bookId = ? AND isAvailable = 1";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, bookId);
            rs = ps.executeQuery();
            while (rs.next()) {
                ls.add(rs.getInt("genreId"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(BookGenreDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        int[] arr = new int[ls.size()];
        for (int i = 0; i < ls.size(); i++) {
            arr[i] = ls.get(i);
        }
        return arr;
    }
    
    /**
     * Add new book genre while creating or updating book.
     * @param bg Book genre.
     * @return Number of rows effected.
     */
    public int addNew(BookGenre bg) {
        int result = 0;
        String sql
                = "INSERT INTO BookGenre "
                + "(bookId, genreId) "
                + "VALUES "
                + "(?, ?)";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, bg.getBookId());
            ps.setInt(2, bg.getGenreId());
            result = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BookGenreDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
    
    /**
     * Delete Book Genre.
     * @param bg Book genre.
     * @return Number of rows effected.
     */
    public int delete(BookGenre bg) {
        int result = 0;
        String sql
                = "DELETE FROM BookGenre "
                + "WHERE bookId = ? AND genreId = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, bg.getBookId());
            ps.setInt(2, bg.getGenreId());
            result = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BookGenreDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
}
