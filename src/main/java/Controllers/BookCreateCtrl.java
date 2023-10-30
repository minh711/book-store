/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.DBModelDAOs.AuthorDAO;
import DAOs.DBModelDAOs.BookDAO;
import DAOs.DBModelDAOs.GenreDAO;
import DAOs.DBModelDAOs.LanguageDAO;
import DAOs.DBModelDAOs.PublisherDAO;
import Models.DBModels.Author;
import Models.DBModels.Book;
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
import java.util.Arrays;

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
        
        // Submit
        if (request.getParameter("submit") != null && request.getParameter("submit").equals("Thêm Sách mới")) {
            int bookId = 0;
            int publisherId = 0;
            int languageId = 0;
            int[] selectedGenreIds;
            int[] selectedAuthorIds;
            String title = request.getParameter("txtTitle");
            String description = request.getParameter("txtDescription");
            String[] thumbnail = Utilities.FileMethods.UploadPictures(request, "thumbnail", "");
            String[] pics = Utilities.FileMethods.UploadPictures(request, "pictures", "");
            
            // <editor-fold defaultstate="collapsed" desc="Retrive parameters">
            try {
                bookId = Integer.valueOf(request.getParameter("txtBookId"));
            } catch (Exception e) {
                System.out.println("Error in book ID.");
            }
            
            // For debugging
//            System.out.println("Book ID: " + bookId);
//            System.out.println("Title: " + title);
//            System.out.println("Description: " + description);
            
            try {
                String[] selectedGenreIdsString = request.getParameterValues("selectedGenreIds");
                String[] selectedAuthorIdsString = request.getParameterValues("selectedAuthorIds");
                selectedGenreIds = new int[selectedGenreIdsString.length];
                selectedAuthorIds = new int[selectedAuthorIdsString.length];
                publisherId = Integer.valueOf(request.getParameter("txtPublisherId"));
                languageId = Integer.valueOf(request.getParameter("txtLanguageId"));
                
                for (int i = 0; i < selectedGenreIdsString.length; i++) {
                    selectedGenreIds[i] = Integer.valueOf(selectedGenreIdsString[i]);
                }
                for (int i = 0; i < selectedAuthorIdsString.length; i++) {
                    selectedAuthorIds[i] = Integer.valueOf(selectedAuthorIdsString[i]);
                }
                
                // For debugging
//                System.out.println("Genres: " + Arrays.toString(selectedGenreIds));
//                System.out.println("Authors: " + Arrays.toString(selectedAuthorIds));
            } catch (NumberFormatException e) {
                System.out.println("Error in selecting genres and authors.");
            }
            
            // For debugging
//            try {
//                System.out.println("Thumbnail : " + thumbnail[0]);
//                System.out.println("Pictures: " + Arrays.toString(pics));
//            } catch (Exception e) {
//                System.out.println("Error in picture uploading.");
//            }
            // </editor-fold>
            
            Book book = new Book(
                    bookId,
                    title,
                    description,
                    thumbnail[0],
                    9000,
                    10000,
                    10,
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
        }
    }
}