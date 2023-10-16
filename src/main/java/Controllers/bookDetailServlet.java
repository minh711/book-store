
package Controllers;

import DAOs.DBModelDAOs.BookAuthorDAO;
import DAOs.DBModelDAOs.BookDAO;
import DAOs.DBModelDAOs.BookGenreDAO;
import DAOs.DBModelDAOs.CartDAO;
import Models.DBModels.Cart;
import Models.MgrModels.BookDetail;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import Models.MgrModels.BookAuthorDetail;
import Models.MgrModels.BookGenreDetail;

/**
 *
 * @author mummykiara
 */
public class bookDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = 1;
        BookDAO book = new BookDAO();
        BookGenreDAO bookgenre = new BookGenreDAO();
        BookAuthorDAO bookauthor = new BookAuthorDAO();
        try {
            List<BookDetail> list = book.getBookDetailByID(id);
            List<BookGenreDetail> genrelist = bookgenre.getBookGenreByID(list.get(0).getId());
            List<BookAuthorDetail> authorlist = bookauthor.getBookAuthorByID(list.get(0).getId());

            if (!list.isEmpty()) {
                request.setAttribute("BookID", list.get(0).getId());
                request.setAttribute("BookTittle", list.get(0).getTitle());
                request.setAttribute("BookName", list.get(0).getTitle());
                request.setAttribute("BookThumbnail", list.get(0).getThumbnail());
                request.setAttribute("BookPublisher", list.get(0).getPublisher());
                request.setAttribute("BookLanguage", list.get(0).getLanguage());
                request.setAttribute("BookSalePrice", list.get(0).getSalePrice());
                request.setAttribute("BookDiscount", list.get(0).getDiscount());
                request.setAttribute("BookPrice", list.get(0).getPrice());
                request.setAttribute("BookQuantity", list.get(0).getQuantity());
                request.setAttribute("BookDescription", list.get(0).getDescription());
                request.setAttribute("BookAuthor", authorlist);
                request.setAttribute("BookGenre", genrelist);
                request.getRequestDispatcher("Views/BookDetail/BookDetail.jsp").forward(request, response);
                System.out.println(list.get(0).getPublisher() + "\t" + list.get(0).getTitle());
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
        
        CartDAO cart = new CartDAO();

        String customerid = request.getParameter("customerid");
        String bookid = request.getParameter("bookid");
        String quantity = request.getParameter("quantityBook");

        int cusId = Integer.parseInt(customerid);
        int bookId = Integer.parseInt(bookid);
        int quanTity = Integer.parseInt(quantity);
        try {
            cart.AddNewItemToCart(new Cart(cusId, quanTity, bookId));
            response.sendRedirect("bookdetail");
            
        } catch (IOException e) {
        }

    }

}
