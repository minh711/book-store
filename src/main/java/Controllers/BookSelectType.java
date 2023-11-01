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
import java.util.List;

/**
 *
 * @author DuyenLTM
 */
public class BookSelectType extends HttpServlet {

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
    }

    //get Author data from database via SearchBookDAO
    private String generateAuthorOptions() {
        AuthorDAO authorDAO = new AuthorDAO();
        Author[] authors = authorDAO.getAll();

        StringBuilder authorOptions = new StringBuilder();
        for (Author author : authors) {
            authorOptions.append("<option value=\"").append(author.getId()).append("\">").append(author.getAuthor()).append("</option>");
        }

        return authorOptions.toString();
    }

    //get Genre data from database via SearchBookDAO
    private String generateGenreOptions() {
        GenreDAO genreDAO = new GenreDAO();
        Genre[] genres = genreDAO.getAll();

        StringBuilder genreOptions = new StringBuilder();
        for (Genre genre : genres) {
            genreOptions.append("<option value=\"").append(genre.getId()).append("\">").append(genre.getGenre()).append("</option>");
        }

        return genreOptions.toString();
    }

    //get Language data from database via SearchBookDAO
    private String generateLanguageOptions() {
        LanguageDAO languageDAO = new LanguageDAO();
        Language[] languages = languageDAO.getAll();

        StringBuilder languageOptions = new StringBuilder();
        for (Language language : languages) {
            languageOptions.append("<option value=\"").append(language.getId()).append("\">").append(language.getLanguage()).append("</option>");
        }

        return languageOptions.toString();
    }

    //get Publisher data from database via SearchBookDAO
    private String generatePublisherOptions() {
        PublisherDAO publisherDAO = new PublisherDAO();
        Publisher[] publishers = publisherDAO.getAll();

        StringBuilder publisherOptions = new StringBuilder();
        for (Publisher publisher : publishers) {
            publisherOptions.append("<option value=\"").append(publisher.getId()).append("\">").append(publisher.getPublisher()).append("</option>");
        }

        return publisherOptions.toString();
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
        //receive data that selected from client
        String authorString = request.getParameter("author");
        String genreString = request.getParameter("genre");
        String languageString = request.getParameter("language");
        String publisherString = request.getParameter("publisher");

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

            Gson gson = new Gson();
            String jsonResult = gson.toJson(books);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonResult);
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

            Gson gson = new Gson();
            String jsonResult = gson.toJson(books);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonResult);
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

            Gson gson = new Gson();
            String jsonResult = gson.toJson(books);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonResult);
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

            Gson gson = new Gson();
            String jsonResult = gson.toJson(books);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonResult);
        }
    }
}
