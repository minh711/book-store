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
 * @author DuyenLTM
 */
public class SearchBookDAO {

    private Connection conn = null;

    public SearchBookDAO() {
        conn = DBConnection.DbConnection.getConnection();
    }

    //SELECT BOOK
    public ArrayList<Integer> seletctByGenreId(int genreId) {
        ArrayList<Integer> books = new ArrayList<>();
        String sql = "SELECT distinct Book.id FROM Book \n"
                + "                JOIN BookGenre ON BookGenre.bookId = Book.id \n"
                + "                JOIN Genre ON BookGenre.genreId = Genre.id \n"
                + "                WHERE Genre.id=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, genreId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                books.add(rs.getInt("id"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(SearchBookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return books;
    }

    public ArrayList<Integer> selectByLanguageId(int languageId) {
        ArrayList<Integer> books = new ArrayList<>();
        String sql = "select distinct Book.id\n"
                + "from Book \n"
                + "join [Language] on Book.languageId=[Language].id\n"
                + "where [Language].id=?;";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, languageId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                books.add(rs.getInt("id"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(SearchBookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return books;
    }

    public ArrayList<Integer> selectByPublisherId(int publishId) {
        ArrayList<Integer> books = new ArrayList<>();
        String sql = "select DISTINCT Book.id\n"
                + "from Book \n"
                + "join Publisher on Book.publisherId=Publisher.id\n"
                + "where Publisher.id=?;";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, publishId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                books.add(rs.getInt("id"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(SearchBookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return books;
    }

    public ArrayList<Integer> selectByAuthorId(int authorId) {
        ArrayList<Integer> books = new ArrayList<>();
        String sql = "SELECT DISTINCT Book.id FROM Book "
                + "JOIN BookAuthor ON BookAuthor.bookId = Book.id "
                + "JOIN Author ON BookAuthor.authorId = Author.id "
                + "WHERE Author.id=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, authorId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                books.add(rs.getInt("id"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(SearchBookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return books;
    }

    //-------------------------------------------------------------------------------------
    //SEARCH DAOs
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
