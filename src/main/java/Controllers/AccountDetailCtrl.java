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
public class AccountDetailCtrl extends HttpServlet {

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
        String isAvailString=request.getParameter("isAvailString");
        request.setAttribute("id", id);
        AccountDAO accountDAO = new AccountDAO();
        request.setAttribute("isAvailString", isAvailString);
        request.setAttribute("accountDetail", accountDAO.getAccountDetails(id));
        request.getRequestDispatcher("/Views/Admin/Account/AccountDetail.jsp").forward(request, response);
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
