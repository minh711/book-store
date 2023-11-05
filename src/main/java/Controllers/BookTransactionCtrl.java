/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.DBModelDAOs.BookDAO;
import DAOs.DBModelDAOs.BookTransactionDAO;
import DAOs.DBModelDAOs.DistributorDAO;
import DAOs.MgrModelDAOs.BookTransactionMgrDAO;
import Models.DBModels.Book;
import Models.DBModels.BookTransaction;
import Models.DBModels.Distributor;
import Models.MgrModels.BookTransactionMgr;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import java.util.Date;

/**
 *
 * @author MinhTD
 */
public class BookTransactionCtrl extends HttpServlet {

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
        request.getRequestDispatcher("/Views/Admin/BookTransaction/BookTransaction.jsp").forward(request, response);
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
        // Load Books
        if (request.getParameter("isLoadBooks") != null && request.getParameter("isLoadBooks").equals("true")) {
            BookDAO bookDAO = new BookDAO();
            Book[] books = bookDAO.getAll();
            String json = new Gson().toJson(books);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
        }
        
        //Load Distributors
        if (request.getParameter("isLoadDistributors") != null && request.getParameter("isLoadDistributors").equals("true")) {
            DistributorDAO distributorDAO = new DistributorDAO();
            Distributor[] distributors = distributorDAO.getAll();
            String json = new Gson().toJson(distributors);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
        }
        
        //Load history
        if (request.getParameter("isLoadHistory") != null && request.getParameter("isLoadHistory").equals("true")) {
            BookTransactionMgrDAO bookTransactionMgrDAO = new BookTransactionMgrDAO();
            BookTransactionMgr[] bookTransactionMgrs = bookTransactionMgrDAO.getAll();
            String json = new Gson().toJson(bookTransactionMgrs);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
        }
        
        // Delete
        if (request.getParameter("deleteId") != null && !request.getParameter("deleteId").equals("")) {
            int id = Integer.valueOf(request.getParameter("deleteId"));
            BookTransactionDAO bookTransactionDAO = new BookTransactionDAO();
            BookDAO bookDAO = new BookDAO();
            BookTransaction bookTransaction = bookTransactionDAO.getBookTransaction(id);
            bookDAO.updateQuantity(bookTransaction.getBookId(),(-1) * bookTransaction.getQuantity());
            bookTransactionDAO.delete(id);
        }
        
        // Add Distributor
        if (request.getParameter("addDistributor") != null && !request.getParameter("addDistributor").equals("")) {
            String distributor = request.getParameter("addDistributor");
            DistributorDAO distributorDAO = new DistributorDAO();
            distributorDAO.addNew(distributor);
        }
        
        // Add new trasaction
        if (request.getParameter("bookId") != null && !request.getParameter("bookId").equals("")) {
            int bookId = Integer.valueOf(request.getParameter("bookId"));
            int distributorId = Integer.valueOf(request.getParameter("distributorId"));
            int quantity = Integer.valueOf(request.getParameter("quantity"));
            int total = Integer.valueOf(request.getParameter("total"));
            Date currentDate = new Date();
            Timestamp currentTimestamp = new Timestamp(currentDate.getTime());
            BookTransaction bookTransaction = new BookTransaction(
                0, // 0 is the ID but we don't need it for adding
                bookId, 
                distributorId, 
                1, // 1 is for temporary account id
                quantity, 
                currentTimestamp, 
                total
            ); 
            BookTransactionDAO bookTransactionDAO = new BookTransactionDAO();
            BookDAO bookDAO = new BookDAO();
            
            bookTransactionDAO.addNew(bookTransaction);
            bookDAO.updateQuantity(bookId, quantity);
        }
    }
}
