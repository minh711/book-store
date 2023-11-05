package Controllers;

import DAOs.DBModelDAOs.AccountDAO;
import Models.DBModels.Account;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;

/**
 *
 * @author DuyenLTM
 */
public class AccountListCtrl extends HttpServlet {

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
        if (role != 4) {
            response.sendRedirect("/Home");
            return;
        }
        
        AccountDAO accountDAO = new AccountDAO();
        
//        request.setAttribute("AnalysisList", accountDAO.getAccounts());
        request.setAttribute("accountList", accountDAO.getAccounts());
        request.getRequestDispatcher("/Views/Admin/Account/AccountList.jsp").forward(request, response);
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

    }
}
