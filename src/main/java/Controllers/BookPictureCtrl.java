package Controllers;

import DAOs.DBModelDAOs.BookPictureDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * General controller for book picture.
 * @author MinhTD
 */
public class BookPictureCtrl extends HttpServlet {

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
        if (request.getParameter("btnDeletePic") != null && !request.getParameter("btnDeletePic").equals("")) {
            int picId = Integer.valueOf(request.getParameter("picId"));
            BookPictureDAO bookPictureDAO = new BookPictureDAO();
            bookPictureDAO.delete(picId);
        }
        
        if (request.getParameter("btnDeleteAllPics") != null && !request.getParameter("btnDeleteAllPics").equals("")) {
            int bookId = Integer.valueOf(request.getParameter("bookId"));
            BookPictureDAO bookPictureDAO = new BookPictureDAO();
            bookPictureDAO.deleteAllByBookId(bookId);
        }
        response.sendRedirect(request.getContextPath() + "/Views/add-book-picture/add-book-picture.jsp");
    }
}
