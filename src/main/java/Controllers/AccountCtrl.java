package Controllers;

import DAOs.MgrModelDAOs.AccountDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;

/**
 *
 * @author DuyenLTM
 */
public class AccountCtrl extends HttpServlet {

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
        request.getRequestDispatcher("Views/Admin/Account/AccountCreate.jsp").forward(request, response);
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
        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        Date birthday = Date.valueOf(request.getParameter("birthday"));
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        int roleId = Integer.parseInt(request.getParameter("roleId"));
        AccountDAO account = new AccountDAO();
        int ketqua = account.addAccount(fullName, phone, email, gender, birthday, username, password, roleId);
        if (ketqua == 1) {
            DAOs.DBModelDAOs.AccountDAO accountDAO = new DAOs.DBModelDAOs.AccountDAO();
            request.setAttribute("accountList", accountDAO.getAccounts());
            request.getRequestDispatcher("/Views/Admin/Account/AccountList.jsp").forward(request, response);
        } else {
            response.sendRedirect("/Views/Admin/Account/AccountCreate.jsp");
        }

    }
}
