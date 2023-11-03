
package Controllers;

import DAOs.DBModelDAOs.BookAuthorDAO;
import DAOs.DBModelDAOs.BookDAO;
import DAOs.DBModelDAOs.BookGenreDAO;
import DAOs.DBModelDAOs.BookPictureDAO;
import DAOs.DBModelDAOs.BookRatingDAO;
import DAOs.DBModelDAOs.CartDAO;
import Models.DBModels.BookPicture;
import Models.DBModels.Cart;
import Models.DBModels.Rating;
import Models.MgrModels.BookDetail;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import Models.MgrModels.BookAuthorDetail;
import Models.MgrModels.BookGenreDetail;
import java.util.ArrayList;

/**
 *
 * @author mummykiara
 */
public class BookDetailCtrl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = 1;
        BookDAO book = new BookDAO();
        BookGenreDAO bookgenre = new BookGenreDAO();
        BookAuthorDAO bookauthor = new BookAuthorDAO();
        BookPictureDAO bookpicture = new BookPictureDAO();
        BookRatingDAO bookrating = new BookRatingDAO();
        
        try {
            BookDetail bookDetail = book.getBookDetailByID(id);
            List<BookGenreDetail> genrelist = bookgenre.getBookGenreByID(bookDetail.getId());
            List<BookAuthorDetail> authorlist = bookauthor.getBookAuthorByID(bookDetail.getId());
            List<BookPicture> bookpicturelist = bookpicture.getBookPictureById(bookDetail.getId());
            //List<Rating> bookratinglist = bookrating.getBookRating(bookDetail.getId());

            if (bookDetail != null) {
                request.setAttribute("bookDetail", bookDetail);
                request.setAttribute("BookAuthor", authorlist);
                request.setAttribute("BookGenre", genrelist);
                request.setAttribute("BookPicture", bookpicturelist);
              //  request.setAttribute("BookRating", bookratinglist);
                request.getRequestDispatcher("/Views/Customer/BookDetail/BookDetail.jsp").forward(request, response);
            }
        } catch (IOException | ServletException e) {
            System.err.println(e);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        ArrayList<Cart> listcart = new ArrayList<>();
        CartDAO cart = new CartDAO();

        String customerid = request.getParameter("customerid");
        String bookid = request.getParameter("bookid");
        String quantity = request.getParameter("quantityBook");

        int cusId = Integer.parseInt(customerid);
        int bookId = Integer.parseInt(bookid);
        int quanTity = Integer.parseInt(quantity);
        try {
            listcart = cart.GetCartByID(cusId, bookId);
            if (listcart.size() != 0) {
                int oldquantity = listcart.get(0).getQuantity();
                int newquantity = oldquantity + quanTity;
                cart.UpdateCart(bookId, cusId, newquantity);
            }else {
                cart.AddNewItemToCart(new Cart(cusId, quanTity, bookId));
            }
            response.sendRedirect("Book");
        } catch (IOException e) {
            System.out.println(e);
        }
    }
}
