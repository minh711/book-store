package Controllers;

import DAOs.DBModelDAOs.AccountDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author DuyenLTM
 */
public class AccountDeleteCtrl extends HttpServlet {

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
        HttpSession session = request.getSession();
        int role = (int) session.getAttribute("role");
        if (role != 4) {
            response.sendRedirect("/Home");
            return;
        }
        
        int id = Integer.valueOf(request.getParameter("id"));
        request.setAttribute("id", id);
        AccountDAO accountDAO = new AccountDAO();
        int kq = accountDAO.deleteAccount(id);
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
        String idString=request.getParameter("id");
        int id=Integer.valueOf(idString);
        
        AccountDAO accountDAO = new AccountDAO();
        int kq = accountDAO.recoverAccount(id);
        request.setAttribute("accountList", accountDAO.getAccounts());
        request.getRequestDispatcher("/Views/Admin/Account/AccountList.jsp").forward(request, response);
        
    }
}
