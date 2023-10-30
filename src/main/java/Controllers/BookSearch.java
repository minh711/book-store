package Controllers;

import DAOs.DBModelDAOs.BookDAO;
import DAOs.MgrModelDAOs.SearchBookDAO;
import Models.MgrModels.BookDetail;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashSet;
/**
 *
 * @author DuyenLTM
 */
public class BookSearch extends HttpServlet {

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
        String key = request.getParameter("searchKey");
        if (key != "") {
            HashSet<Integer> hashSet = new HashSet<>();
            SearchBookDAO dao = new SearchBookDAO();
            ArrayList<Integer> list1 = dao.searchByAuthorId(key);
            ArrayList<Integer> list2 = dao.searchByBookId(key);
            ArrayList<Integer> list3 = dao.searchByGenreId(key);
            ArrayList<Integer> list4 = dao.searchByLanguageId(key);
            ArrayList<Integer> list5 = dao.searchByPublisherId(key);

            ArrayList<Integer> list = new ArrayList<>();
            list.addAll(list1);
            list.addAll(list2);
            list.addAll(list3);
            list.addAll(list4);
            list.addAll(list5);

            for (Integer i : list) {
                hashSet.add(i);
            }
            BookDAO bookDAO = new BookDAO();
            ArrayList<BookDetail> books = new ArrayList<>();
            for (Integer integer : hashSet) {
                books.add(bookDAO.getBookDetailByID(integer));
            }
            request.setAttribute("books", books);
            request.getRequestDispatcher("Views/Customer/Home/Home.jsp").forward(request, response);
        } else{
            request.getRequestDispatcher("Views/Customer/Home/Home.jsp").forward(request, response);
        }
    }
}
