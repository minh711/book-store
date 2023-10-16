/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.DBModelDAOs.BookTransactionDAO;
import DAOs.MgrModelDAOs.BookTransactionMgrDAO;
import Models.DBModels.BookTransaction;
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
        BookTransactionMgrDAO bookTransactionMgrDAO = new BookTransactionMgrDAO();
        BookTransactionMgr[] bookTransactionMgrs = bookTransactionMgrDAO.getAll();
        
        String json = new Gson().toJson(bookTransactionMgrs);
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
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
        // Delete
        if (request.getParameter("deleteId") != null && !request.getParameter("deleteId").equals("")) {
            int id = Integer.valueOf(request.getParameter("deleteId"));
            BookTransactionDAO bookTransactionDAO = new BookTransactionDAO();
            bookTransactionDAO.delete(id);
        }
        
        // Add new
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
            bookTransactionDAO.addNew(bookTransaction);
        }
    }
}
