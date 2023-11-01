package Controllers;

import DAOs.DBModelDAOs.BookDAO;
import Models.DBModels.Book;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Minh
 */
public class HomePageCtrl extends HttpServlet {

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
        BookDAO bookDAO = new BookDAO();
        
        Book[] topSellers = bookDAO.getTopSellers();
        Book[] hotOffers = bookDAO.getHotOffers();
        Book[] topRatings = bookDAO.getTopRatings();
        Book[] books = bookDAO.getAll();
        
        request.setAttribute("topSellers", topSellers);
        request.setAttribute("hotOffers", hotOffers);
        request.setAttribute("topRatings", topRatings);
        request.setAttribute("books", books);
        
        request.getRequestDispatcher("Views/Customer/Home/HomePage.jsp").forward(request, response);
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
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
