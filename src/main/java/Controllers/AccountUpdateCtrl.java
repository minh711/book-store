package Controllers;

import DAOs.DBModelDAOs.AccountDAO;
import Models.DBModels.Account;
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
public class AccountUpdateCtrl extends HttpServlet {

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
        int id = Integer.valueOf(request.getParameter("id"));
        request.setAttribute("id", id);
        AccountDAO accountDAO = new AccountDAO();
        request.setAttribute("accountDetail", accountDAO.getAccountDetails(id));
        request.getRequestDispatcher("/Views/Admin/Account/AccountUpdate.jsp").forward(request, response);

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
        String formType = request.getParameter("formType");
        if (formType.equals("delete")) {
            AccountDAO accountDao = new AccountDAO();
            int id = Integer.valueOf(request.getParameter("id"));
            request.setAttribute("id", id);
            int result = accountDao.deleteAccount(id);
        } else {
            int id = Integer.valueOf(request.getParameter("id"));
            String fullName = request.getParameter("fullName");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String gender = request.getParameter("gender");
            Date birthday = Date.valueOf(request.getParameter("birthday"));
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            int roleId = Integer.parseInt(request.getParameter("roleId"));
            AccountDAO accountDao = new AccountDAO();
            Account account = new Account(id, fullName, phone, email, gender, birthday, username, password, null, true, roleId);
            int ketqua = accountDao.Update(account);
            if (ketqua == 0) {
                response.sendRedirect("/Views/Admin/Account/AccountUpdate.jsp");
            } else {
                response.sendRedirect("/Account/List");
            }
        }
    }

}
