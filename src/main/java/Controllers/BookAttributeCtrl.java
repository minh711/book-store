package Controllers;

import DAOs.DBModelDAOs.AuthorDAO;

import DAOs.DBModelDAOs.GenreDAO;
import DAOs.DBModelDAOs.LanguageDAO;
import DAOs.DBModelDAOs.PublisherDAO;
import DAOs.MgrModelDAOs.BookAttributeDAO;
import Models.DBModels.Author;
import Models.DBModels.Genre;
import Models.DBModels.Language;
import Models.DBModels.Publisher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author DuyenLTM
 */
public class BookAttributeCtrl extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
        AuthorDAO authorDAO = new AuthorDAO();
        Author[] authors = authorDAO.getAll();
        request.setAttribute("authors", authors);

        GenreDAO genreDAO = new GenreDAO();
        Genre[] genres = genreDAO.getAll();
        request.setAttribute("genres", genres);

        LanguageDAO languageDAO = new LanguageDAO();
        Language[] languages = languageDAO.getAll();
        request.setAttribute("languages", languages);

        PublisherDAO publisherDAO = new PublisherDAO();
        Publisher[] publishers = publisherDAO.getAll();
        request.setAttribute("publishers", publishers);

        request.getRequestDispatcher("/Views/Admin/BookAttribute/BookAttribute.jsp").forward(request, response);
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

        String deleteAuthorIdString = request.getParameter("deleteAuthorId");
        if (deleteAuthorIdString != null) {
            int authorIdToDelete = Integer.parseInt(deleteAuthorIdString);
            BookAttributeDAO bookAttributeDAO = new BookAttributeDAO();
            int kq = bookAttributeDAO.deleteAuthor(authorIdToDelete);
        }

        String deleteGenreIdString = request.getParameter("deleteGenreId");
        if (deleteGenreIdString != null) {
            int genreIdToDelete = Integer.parseInt(deleteGenreIdString);
            BookAttributeDAO bookAttributeDAO = new BookAttributeDAO();
            int kq = bookAttributeDAO.deleteGenre(genreIdToDelete);
        }

        String deleteLanguageIdString = request.getParameter("deleteLanguageId");
        if (deleteLanguageIdString != null) {
            int languageIdToDelete = Integer.parseInt(deleteLanguageIdString);
            BookAttributeDAO bookAttributeDAO = new BookAttributeDAO();
            int kq = bookAttributeDAO.deleteLanguage(languageIdToDelete);
        }

        String deletePublisherIdString = request.getParameter("deletePublisherId");
        if (deletePublisherIdString != null) {
            int publisherIdToDelete = Integer.parseInt(deletePublisherIdString);
            BookAttributeDAO bookAttributeDAO = new BookAttributeDAO();
            int kq = bookAttributeDAO.deletePublisher(publisherIdToDelete);
        }

        String authorIdString = request.getParameter("authorId");
        String updatedAuthorName = request.getParameter("authorName");

        String genreIdString = request.getParameter("genreId");
        String updatedGenreName = request.getParameter("genreName");

        String languageIdString = request.getParameter("languageId");
        String updatedLanguageName = request.getParameter("languageName");

        String publisherIdString = request.getParameter("publisherId");
        String updatedPublisherName = request.getParameter("publisherName");

        if (authorIdString != null) {
            int authorId = Integer.valueOf(authorIdString);
            BookAttributeDAO author = new BookAttributeDAO();
            int updateSuccess = author.updateAuthor(authorId, updatedAuthorName);
        }

        if (genreIdString != null) {
            int genreId = Integer.valueOf(genreIdString);
            BookAttributeDAO genre = new BookAttributeDAO();
            int updateSuccess = genre.updateGenre(genreId, updatedGenreName);
        }

        if (languageIdString != null) {
            int languageId = Integer.valueOf(languageIdString);
            BookAttributeDAO language = new BookAttributeDAO();
            int updateSuccess = language.updateLanguage(languageId, updatedLanguageName);
        }

        if (publisherIdString != null) {
            int publisherId = Integer.valueOf(publisherIdString);
            BookAttributeDAO publisher = new BookAttributeDAO();
            int updateSuccess = publisher.updatePublisher(publisherId, updatedPublisherName);
        }
        AuthorDAO authorDAO = new AuthorDAO();
        Author[] authors = authorDAO.getAll();
        request.setAttribute("authors", authors);

        GenreDAO genreDAO = new GenreDAO();
        Genre[] genres = genreDAO.getAll();
        request.setAttribute("genres", genres);

        LanguageDAO languageDAO = new LanguageDAO();
        Language[] languages = languageDAO.getAll();
        request.setAttribute("languages", languages);

        PublisherDAO publisherDAO = new PublisherDAO();
        Publisher[] publishers = publisherDAO.getAll();
        request.setAttribute("publishers", publishers);

        request.getRequestDispatcher("/Views/Admin/BookAttribute/BookAttribute.jsp").forward(request, response);
    }
}
