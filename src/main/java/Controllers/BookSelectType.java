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
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BookSelectType</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BookSelectType at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

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
        //----------------------------------------------
        String optionType = request.getParameter("optionType");

        if (optionType != null && !optionType.isEmpty()) {
            String result = "";

            if (optionType.equals("author")) {
                // Xử lý yêu cầu để lấy danh sách tác giả
                // Sử dụng mã của bạn để tạo chuỗi HTML options cho tác giả
                result = generateAuthorOptions();
            } else if (optionType.equals("genre")) {
                // Xử lý yêu cầu để lấy danh sách thể loại (genre)
                // Tạo chuỗi HTML options cho genre
                result = generateGenreOptions();
            } else if (optionType.equals("language")) {
                // Xử lý yêu cầu để lấy danh sách ngôn ngữ (language)
                // Tạo chuỗi HTML options cho language
                result = generateLanguageOptions();
            } else if (optionType.equals("publisher")) {
                // Xử lý yêu cầu để lấy danh sách nhà xuất bản (publisher)
                // Tạo chuỗi HTML options cho publisher
                result = generatePublisherOptions();
            }

            // Trả kết quả về trang JSP
            response.setContentType("text/html");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            out.print(result);
            out.flush();
        }
    }
    private String generateAuthorOptions() {
        // Sử dụng mã của bạn để lấy danh sách tác giả từ cơ sở dữ liệu và tạo HTML options
        AuthorDAO authorDAO = new AuthorDAO();
        Author[] authors = authorDAO.getAll();

        StringBuilder authorOptions = new StringBuilder();
        for (Author author : authors) {
            authorOptions.append("<option value=\"").append(author.getId()).append("\">").append(author.getAuthor()).append("</option>");
        }

        return authorOptions.toString();
    }
    private String generateGenreOptions() {
        // Sử dụng mã của bạn để lấy danh sách tác giả từ cơ sở dữ liệu và tạo HTML options
        GenreDAO genreDAO = new GenreDAO();
        Genre[] genres = genreDAO.getAll();

        StringBuilder genreOptions = new StringBuilder();
        for (Genre genre : genres) {
            genreOptions.append("<option value=\"").append(genre.getId()).append("\">").append(genre.getGenre()).append("</option>");
        }

        return genreOptions.toString();
    }
    private String generateLanguageOptions() {
        // Sử dụng mã của bạn để lấy danh sách tác giả từ cơ sở dữ liệu và tạo HTML options
        LanguageDAO languageDAO = new LanguageDAO();
        Language[] languages = languageDAO.getAll();

        StringBuilder languageOptions = new StringBuilder();
        for (Language language : languages) {
            languageOptions.append("<option value=\"").append(language.getId()).append("\">").append(language.getLanguage()).append("</option>");
        }

        return languageOptions.toString();
    }

    // Các phương thức tạo chuỗi HTML options cho tác giả, genre, language, và publisher
    private String generatePublisherOptions() {
        // Sử dụng mã của bạn để lấy danh sách tác giả từ cơ sở dữ liệu và tạo HTML options
        PublisherDAO publisherDAO = new PublisherDAO();
        Publisher[] publishers = publisherDAO.getAll();

        StringBuilder publisherOptions = new StringBuilder();
        for (Publisher publisher : publishers) {
            publisherOptions.append("<option value=\"").append(publisher.getId()).append("\">").append(publisher.getPublisher()).append("</option>");
        }

        return publisherOptions.toString();
    }
    //------------------------------

    // Các phương thức truy vấn cơ sở dữ liệu và chuyển đổi dữ liệu ở đây
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
        // Nhận thông tin tác giả đã chọn từ yêu cầu
        String authorString = request.getParameter("author");
        String genreString = request.getParameter("genre");
        String languageString = request.getParameter("language");
        String publisherString = request.getParameter("publisher");
        
        if (authorString!=null) {
            int selectedAuthor = Integer.valueOf(authorString);

        // Xử lý dữ liệu, ví dụ: truy vấn cơ sở dữ liệu để lấy danh sách sách của tác giả
        // Điều này phụ thuộc vào logic ứng dụng của bạn
        SearchBookDAO dao = new SearchBookDAO();
        ArrayList<Integer> list = dao.selectByAuthorId(selectedAuthor);
        List<BookDetail> books = new ArrayList<>();
        BookDAO bookDAO = new BookDAO();
        for (Integer integer : list) {
            books.add(bookDAO.getBookDetailByID(integer));
        }

        Gson gson = new Gson();
        String jsonResult = gson.toJson(books);

        // Gửi JSON về phía máy khách
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonResult);
    }
        
        if (genreString!=null) {
            int selectedGenre = Integer.valueOf(genreString);

        // Xử lý dữ liệu, ví dụ: truy vấn cơ sở dữ liệu để lấy danh sách sách của tác giả
        // Điều này phụ thuộc vào logic ứng dụng của bạn
        SearchBookDAO dao = new SearchBookDAO();
        ArrayList<Integer> list = dao.seletctByGenreId(selectedGenre);
        List<BookDetail> books = new ArrayList<>();
        BookDAO bookDAO = new BookDAO();
        for (Integer integer : list) {
            books.add(bookDAO.getBookDetailByID(integer));
        }

        Gson gson = new Gson();
        String jsonResult = gson.toJson(books);

        // Gửi JSON về phía máy khách
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonResult);
    }
        if (languageString!=null) {
            int selectedLanguage = Integer.valueOf(languageString);

        // Xử lý dữ liệu, ví dụ: truy vấn cơ sở dữ liệu để lấy danh sách sách của tác giả
        // Điều này phụ thuộc vào logic ứng dụng của bạn
        SearchBookDAO dao = new SearchBookDAO();
        ArrayList<Integer> list = dao.selectByLanguageId(selectedLanguage);
        List<BookDetail> books = new ArrayList<>();
        BookDAO bookDAO = new BookDAO();
        for (Integer integer : list) {
            books.add(bookDAO.getBookDetailByID(integer));
        }

        Gson gson = new Gson();
        String jsonResult = gson.toJson(books);

        // Gửi JSON về phía máy khách
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonResult);
    }
        if (publisherString!=null) {
            int selectedPublisher = Integer.valueOf(publisherString);

        // Xử lý dữ liệu, ví dụ: truy vấn cơ sở dữ liệu để lấy danh sách sách của tác giả
        // Điều này phụ thuộc vào logic ứng dụng của bạn
        SearchBookDAO dao = new SearchBookDAO();
        ArrayList<Integer> list = dao.selectByPublisherId(selectedPublisher);
        List<BookDetail> books = new ArrayList<>();
        BookDAO bookDAO = new BookDAO();
        for (Integer integer : list) {
            books.add(bookDAO.getBookDetailByID(integer));
        }

        Gson gson = new Gson();
        String jsonResult = gson.toJson(books);

        // Gửi JSON về phía máy khách
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonResult);
    }
        }
        

    // Các phương thức truy vấn cơ sở dữ liệu và chuyển đổi dữ liệu ở đây
}
