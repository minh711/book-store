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
    public Book[] getALl() {
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
                        rs.getFloat(16)
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
        String query = "SELECT\n"
                + "	Book.id,\n"
                + "    Book.title,\n"
                + "    Publisher.publisher,\n"
                + "    [Language].language,\n"
                + "	Book.salePrice,\n"
                + "	Book.discount,\n"
                + "	Book.price,\n"
                + "     Book.soleTotal,"
                + "	Book.quantity,\n"
                + "	Book.description,\n"
                + "	Book.thumbnail\n"
                + "FROM\n"
                + "    Book\n"
                + "JOIN\n"
                + "    Publisher ON Book.publisherId = Publisher.id\n"
                + "JOIN\n"
                + "    [Language] ON Book.languageId = [Language].id\n"
                + "LEFT JOIN\n"
                + "    BookAuthor ON Book.id = BookAuthor.bookId\n"
                + "LEFT JOIN\n"
                + "    Author ON BookAuthor.authorId = Author.id\n"
                + "LEFT JOIN\n"
                + "    BookGenre ON Book.id = BookGenre.bookId\n"
                + "LEFT JOIN\n"
                + "    Genre ON BookGenre.genreId = Genre.id\n"
                + "WHERE\n"
                + "    Book.id = ?";
       BookDetail b =null;
        try {
            
            ps = conn.prepareStatement(query);
            ps.setInt(1, bookid);
            System.out.println(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                b = new BookDetail(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),rs.getInt(5), rs.getInt(6), rs.getInt(7), rs.getInt(8),rs.getInt(9), rs.getString(10), rs.getString(11));
                
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
     */
    public int addNewBook(Book b) {
//        if (b.getTitle() == null) {
//            System.out.println("Title must not be null.");
//            return 0;
//        }
//        
//        if (b.getTitle().length() <= 0 || b.getTitle().length() > 100) {
//            System.out.println("Title length must be from 1 to 100 characters.");
//            return 0;
//        }
//        
//        if (b.getDescription() == null) {
//            System.out.println("Description must not be null.");
//            return 0;
//        }
//
//        if (b.getDescription().length() <= 0 || b.getDescription().length() > 2000) {
//            System.out.println("Description length must be from 1 to 2000 characters.");
//            return 0;
//        }
        
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
}
