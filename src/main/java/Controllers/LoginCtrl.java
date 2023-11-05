/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.MgrModelDAOs.AccountDAO;
import Models.DBModels.Account;
import Utilities.StringMethods;
import com.google.gson.Gson;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DatNTTce171366
 */
public class LoginCtrl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/Views/Customer/Authentication/Login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            String user = request.getParameter("name");
            String pass = request.getParameter("pass");
            String rem = request.getParameter("rem");
            String email = (String) session.getAttribute("email");
            AccountDAO dao = new AccountDAO();

            Account ifAccountExist = dao.checkUserByName(user);
            //kiểm tra xem user có tồn tại ko
            if (ifAccountExist == null) {

                request.setAttribute("mess", "Tài khoản không tồn tại");
                request.setAttribute("mess2", user);
                request.setAttribute("mess3", pass);
                request.getRequestDispatcher("Views/Customer/Authentication/Login.jsp").forward(request, response);

            } else {
                //nếu user có tồn tại thì nhảy qua kiểm tra mật khẩu
                boolean ifPasswordCorrect = dao.checkPass(user, pass);
                if (ifPasswordCorrect == false) {
                    request.setAttribute("mess3_1", "Sai mật khẩu");
                    request.setAttribute("mess2", user);
                    request.setAttribute("mess3", pass);
                    request.getRequestDispatcher("Views/Customer/Authentication/Login.jsp").forward(request, response);
                } else {
                    Cookie ci = new Cookie("accountId", ifAccountExist.getId() + "");
                    Cookie cp = new Cookie("password", StringMethods.MD5Hash(pass));
                    Cookie cr = new Cookie("rem", rem);
                    if (rem == null) {
                        ci.setMaxAge(0);
                        cr.setMaxAge(0);
                        cp.setMaxAge(0);
                    } else {
                        ci.setMaxAge(3 * 24 * 60 * 60);
                        cr.setMaxAge(3 * 24 * 60 * 60);
                        cp.setMaxAge(3 * 24 * 60 * 60);
                        //3 ngày * 24 gio * 60 phut * 60 giay
                    }
                    response.addCookie(ci);
                    response.addCookie(cr);
                    response.addCookie(cp);
                    
                    int role = ifAccountExist.getRoleId();
                    
                    session.setAttribute("accountId", ifAccountExist.getId());
                    session.setAttribute("role", role);
                    session.setAttribute("username", ifAccountExist.getUsername());
                    
                    switch (role) {
                        case 1: // Customer
                            response.sendRedirect("/Home");
                            break;
                        case 2: // Book Manager
                            response.sendRedirect("/Manager/Book/List");
                            break;
                        case 3: // Order Manager
                            response.sendRedirect("/Manager/Order/List");
                            break;
                        case 4: // Admin
                            response.sendRedirect("/Manager/Report");
                            break;
                    }
                }
            }
        } catch (ServletException | IOException | SQLException ex) {
            Logger.getLogger(LoginCtrl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
