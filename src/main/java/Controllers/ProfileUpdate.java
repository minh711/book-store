package Controllers;

import DAOs.DBModelDAOs.AccountDAO;
import DAOs.DBModelDAOs.AddressDAO;
import DAOs.DBModelDAOs.ProfileDAO;
import Models.DBModels.Account;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DuyenLTM
 */
public class ProfileUpdate extends HttpServlet {

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
        // ở trang nào đó khi nhấn nút muốn chỉnh profile sẽ gửi qua 1 id của account hiện tại
        AccountDAO accountDAO = new AccountDAO();
        AddressDAO accAddressDAO = new AddressDAO();
        request.setAttribute("customerId", 1);
        request.setAttribute("profileDetail", accountDAO.getAccountDetails(1));
        request.setAttribute("profileAddress", accAddressDAO.getAll(1));
        request.getRequestDispatcher("/Views/Customer/ProfileUpdate/ProfileUpdate.jsp").forward(request, response);

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
        try {
            int id = Integer.valueOf(request.getParameter("id"));
            String fullName = request.getParameter("fullName");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String gender = request.getParameter("gender");
            Date birthday = Date.valueOf(request.getParameter("birthday"));
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            ProfileDAO dao = new ProfileDAO();
            Account account = new Account(id, fullName, phone, email, gender, birthday, username, password);
            int kq=0;
            kq=dao.UpdateCustomer(account);
            response.sendRedirect("/Views/Customer/Home/Home.jsp");

        } catch (Exception e) {
            Logger.getLogger(ProfileUpdate.class.getName()).log(Level.SEVERE, null, e);
        }
    }
}
