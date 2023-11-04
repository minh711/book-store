package Controllers;

import DAOs.DBModelDAOs.BookDAO;
import DAOs.DBModelDAOs.BookRatingDAO;
import DAOs.DBModelDAOs.OrderDetailDao;
import Models.DBModels.Book;
import Models.DBModels.OrderDetail;
import Models.DBModels.Rating;
import Models.MgrModels.BookDetail;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author NhuLNT
 */
public class BookRatingCtrl extends HttpServlet {

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BookDAO book = new BookDAO();
        
        int userId = 6;
        OrderDetail oDetail = new OrderDetail(1, 1, 3, 74000, 90000);

        try {
            BookDetail bDetail = book.getBookDetailByID(oDetail.getBookId());

            if (bDetail != null) {
                request.setAttribute("BookDetail", bDetail);
                request.setAttribute("User", userId);
                request.getRequestDispatcher("/Views/Customer/Rating/Rating.jsp").forward(request, response);
            }

        } catch (ServletException | IOException e) {
            System.out.println(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BookDAO bookDao = new BookDAO();
        Book bookinfo = new Book();
        Book bookupdate = new Book();
        BookRatingDAO rating = new BookRatingDAO();
        Date currentDate = new Date();
        Timestamp currentTime = new Timestamp(currentDate.getTime());
        float avgRating = 0.0f;
        int totalRatingStar = 0;
        int totalRating = 0;
        
        String comments = request.getParameter("Comment");
        String userId = request.getParameter("UserId");
        String bookId = request.getParameter("BookId");
        String star = request.getParameter("star");
        
        int bookstar = Integer.parseInt(star);
        int bookID = Integer.parseInt(bookId);
        int customerID = Integer.parseInt(userId);
        
        bookinfo = bookDao.getBookByID(bookID);
        
        totalRatingStar = bookinfo.getTotalRatingStar() + bookstar;
        totalRating = bookinfo.getTotalRating() + 1;
        avgRating = (float)totalRatingStar / totalRating;
        
        bookupdate = new Book(bookinfo.getId(),bookinfo.getTitle(),bookinfo.getDescription(),bookinfo.getThumbnail(),bookinfo.getSalePrice(),bookinfo.getPrice(),bookinfo.getDiscount(),bookinfo.getQuantity(),bookinfo.getSoleTotal(),bookinfo.isIsAvailable(),bookinfo.getPubisherId(),bookinfo.getLanguageId(),totalRating,totalRatingStar,avgRating);
        
        Rating bookrating = new Rating(bookstar,comments,bookID,customerID,currentTime);
        
        try {
            rating.addRating(bookrating);
            rating.UpdateBookDetailRating(bookupdate);
            request.getRequestDispatcher("/Views/Customer/Home/Home.jsp").forward(request, response);
        } catch (IOException e) {
            System.out.println(e);
        }

    }
}
