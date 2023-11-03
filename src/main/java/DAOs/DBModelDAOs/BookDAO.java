package DAOs.DBModelDAOs;

import DBConnection.DbConnection;
import Models.DBModels.Book;
import Models.MgrModels.BookDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author mummykiara
 */
public class BookDAO extends DbConnection {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public BookDAO() {
        conn = DBConnection.DbConnection.getConnection();
    }

    /**
     * Get all available Books.
     * 
     * @return Book object array.
     * @author MinhTD
     */
    public Book[] getAll() {
        List<Book> ls = new ArrayList<>();
        String sql 
                = "SELECT * FROM Book "
                + "WHERE isAvailable = 1";
        try {
            ps = conn.prepareStatement(sql);
            rs  = ps.executeQuery();
            while (rs.next()) {
                ls.add(new Book(
                        rs.getInt(1),
                        rs.getNString(2),
                        rs.getNString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getBoolean(10),
                        rs.getInt(11),
                        rs.getInt(12),
                        rs.getInt(13),
                        rs.getInt(14),
                        rs.getFloat(15)
                ));
            }
        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        Book[] arr = new Book[ls.size()];
        ls.toArray(arr);
        return arr;
    }
    
    /**
     * Get numbers of available Books.
     *
     * @return Book object array.
     * @author MinhTD
     */
    public Book[] getTop() {
        List<Book> ls = new ArrayList<>();
        String sql = "SELECT TOP 8 * FROM Book WHERE isAvailable = 1";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                ls.add(new Book(
                        rs.getInt(1),
                        rs.getNString(2),
                        rs.getNString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getBoolean(10),
                        rs.getInt(11),
                        rs.getInt(12),
                        rs.getInt(13),
                        rs.getInt(14),
                        rs.getFloat(15)
                ));
            }
        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        Book[] arr = new Book[ls.size()];
        ls.toArray(arr);
        return arr;
    }
    
    /**
     * Get top sellers Books.
     * 
     * @return Book object array.
     * @author MinhTD
     */
    public Book[] getTopSellers() {
        List<Book> ls = new ArrayList<>();
        String sql 
                = "SELECT TOP 8 * FROM Book "
                + "WHERE isAvailable = 1 "
                + "ORDER BY soleTotal DESC";
        try {
            ps = conn.prepareStatement(sql);
            rs  = ps.executeQuery();
            while (rs.next()) {
                ls.add(new Book(
                    rs.getInt(1),
                    rs.getNString(2),
                    rs.getNString(3),
                    rs.getString(4),
                    rs.getInt(5),
                    rs.getInt(6),
                    rs.getInt(7),
                    rs.getInt(8),
                    rs.getInt(9),
                    rs.getBoolean(10),
                    rs.getInt(11),
                    rs.getInt(12),
                    rs.getInt(13),
                    rs.getInt(14),
                    rs.getFloat(15)
                ));
            }
        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        Book[] arr = new Book[ls.size()];
        ls.toArray(arr);
        return arr;
    }
    
    /**
     * Get top high discount Books.
     * 
     * @return Book object array.
     * @author MinhTD
     */
    public Book[] getHotOffers() {
        List<Book> ls = new ArrayList<>();
        String sql 
                = "SELECT TOP 8 * FROM Book "
                + "WHERE isAvailable = 1 "
                + "ORDER BY discount DESC";
        try {
            ps = conn.prepareStatement(sql);
            rs  = ps.executeQuery();
            while (rs.next()) {
                ls.add(new Book(
                    rs.getInt(1),
                    rs.getNString(2),
                    rs.getNString(3),
                    rs.getString(4),
                    rs.getInt(5),
                    rs.getInt(6),
                    rs.getInt(7),
                    rs.getInt(8),
                    rs.getInt(9),
                    rs.getBoolean(10),
                    rs.getInt(11),
                    rs.getInt(12),
                    rs.getInt(13),
                    rs.getInt(14),
                    rs.getFloat(15)
                ));
            }
        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        Book[] arr = new Book[ls.size()];
        ls.toArray(arr);
        return arr;
    }
    
    /**
     * Get top high rating Books.
     *
     * @return Book object array.
     * @author MinhTD
     */
    public Book[] getTopRatings() {
        List<Book> ls = new ArrayList<>();
        String sql
                = "SELECT TOP 8 * FROM Book "
                + "WHERE isAvailable = 1 "
                + "ORDER BY avgRating DESC";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                ls.add(new Book(
                        rs.getInt(1),
                        rs.getNString(2),
                        rs.getNString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getBoolean(10),
                        rs.getInt(11),
                        rs.getInt(12),
                        rs.getInt(13),
                        rs.getInt(14),
                        rs.getFloat(15)
                ));
            }
        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        Book[] arr = new Book[ls.size()];
        ls.toArray(arr);
        return arr;
    }
    
    public BookDetail getBookDetailByID(int bookid) {
        String query 
                = "SELECT "
                + "    Book.id, "
                + "    Book.title, "
                + "    Publisher.publisher, "
                + "    [Language].language, "
                + "    Book.salePrice, "
                + "    Book.discount, "
                + "    Book.price, "
                + "    Book.soleTotal, "
                + "    Book.quantity, "
                + "    Book.description, "
                + "    Book.thumbnail, "
                + "    Book.avgRating, "
                + "    Book.totalRating "
                + "FROM Book"
                + "   JOIN Publisher ON Book.publisherId = Publisher.id "
                + "   JOIN [Language] ON Book.languageId = [Language].id "
                + "   LEFT JOIN BookAuthor ON Book.id = BookAuthor.bookId "
                + "   LEFT JOIN Author ON BookAuthor.authorId = Author.id "
                + "   LEFT JOIN BookGenre ON Book.id = BookGenre.bookId "
                + "   LEFT JOIN Genre ON BookGenre.genreId = Genre.id "
                + "WHERE Book.id = ? and Book.isAvailable = 1";
       BookDetail b =null;
        try {
            
            ps = conn.prepareStatement(query);
            ps.setInt(1, bookid);
            rs = ps.executeQuery();
            while (rs.next()) {
                b = new BookDetail(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),rs.getInt(5), rs.getInt(6), rs.getInt(7), rs.getInt(8),rs.getInt(9), rs.getString(10), rs.getString(11),rs.getFloat(12), rs.getInt(13));
                
            }
        } catch (SQLException e) {
            System.out.println(e);
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return b;
    }
    
    /**
     * Add a new book.
     * @param b New book.
     * @return True if success, False elsewhere.
     * @author MinhTD
     */
    public int addNewBook(Book b) {
        int result = 0;
        String addBookQuery 
                = "SET IDENTITY_INSERT [Book] ON;"
                + "INSERT INTO Book "
                + "(id, title, description, thumbnail, salePrice, price, discount, "
                + "quantity, soleTotal, isAvailable, publisherId, languageId, "
                + "totalRating, totalRatingStar, avgRating) "
                + "VALUES"
                + "(?, ?, ?, ?, ?, ?, ?, 0, 0, 1, ?, ?, 0, 0, 0)"
                + "SET IDENTITY_INSERT [Book] OFF;";
        try {
            ps = conn.prepareStatement(addBookQuery);
            ps.setInt(1, b.getId());
            ps.setNString(2, b.getTitle());
            ps.setNString(3, b.getDescription());
            ps.setString(4, b.getThumbnail());
            ps.setInt(5, b.getSalePrice());
            ps.setInt(6, b.getPrice());
            ps.setInt(7, b.getDiscount());
            ps.setInt(8, b.getPubisherId());
            ps.setInt(9, b.getLanguageId());
            result = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Book ID aready exist or Publisher or author ID does not exist.");
            return -1;
        }
        if (result == 0) {
            return 0;
        } else {
            System.out.println("Success.");
            return 1;
        }
    }
    
    /**
     * Add a new book.
     *
     * @param b New book.
     * @return True if success, False elsewhere.
     * @author MinhTD
     */
    public int update(Book b) {
        int result = 0;
        String sql
                = "SET IDENTITY_INSERT [Book] ON;"
                + "UPDATE Book "
                + "SET "
                + "title = ?, "
                + "description = ?, "
                + "thumbnail = ?, "
                + "salePrice = ?, "
                + "price = ?, "
                + "discount = ?, "
                + "publisherId = ?, "
                + "languageId = ? "
                + "WHERE id = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setNString(1, b.getTitle());
            ps.setNString(2, b.getDescription());
            ps.setString(3, b.getThumbnail());
            ps.setInt(4, b.getSalePrice());
            ps.setInt(5, b.getPrice());
            ps.setInt(6, b.getDiscount());
            ps.setInt(7, b.getPubisherId());
            ps.setInt(8, b.getLanguageId());
            ps.setInt(9, b.getId());
            result = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
    
    /**
     * Get a Book by its ID.
     * @param id Book's ID.
     * @return Book object.
     * @author MinhTD
     */
    public Book getBook(int id) {
        Book book = null;
        String sql = "SELECT * FROM Book WHERE id = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                book = new Book(
                        rs.getInt(1),
                        rs.getNString(2),
                        rs.getNString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getBoolean(10),
                        rs.getInt(11),
                        rs.getInt(12),
                        rs.getInt(13),
                        rs.getInt(14),
                        rs.getFloat(15)
                );
            }
        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return book;
    }
}
