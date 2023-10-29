/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.MgrModelDAOs.AccountDAO;
import Models.DBModels.Account;
import com.google.gson.Gson;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
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
            String user = request.getParameter("name");
            String pass = request.getParameter("pass");
            String rem = request.getParameter("rem");
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
                    request.setAttribute("mess", "Sai mật khẩu");
                    request.setAttribute("mess2", user);
                    request.setAttribute("mess3", pass);
                    request.getRequestDispatcher("Views/Customer/Authentication/Login.jsp").forward(request, response);
                } else {
                    Cookie cu = new Cookie("user", user);
                    Cookie cp = new Cookie("pass", pass);
                    Cookie cr = new Cookie("rem", rem);
                    if (rem == null) {
                        cu.setMaxAge(0);
                        cr.setMaxAge(0);
                        cp.setMaxAge(0);
                    } else {
                        cu.setMaxAge(3 * 24 * 60 * 60);
                        cr.setMaxAge(3 * 24 * 60 * 60);
                        cp.setMaxAge(3 * 24 * 60 * 60);
                        //3 ngày * 24 gio * 60 phut * 60 giay
                    }
                    response.addCookie(cu);
                    response.addCookie(cr);
                    response.addCookie(cp);
                    HttpSession session = request.getSession();

                    session.setAttribute("accountId", ifAccountExist.getId());
                    session.setAttribute("role", ifAccountExist.getRoleId());

                    Cookie cId = new Cookie("accountId", ifAccountExist.getId() + "");
                    cId.setMaxAge(3 * 24 * 60 * 60);
                    response.addCookie(cId);

                    Cookie crd = new Cookie("role", ifAccountExist.getRoleId() + "");
                    crd.setMaxAge(3 * 24 * 60 * 60);
                    response.addCookie(crd);

                    Cookie usn = new Cookie("username", ifAccountExist.getUsername());
                    crd.setMaxAge(3 * 24 * 60 * 60);
                    response.addCookie(usn);
                    
                    Cookie psw = new Cookie("password", ifAccountExist.getPassword());
                    crd.setMaxAge(3 * 24 * 60 * 60);
                    response.addCookie(psw);
                    
                    

// COOKIE USER NAME /PASS
                    response.sendRedirect("Views/Customer/Home/Home.jsp");
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(LoginCtrl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
