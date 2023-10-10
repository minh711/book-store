/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import DAO.BookAuthorDAO;
import DAO.BookDAO;
import DAO.BookGenreDAO;
import newModel.BookDetail;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import newModel.BookAuthorDetail;
import newModel.BookGenreDetail;

/**
 *
 * @author mummykiara
 */
public class bookDetailServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet bookDetailServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet bookDetailServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int id =1;
        BookDAO book = new BookDAO();
        BookGenreDAO bookgenre = new BookGenreDAO();
        BookAuthorDAO bookauthor = new BookAuthorDAO();
        try {
            List<BookDetail> list =  book.getBookDetailByID(id);
            List<BookGenreDetail> genrelist = bookgenre.getBookGenreByID(list.get(0).getId());
            List<BookAuthorDetail> authorlist = bookauthor.getBookAuthorByID(list.get(0).getId());
            
            if (!list.isEmpty()) {
            request.setAttribute("BookTittle", list.get(0).getTitle());
            request.setAttribute("BookName", list.get(0).getTitle());
            request.setAttribute("BookPublisher", list.get(0).getPublisher());
            request.setAttribute("BookLanguage", list.get(0).getLanguage());
            request.setAttribute("BookSalePrice", list.get(0).getSalePrice());
            request.setAttribute("BookDiscount", list.get(0).getDiscount());
            request.setAttribute("BookPrice", list.get(0).getPrice());
            request.setAttribute("BookQuantity", list.get(0).getQuantity());
            request.setAttribute("BookDescription", list.get(0).getDescription());
                System.out.println(genrelist.get(0).getGenre());
            request.setAttribute("BookAuthor", authorlist);
            request.setAttribute("BookGenre", genrelist);
            request.getRequestDispatcher("Views/BookDetail/BookDetail.jsp").forward(request, response);
            }
        } catch (IOException | ServletException e) {
            System.err.println(e);
        }
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
