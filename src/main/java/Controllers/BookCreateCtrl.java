package Controllers;

import DAOs.DBModelDAOs.AuthorDAO;
import DAOs.DBModelDAOs.BookAuthorDAO;
import DAOs.DBModelDAOs.BookDAO;
import DAOs.DBModelDAOs.BookGenreDAO;
import DAOs.DBModelDAOs.BookPictureDAO;
import DAOs.DBModelDAOs.GenreDAO;
import DAOs.DBModelDAOs.LanguageDAO;
import DAOs.DBModelDAOs.PublisherDAO;
import Models.DBModels.Author;
import Models.DBModels.Book;
import Models.DBModels.BookAuthor;
import Models.DBModels.BookGenre;
import Models.DBModels.BookPicture;
import Models.DBModels.Genre;
import Models.DBModels.Language;
import Models.DBModels.Publisher;
import com.google.gson.Gson;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author MinhTD
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB maximum that can store in memory, for larger, it will store on disk.
        maxFileSize = 1024 * 1024 * 5, // 5 MB for each file.
        maxRequestSize = 1024 * 1024 * 50 // 50 MB can be upload at once.
    ) 
public class BookCreateCtrl extends HttpServlet {

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
        HttpSession session = request.getSession();
        int role = (int) session.getAttribute("role");
        if (role != 4 && role != 2) {
            response.sendRedirect("/Home");
            return;
        }
        
        request.getRequestDispatcher("/Views/Admin/BookCreate/BookCreate.jsp").forward(request, response);
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
        
        // Load Publishers
        if (request.getParameter("loadPublishers") != null && request.getParameter("loadPublishers").equals("true")) {
            PublisherDAO publisherDAO = new PublisherDAO();
            Publisher[] publishers = publisherDAO.getAll();
            String json = new Gson().toJson(publishers);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
        }
        
        // Load Languages
        if (request.getParameter("loadLanguages") != null && request.getParameter("loadLanguages").equals("true")) {
            LanguageDAO languageDAO = new LanguageDAO();
            Language[] languages = languageDAO.getAll();
            String json = new Gson().toJson(languages);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
        }
        
        // Load Genres
        if (request.getParameter("loadGenres") != null && request.getParameter("loadGenres").equals("true")) {
            GenreDAO genreDAO = new GenreDAO();
            Genre[] genres = genreDAO.getAll();
            String json = new Gson().toJson(genres);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
        }
        
        // Load Authors
        if (request.getParameter("loadAuthors") != null && request.getParameter("loadAuthors").equals("true")) {
            AuthorDAO authorDAO = new AuthorDAO();
            Author[] authors = authorDAO.getAll();
            String json = new Gson().toJson(authors);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
        }
        
        // Add new Author
        if (request.getParameter("addNewAuthor") != null && request.getParameter("addNewAuthor").equals("true")) {
            String newAuthor = request.getParameter("newAuthor");
            AuthorDAO authorDAO = new AuthorDAO();
            authorDAO.addNew(newAuthor);
        }
        
        // Add new Genre
        if (request.getParameter("addNewGenre") != null && request.getParameter("addNewGenre").equals("true")) {
            String newGenre = request.getParameter("newGenre");
            GenreDAO genreDAO = new GenreDAO();
            genreDAO.addNew(newGenre);
        }
        
        // Add new Publisher
        if (request.getParameter("addNewPublisher") != null && request.getParameter("addNewPublisher").equals("true")) {
            String newPublisher = request.getParameter("newPublisher");
            PublisherDAO publisherDAO = new PublisherDAO();
            publisherDAO.addNew(newPublisher);
        }
        
        // Add new Language
        if (request.getParameter("addNewLanguage") != null && request.getParameter("addNewLanguage").equals("true")) {
            String newLanguage = request.getParameter("newLanguage");
            LanguageDAO languageDAO = new LanguageDAO();
            languageDAO.addNew(newLanguage);
        }
        
        // Submit
        if (request.getParameter("submit") != null && request.getParameter("submit").equals("Thêm Sách mới")) {
            int bookId = 0;
            int publisherId = 0;
            int languageId = 0;
            int[] genreIds = null;
            int[] authorIds = null;
            String title = request.getParameter("txtTitle");
            String description = request.getParameter("txtDescription");
            int price = Integer.valueOf(request.getParameter("txtPrice"));
            int salePrice = Integer.valueOf(request.getParameter("txtSalePrice"));
            int discount = (100 - (int) Math.ceil((salePrice * 100.0) / price));
            String[] thumbnail = Utilities.FileMethods.UploadPictures(request, "thumbnail", "");
            String[] pics = Utilities.FileMethods.UploadPictures(request, "pictures", "");
            
            // <editor-fold defaultstate="collapsed" desc="Retrive parameters">
            try {
                bookId = Integer.valueOf(request.getParameter("txtBookId"));
            } catch (Exception e) {
                System.out.println("Error in book ID.");
            }

            try {
                String[] selectedGenreIdsString = request.getParameterValues("selectedGenreIds");
                String[] selectedAuthorIdsString = request.getParameterValues("selectedAuthorIds");
                genreIds = new int[selectedGenreIdsString.length];
                authorIds = new int[selectedAuthorIdsString.length];
                publisherId = Integer.valueOf(request.getParameter("txtPublisherId"));
                languageId = Integer.valueOf(request.getParameter("txtLanguageId"));
                
                for (int i = 0; i < selectedGenreIdsString.length; i++) {
                    genreIds[i] = Integer.valueOf(selectedGenreIdsString[i]);
                }
                for (int i = 0; i < selectedAuthorIdsString.length; i++) {
                    authorIds[i] = Integer.valueOf(selectedAuthorIdsString[i]);
                }
            } catch (NumberFormatException e) {
                System.out.println("Error in selecting genres and authors.");
            }
            // </editor-fold>
            
            Book book = new Book(
                    bookId,
                    title,
                    description,
                    thumbnail[0],
                    salePrice,
                    price,
                    discount,
                    0,
                    0,
                    true,
                    publisherId,
                    languageId,
                    0,
                    0,
                    0f
            );
            
            BookDAO bookDAO = new BookDAO();
            int addBookResult = bookDAO.addNewBook(book);
            if (addBookResult == -1) {
                String errMessage = "duplicateId";
                String json = new Gson().toJson(errMessage);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
            }
            
            BookGenreDAO bookGenreDAO = new BookGenreDAO();
            BookAuthorDAO bookAuthorDAO = new BookAuthorDAO();
            BookPictureDAO bookPictureDAO = new BookPictureDAO();
            
            for (int genreId : genreIds) {
                BookGenre bg = new BookGenre(bookId, genreId);
                bookGenreDAO.addNew(bg);
            }
            
            for (int authorId : authorIds) {
                BookAuthor ba = new BookAuthor(bookId, authorId);
                bookAuthorDAO.addNew(ba);
            }
            
            for (String pic : pics) {
                BookPicture bookPicture = new BookPicture(0, pic, bookId);
                bookPictureDAO.addNew(bookPicture);
            }
        }
    }
}
