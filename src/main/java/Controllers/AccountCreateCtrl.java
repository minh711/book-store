package Controllers;

import DAOs.DBModelDAOs.AccountDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DuyenLTM
 */
public class AccountCreateCtrl extends HttpServlet {

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
        try {
            String fullName = request.getParameter("fullName");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String gender = request.getParameter("gender");
            Date birthday = Date.valueOf(request.getParameter("birthday"));
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            int roleId = Integer.parseInt(request.getParameter("roleId"));
            AccountDAO account = new AccountDAO();

            boolean checkPhone = account.checkExistedPhone(phone);
            if (checkPhone == false) {
                boolean checkEmail = account.checkExistedEmail(email);
                if (checkEmail == false) {
                    int ketqua = account.addAccount(fullName, phone, email, gender, birthday, username, password, roleId);
                    if (ketqua == 1) {
                        AccountDAO accountDAO = new AccountDAO();
                        request.setAttribute("accountList", accountDAO.getAccounts());
                        request.getRequestDispatcher("/Views/Admin/Account/AccountList.jsp").forward(request, response);
                    } else {
                        request.getRequestDispatcher("Views/Admin/Account/AccountCreate.jsp").forward(request, response);
                    }
                } else {
                    request.setAttribute("error", "Tài khoản đã tồn tại do trùng địa chỉ email");
                    request.getRequestDispatcher("Views/Admin/Account/AccountCreate.jsp").forward(request, response);
                }

            } else {
                request.setAttribute("error", "Tài khoản đã tồn tại do trùng số điện thoại");
                request.getRequestDispatcher("Views/Admin/Account/AccountCreate.jsp").forward(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountCtrl.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
