/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
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

    public ArrayList<BookDetail> getBookDetailByID(int bookid) {
        String query = "SELECT\n"
                + "	Book.id,\n"
                + "    Book.title,\n"
                + "    Publisher.publisher,\n"
                + "    [Language].language,\n"
                + "	Book.salePrice,\n"
                + "	Book.discount,\n"
                + "	Book.price,\n"
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
        ArrayList<BookDetail> list = new ArrayList<>();
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, bookid);
            System.out.println(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                BookDetail b = new BookDetail(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),rs.getInt(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getString(9), rs.getString(10));
                list.add(b);
            }
        } catch (SQLException e) {
            System.out.println(e);
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public static void main(String[] args) {
        BookDAO book = new BookDAO();
        ArrayList<BookDetail> list = book.getBookDetailByID(1);
        System.out.println(list.get(0).getTitle() +  list.get(0).getPublisher());

    }
    
}
