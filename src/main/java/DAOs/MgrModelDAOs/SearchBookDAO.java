/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs.MgrModelDAOs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author VTOS
 */
public class SearchBookDAO {

    private Connection conn = null;

    public SearchBookDAO() {
        conn = DBConnection.DbConnection.getConnection();
    }
    
    

    public ArrayList<Integer> searchByBookId(String key) {
        ArrayList<Integer> bookIDs = new ArrayList<>();
        String sql = "select id from Book where title like Lower(?);";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + key + "%".toLowerCase());
            ResultSet rs = ps.executeQuery();
             while (rs.next()) {
                bookIDs.add(rs.getInt("id"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(SearchBookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return bookIDs;
    }

    public ArrayList<Integer> searchByAuthorId(String key) {
        ArrayList<Integer> authorIDs = new ArrayList<>();
        String sql = "SELECT Book.id FROM Book "
                + "JOIN BookAuthor ON BookAuthor.bookId = Book.id "
                + "JOIN Author ON BookAuthor.authorId = Author.id "
                + "WHERE LOWER(Author.author) LIKE LOWER(?)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + key + "%".toLowerCase());
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                authorIDs.add(rs.getInt("id"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(SearchBookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return authorIDs;
    }

    public ArrayList<Integer> searchByPublisherId(String key) {
        ArrayList<Integer> publisherIDs = new ArrayList<>();
        String sql = "select Book.id\n"
                + "from Book \n"
                + "join Publisher on Book.publisherId=Publisher.id\n"
                + "where Lower(Publisher.publisher) like Lower(?)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + key + "%".toLowerCase());
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                publisherIDs.add(rs.getInt("id"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(SearchBookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return publisherIDs;
    }

    public ArrayList<Integer> searchByLanguageId(String key) {
        ArrayList<Integer> languageIDs = new ArrayList<>();
        String sql = "select Book.id\n"
                + "from Book \n"
                + "join [Language] on Book.languageId=[Language].id\n"
                + "where Lower([Language].language) like Lower(?)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + key + "%".toLowerCase());
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                languageIDs.add(rs.getInt("id"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(SearchBookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return languageIDs;
    }

    public ArrayList<Integer> searchByGenreId(String key) {
        ArrayList<Integer> genreIDs = new ArrayList<>();
        String sql = "SELECT Book.id FROM Book \n"
                + "                JOIN BookGenre ON BookGenre.bookId = Book.id \n"
                + "                JOIN Genre ON BookGenre.genreId = Genre.id \n"
                + "                WHERE LOWER(Genre.genre) LIKE LOWER(?);";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + key + "%".toLowerCase());
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                genreIDs.add(rs.getInt("id"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(SearchBookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return genreIDs;
    }

}
