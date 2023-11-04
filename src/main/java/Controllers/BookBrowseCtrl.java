package Controllers;

import DAOs.DBModelDAOs.AuthorDAO;
import DAOs.DBModelDAOs.BookDAO;
import DAOs.DBModelDAOs.GenreDAO;
import DAOs.DBModelDAOs.LanguageDAO;
import DAOs.DBModelDAOs.PublisherDAO;
import DAOs.MgrModelDAOs.SearchBookDAO;
import Models.DBModels.Author;
import Models.DBModels.Genre;
import Models.DBModels.Language;
import Models.DBModels.Publisher;
import Models.MgrModels.BookDetail;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

/**
 *
 */
public class BookBrowseCtrl extends HttpServlet {

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
        //receive data that selected from client                                                                                                                                                                                                         // @author DuyenLTM
        String authorString = request.getParameter("AuthorID");
        String genreString = request.getParameter("GenreID");
        String languageString = request.getParameter("LanguageID");
        String publisherString = request.getParameter("PublisherID");
        String key = request.getParameter("searchKey");
        request.setAttribute("searchKey", key);

        if (key != null && !key.equals("")) {
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
        } 
        
        //get Books of the author that selected
        if (authorString != null) {
            int selectedAuthor = Integer.valueOf(authorString);
            SearchBookDAO dao = new SearchBookDAO();
            ArrayList<Integer> list = dao.selectByAuthorId(selectedAuthor);
            List<BookDetail> books = new ArrayList<>();
            BookDAO bookDAO = new BookDAO();
            for (Integer integer : list) {
                books.add(bookDAO.getBookDetailByID(integer));
            }

//            Gson gson = new Gson();
//            String jsonResult = gson.toJson(books);
//
//            response.setContentType("application/json");
//            response.setCharacterEncoding("UTF-8");
//            response.getWriter().write(jsonResult);

            request.setAttribute("books", books);
        }

        //get Books of the genre that selected
        if (genreString != null) {
            int selectedGenre = Integer.valueOf(genreString);

            SearchBookDAO dao = new SearchBookDAO();
            ArrayList<Integer> list = dao.seletctByGenreId(selectedGenre);
            List<BookDetail> books = new ArrayList<>();
            BookDAO bookDAO = new BookDAO();
            for (Integer integer : list) {
                books.add(bookDAO.getBookDetailByID(integer));
            }

//            Gson gson = new Gson();
//            String jsonResult = gson.toJson(books);
//
//            response.setContentType("application/json");
//            response.setCharacterEncoding("UTF-8");
//            response.getWriter().write(jsonResult);

            request.setAttribute("books", books);
        }

        //get Books of the language that selected
        if (languageString != null) {
            int selectedLanguage = Integer.valueOf(languageString);

            SearchBookDAO dao = new SearchBookDAO();
            ArrayList<Integer> list = dao.selectByLanguageId(selectedLanguage);
            List<BookDetail> books = new ArrayList<>();
            BookDAO bookDAO = new BookDAO();
            for (Integer integer : list) {
                books.add(bookDAO.getBookDetailByID(integer));
            }

//            Gson gson = new Gson();
//            String jsonResult = gson.toJson(books);
//
//            response.setContentType("application/json");
//            response.setCharacterEncoding("UTF-8");
//            response.getWriter().write(jsonResult);

            request.setAttribute("books", books);
        }

        //get Books of the publisher that selected
        if (publisherString != null) {
            int selectedPublisher = Integer.valueOf(publisherString);

            SearchBookDAO dao = new SearchBookDAO();
            ArrayList<Integer> list = dao.selectByPublisherId(selectedPublisher);
            List<BookDetail> books = new ArrayList<>();
            BookDAO bookDAO = new BookDAO();
            for (Integer integer : list) {
                books.add(bookDAO.getBookDetailByID(integer));
            }

//            Gson gson = new Gson();
//            String jsonResult = gson.toJson(books);
//
//            response.setContentType("application/json");
//            response.setCharacterEncoding("UTF-8");
//            response.getWriter().write(jsonResult);

            request.setAttribute("books", books);
        }
        
        request.getRequestDispatcher("Views/Customer/Book/Book.jsp").forward(request, response);
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
        
        // <editor-fold defaultstate="collapsed" desc="Get category options">
        String optionType = request.getParameter("optionType");
        if (optionType != null && !optionType.isEmpty()) {
            String result = "";
            //get Author list
            if (optionType.equals("author")) {
                result = generateAuthorOptions();
            } else if (optionType.equals("genre")) { //get Genre list
                result = generateGenreOptions();
            } else if (optionType.equals("language")) { //get Language list
                result = generateLanguageOptions();
            } else if (optionType.equals("publisher")) { //get Publisher list
                result = generatePublisherOptions();
            }

            response.setContentType("text/html");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            out.print(result);
            out.flush();
        }
        // </editor-fold>
    }

    /**
     * Get Author data from database via SearchBookDAO.
     * @return String to append in HTML.
     * @author DuyenLTM
     */
    private String generateAuthorOptions() {
        AuthorDAO authorDAO = new AuthorDAO();
        Author[] authors = authorDAO.getAll();

        StringBuilder authorOptions = new StringBuilder();
        for (Author author : authors) {
            // authorOptions.append("<option value=\"").append(author.getId()).append("\">").append(author.getAuthor()).append("</option>");
            authorOptions.append("<li><a href=\"/Book?AuthorID=").append(author.getId()).append("\">").append(author.getAuthor()).append("</a></li>");
        }

        return authorOptions.toString();
    }

    /**
     * Get Genre data from database via SearchBookDAO.
     * @return String to append in HTML.
     * @author DuyenLTM
     */
    private String generateGenreOptions() {
        GenreDAO genreDAO = new GenreDAO();
        Genre[] genres = genreDAO.getAll();

        StringBuilder genreOptions = new StringBuilder();
        for (Genre genre : genres) {
            // genreOptions.append("<option value=\"").append(genre.getId()).append("\">").append(genre.getGenre()).append("</option>");
            genreOptions.append("<li><a href=\"/Book?GenreID=").append(genre.getId()).append("\">").append(genre.getGenre()).append("</a></li>");
        }

        return genreOptions.toString();
    }

    /**
     * Get Language data from database via SearchBookDAO.
     * @return String to append in HTML.
     * @author DuyenLTM
     */
    private String generateLanguageOptions() {
        LanguageDAO languageDAO = new LanguageDAO();
        Language[] languages = languageDAO.getAll();

        StringBuilder languageOptions = new StringBuilder();
        for (Language language : languages) {
            // languageOptions.append("<option value=\"").append(language.getId()).append("\">").append(language.getLanguage()).append("</option>");
            languageOptions.append("<li><a href=\"/Book?LanguageID=").append(language.getId()).append("\">").append(language.getLanguage()).append("</a></li>");
        }

        return languageOptions.toString();
    }

    /**
     * Get Publisher data from database via SearchBookDAO.
     * @return String to append in HTML.
     * @author DuyenLTM
     */
    private String generatePublisherOptions() {
        PublisherDAO publisherDAO = new PublisherDAO();
        Publisher[] publishers = publisherDAO.getAll();

        StringBuilder publisherOptions = new StringBuilder();
        for (Publisher publisher : publishers) {
            //  publisherOptions.append("<option value=\"").append(publisher.getId()).append("\">").append(publisher.getPublisher()).append("</option>");
            publisherOptions.append("<li><a href=\"/Book?PublisherID=").append(publisher.getId()).append("\">").append(publisher.getPublisher()).append("</a></li>");
        }

        return publisherOptions.toString();
    }
}
