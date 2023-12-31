
package Controllers;

import DAOs.DBModelDAOs.AddressDAO;
import DAOs.DBModelDAOs.BookAuthorDAO;
import DAOs.DBModelDAOs.BookDAO;
import DAOs.DBModelDAOs.BookGenreDAO;
import DAOs.DBModelDAOs.BookPictureDAO;
import DAOs.DBModelDAOs.BookRatingDAO;
import DAOs.DBModelDAOs.CartDAO;
import Models.DBModels.BookPicture;
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
import Models.MgrModels.BookRatingDetail;
import Models.MgrModels.OrderItem;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.ArrayList;

/**
 *
 * @author mummykiara
 */
public class BookDetailCtrl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
        int id = Integer.valueOf(request.getParameter("ID"));
        request.setAttribute("id", id);
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
            List<BookRatingDetail> bookratinglist = bookrating.getBookRatingWithUserName(bookDetail.getId());

            if (bookDetail != null) {
                request.setAttribute("bookDetail", bookDetail);
                request.setAttribute("BookAuthor", authorlist);
                request.setAttribute("BookGenre", genrelist);
                request.setAttribute("BookPicture", bookpicturelist);
                request.setAttribute("BookRating", bookratinglist);
                request.setAttribute("addedSuccess", request.getParameter("addedSuccess"));
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
        // Buy now 
        if (request.getParameter("btnSubmit") != null && request.getParameter("btnSubmit").equals("Mua ngay")) {
            List<OrderItem> orderlist = new ArrayList<>();
            BookDAO book = new BookDAO();
            BookDetail b;

            String[] bookIds = request.getParameterValues("bookIds");
            String[] customerIds = request.getParameterValues("customerIds");
            String[] quantities = request.getParameterValues("quantities");

            String customerid = request.getParameter("customerid");
            String bookid = request.getParameter("bookid");
            String quantity = request.getParameter("quantityBook");
            
            int customerID = Integer.valueOf(customerid);
            AddressDAO addressDao = new AddressDAO();
            
            int bookID = Integer.parseInt(bookid);
            int bookQuantity = Integer.parseInt(quantity);
            b = book.getBookDetailByID(bookID);
            orderlist.add(new OrderItem(b.getId(), b.getTitle(), b.getPrice(), b.getSalePrice(), bookQuantity, b.getThumbnail()));
            
            ObjectMapper objectMapper = new ObjectMapper();
            String jsonList = objectMapper.writeValueAsString(orderlist);
            
            request.setAttribute("jsonList", jsonList.replace("\"", "'"));
            request.setAttribute("OrderItems", orderlist);
            request.setAttribute("addresses", addressDao.getAll(customerID));
            request.getRequestDispatcher("/Views/Customer/OrderCreate/createOrder.jsp").forward(request, response);
        } else {
            ArrayList<Cart> listcart = new ArrayList<>();
            CartDAO cart = new CartDAO();
            BookDAO bookDAO = new BookDAO();

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
                    cart.UpdateCart(newquantity, cusId, bookId);
                    bookDAO.updateQuantity(bookId, (-1) * quanTity);
                } else {
                    cart.AddNewItemToCart(new Cart(quanTity, bookId, cusId));
                    bookDAO.updateQuantity(bookId, (-1) * quanTity);
                }
                response.sendRedirect("/Book/Detail?ID=" + bookId + "&addedSuccess=true");
            } catch (IOException e) {
                System.out.println(e);
            }
        }
    }
}
