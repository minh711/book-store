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
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DuyenLTM
 */
public class ProfileCtrl extends HttpServlet {

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
        AccountDAO accountDAO = new AccountDAO();
        AddressDAO accAddressDAO = new AddressDAO();
        HttpSession session = request.getSession();
        int accountId = (int) session.getAttribute("accountId");
        request.setAttribute("customerId", accountId);
        request.setAttribute("profileDetail", accountDAO.getAccountDetails(accountId));
        request.setAttribute("profileAddress", accAddressDAO.getAll(accountId));
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
            int kq = 0;
            kq = dao.UpdateCustomer(account);
            response.sendRedirect("/Views/Customer/Home/Home.jsp");
        } catch (IOException | NumberFormatException e) {
            Logger.getLogger(ProfileCtrl.class.getName()).log(Level.SEVERE, null, e);
        }
    }
}
