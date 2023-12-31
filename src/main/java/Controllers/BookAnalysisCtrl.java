/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.DBModelDAOs.BookDAO;
import Models.MgrModels.BookDetail;
import Models.MgrModels.BookQuantityAnalysis;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author NhuLNT
 */
public class BookAnalysisCtrl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        int role = (int) session.getAttribute("role");
        if (role != 4 && role != 2) {
            response.sendRedirect("/Home");
            return;
        }
        
        BookDAO bookDao = new BookDAO();
        int countBookAvailable = 0;
        int countBookNotAvailable = 0;
        int countBookOutStock = 0;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date startDate;
        Date endDate;
        ArrayList<BookDetail> bookdetail = new ArrayList<>();

        String StartDate = "2023-10-30";
        String EndDate = "2023-11-05";

        countBookAvailable = bookDao.getBookAvailable();
        countBookNotAvailable = bookDao.getBookNotAvailable();
        countBookOutStock = bookDao.getBookOutStock();

        try {
            startDate = new Date(sdf.parse(StartDate).getTime());
            endDate = new Date(sdf.parse(EndDate).getTime());
            ArrayList<Integer> result = bookDao.getTopBookSoldByTime(startDate, endDate);
            for (Integer e : result) {
                bookdetail.add(bookDao.getBookDetailByID(e));
            }
        } catch (ParseException ex) {
            System.out.println(ex);
        }

        try {
            request.setAttribute("StartDate", StartDate);
            request.setAttribute("EndDate", EndDate);
            request.setAttribute("dataBookAvailable", countBookAvailable);
            request.setAttribute("dataBookNotAvailable", countBookNotAvailable);
            request.setAttribute("dataBookOutStock", countBookOutStock);
            request.setAttribute("BookDetail", bookdetail);
            request.getRequestDispatcher("/Views/Admin/BookReport/BookReport.jsp").forward(request, response);
        } catch (IOException | ServletException e) {
            System.out.println(e);
        }
    }

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
            request.getRequestDispatcher("/Views/Admin/BookReport/BookReport.jsp").forward(request, response);

        } catch (ParseException e) {
        }

    }

}
