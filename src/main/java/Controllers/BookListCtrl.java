/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controllers;

import DAOs.DBModelDAOs.BookDAO;
import DAOs.DBModelDAOs.BookPictureDAO;
import Models.DBModels.BookPicture;
import Models.MgrModels.BookDetail;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author DatNTTce171366
 */
public class BookListCtrl extends HttpServlet {

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
        BookDAO bookDAO = new BookDAO();
        
        int countBookAvailable = 0;
        int countBookNotAvailable = 0;
        int countBookOutStock = 0;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date startDate;
        Date endDate;
        ArrayList<BookDetail> bookdetail = new ArrayList<>();

        String StartDate = "2023-10-30";
        String EndDate = "2023-11-05";

        countBookAvailable = bookDAO.getBookAvailable();
        countBookNotAvailable = bookDAO.getBookNotAvailable();
        countBookOutStock = bookDAO.getBookOutStock();

        try {
            startDate = new Date(sdf.parse(StartDate).getTime());
            endDate = new Date(sdf.parse(EndDate).getTime());
            ArrayList<Integer> result = bookDAO.getTopBookSoldByTime(startDate, endDate);
            for (Integer e : result) {
                bookdetail.add(bookDAO.getBookDetailByID(e));
            }
        } catch (ParseException ex) {
            System.out.println(ex);
        }

        request.setAttribute("StartDate", StartDate);
        request.setAttribute("EndDate", EndDate);
        request.setAttribute("dataBookAvailable", countBookAvailable);
        request.setAttribute("dataBookNotAvailable", countBookNotAvailable);
        request.setAttribute("dataBookOutStock", countBookOutStock);
        request.setAttribute("BookDetail", bookdetail);
        
        request.setAttribute("booklistadmin", bookDAO.getBook2());
        
        request.getRequestDispatcher("/Views/Admin/BookList/BookList.jsp").forward(request, response);
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
        BookDAO bookDao = new BookDAO();
        ArrayList<BookDetail> bookdetail = new ArrayList<>();
        int countBookAvailable = 0;
        int countBookNotAvailable = 0;
        int countBookOutStock = 0;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        Date startDate;
        Date endDate;

        String startdate = request.getParameter("startdate");
        String enddate = request.getParameter("enddate");

        countBookAvailable = bookDao.getBookAvailable();
        countBookNotAvailable = bookDao.getBookNotAvailable();
        countBookOutStock = bookDao.getBookOutStock();

        try {
            startDate = new Date(sdf.parse(startdate).getTime());
            endDate = new Date(sdf.parse(enddate).getTime());

            String formatStartDate = sdf.format(startDate);
            String formatEndDate = sdf.format(endDate);

            ArrayList<Integer> bookidlist = bookDao.getTopBookSoldByTime(startDate, endDate);

            for (Integer i : bookidlist) {
                bookdetail.add(bookDao.getBookDetailByID(i));
            }

            request.setAttribute("UserStartDate", formatStartDate);
            request.setAttribute("UserEndDate", formatEndDate);

            request.setAttribute("dataBookAvailable", countBookAvailable);
            request.setAttribute("dataBookNotAvailable", countBookNotAvailable);
            request.setAttribute("dataBookOutStock", countBookOutStock);

            request.setAttribute("BookDetail", bookdetail);
            
            request.setAttribute("booklistadmin", bookDao.getBook2());
            
            request.getRequestDispatcher("/Views/Admin/BookList/BookList.jsp").forward(request, response);
        } catch (ParseException e) {
        }
    }
}
