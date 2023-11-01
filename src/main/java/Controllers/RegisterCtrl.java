/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.MgrModelDAOs.AccountDAO;
import Models.DBModels.Account;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DatNTTce171366
 */
public class RegisterCtrl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("Views/Customer/Authentication/Register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String fullName = request.getParameter("fullName");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String gender = request.getParameter("gender");
            Date birthday = Date.valueOf(request.getParameter("birthday"));
            String user = request.getParameter("username");
            String password = request.getParameter("password");
            String password2 = request.getParameter("resetPWD");
            AccountDAO dao = new AccountDAO();
            boolean ifAccountExist = dao.checkUserName(user);
            if (ifAccountExist == false) {

                boolean ifPhoneExist = dao.checkExistUserSDT(phone);
                if (ifPhoneExist == false) {

                    boolean ifEmailExist = dao.checkExistEmail(email);
                    if (ifEmailExist == false) {
                        dao.addAccountC(fullName, phone, email, gender, birthday, user, password);

                        HttpSession session = request.getSession();
                        Account newAccount = dao.checkUserByName(user);

                        session.setAttribute("accountId", newAccount.getId());
                        Cookie cId = new Cookie("accountId", newAccount.getId() + "");
                        cId.setMaxAge(3 * 24 * 60 * 60);
                        response.addCookie(cId);

                        session.setAttribute("role", newAccount.getRoleId());
                        Cookie crd = new Cookie("role", newAccount.getRoleId() + "");
                        crd.setMaxAge(3 * 24 * 60 * 60);
                        response.addCookie(crd);

                        session.setAttribute("role", newAccount.getUsername());
                        Cookie usn = new Cookie("username", newAccount.getUsername());
                        crd.setMaxAge(3 * 24 * 60 * 60);
                        response.addCookie(usn);

                        session.setAttribute("password", newAccount.getPassword());
                        Cookie psw = new Cookie("password", newAccount.getPassword());
                        crd.setMaxAge(3 * 24 * 60 * 60);
                        response.addCookie(psw);

                        response.sendRedirect("/Home");
                    } else {
                        request.setAttribute("messE", "Email này đã được sử dụng");
                        request.setAttribute("mess2", fullName);
                        request.setAttribute("mess3", phone);
                        request.setAttribute("mess4", email);
                        request.setAttribute("mess5", user);
                        request.setAttribute("mess6", password);
                        request.setAttribute("mess7", password2);
                        request.setAttribute("mess8", birthday);
                        request.setAttribute("mess9", gender);
                        request.getRequestDispatcher("Views/Customer/Authentication/Register.jsp").forward(request, response);
                    }

                } else {
                    request.setAttribute("messP", "Số điện thoại này đã được sử dụng");
                    request.setAttribute("mess2", fullName);
                    request.setAttribute("mess3", phone);
                    request.setAttribute("mess4", email);
                    request.setAttribute("mess5", user);
                    request.setAttribute("mess6", password);
                    request.setAttribute("mess7", password2);
                    request.setAttribute("mess8", birthday);
                    request.setAttribute("mess9", gender);
                    request.getRequestDispatcher("Views/Customer/Authentication/Register.jsp").forward(request, response);
                }

            } else {
                request.setAttribute("messU", "Tên tài khoản đã được sử dụng");
                request.setAttribute("mess2", fullName);
                request.setAttribute("mess3", phone);
                request.setAttribute("mess4", email);
                request.setAttribute("mess5", user);
                request.setAttribute("mess6", password);
                request.setAttribute("mess7", password2);
                request.setAttribute("mess8", birthday);
                request.setAttribute("mess9", gender);
                request.getRequestDispatcher("Views/Customer/Authentication/Register.jsp").forward(request, response);
            }

        } catch (Exception e) {
            Logger.getLogger(RegisterCtrl.class.getName()).log(Level.SEVERE, null, e);
        }
    }

}
