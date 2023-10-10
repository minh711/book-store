package Controllers;

import DAOs.DBModelDAOs.BookPictureDAO;
import Models.DBModels.BookPicture;
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
        int bookId = 1; // temporaty
        
        BookPictureDAO bookPictureDAO = new BookPictureDAO();
        BookPicture bookPictures[] = bookPictureDAO.getAllByBookId(bookId);
                
        PrintWriter out = response.getWriter();
        
        for (BookPicture bp : bookPictures) {
            out.println("<div class=\"mx-2 my-2 book-picture\" style=\"width: 120px; position: relative;\">\n"
                    + "                    <img \n"
                    + "                        style=\"width: 120px; height: 160px; object-fit: contain;\" \n"
                    + "                        src=\"" + request.getContextPath() + "/Images/" + bp.getPicture() + "\"\n"
                    + "                    >\n"
                    + "                    \n"
                    + "                    <div \n"
                    + "                        style=\"position: absolute; top: 0; width: 100%; height: 100%;\" \n"
                    + "                    >\n"
                    + "                        <div class=\"d-flex justify-content-between align-items-center p-1\">\n"
                    + "                            <input type=\"checkbox\" class=\"mx-2 delete-pic-checkbox\" data-id=\"" + bp.getId() + "\">\n"
                    + "                            <div \n"
                    + "                                onclick=\"return deleteBookPicture(this)\" \n"
                    + "                                class=\"mx-2 delete-pic-button\" \n"
                    + "                                data-id=\"" + bp.getId() + "\"\n"
                    + "                            ><i class=\"fa-solid fa-trash\"></i></div>\n"
                    + "                        </div>\n"
                    + "                    </div>\n"
                    + "                    \n"
                    + "                </div>");
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
        BookPictureDAO bookPictureDAO = new BookPictureDAO();

        String deletePic = request.getParameter("deletePic");
        if (deletePic != null && !deletePic.equals("")) {
            int picId = Integer.valueOf(request.getParameter("deletePic"));
            bookPictureDAO.delete(picId);
        }
        
        String[] selectedIds = request.getParameterValues("deleteSelected");
        if (selectedIds != null) {
            for (String id : selectedIds) {
                int bookPictureId = Integer.parseInt(id);
                bookPictureDAO.delete(bookPictureId);
            }
        }
    }
}
