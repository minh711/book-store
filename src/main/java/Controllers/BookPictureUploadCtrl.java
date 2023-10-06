package Controllers;

import DAOs.DBModelDAOs.BookPictureDAO;
import Models.DBModels.BookPicture;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Handle Book's image upload and delete
 * @author MinhTD
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 50) // 50 MB
public class BookPictureUploadCtrl extends HttpServlet {

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
        String[] pics = Utilities.FileMethods.UploadPictures(request, "fPics", "");
        int length = pics.length;
        
        BookPictureDAO bookPictureDAO = new BookPictureDAO();
        
        int bookId = 1;
        
        for (int i = 0; i < length; i++) {
            BookPicture bookPicture = new BookPicture(0, pics[i], bookId);
            bookPictureDAO.addNew(bookPicture);
        }
        response.sendRedirect(request.getContextPath() + "/Views/add-book-picture/add-book-picture.jsp");
    }
}
