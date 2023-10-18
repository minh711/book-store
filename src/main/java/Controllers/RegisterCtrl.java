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
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
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
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            AccountDAO dao = new AccountDAO();
            boolean ifAccountExist = dao.checkExistUserName(username);
            if (ifAccountExist == false) {
                
                boolean ifPhoneExist = dao.checkExistUserSDT(phone);
                if (ifPhoneExist == false) {
                    
                    boolean ifEmailExist = dao.checkExistEmail(email);
                    if (ifEmailExist == false) {
                        dao.addAccountC(fullName, phone, email, gender, birthday, username, password);
                        response.sendRedirect("Views/Customer/Home/Home.jsp");
                    } else {
                        request.setAttribute("mess", "Email này đã được sử dụng");
                        request.getRequestDispatcher("Views/Customer/Authentication/Register.jsp").forward(request, response);
                    }
                    
                } else {
                    request.setAttribute("mess", "Số điện thoại này đã được sử dụng");
                    request.getRequestDispatcher("Views/Customer/Authentication/Register.jsp").forward(request, response);
                }
                
            } else {
                request.setAttribute("mess", "Tên tài khoản đã được sử dụng");
                request.getRequestDispatcher("Views/Customer/Authentication/Register.jsp").forward(request, response);
            }

        } catch (Exception e) {
            Logger.getLogger(RegisterCtrl.class.getName()).log(Level.SEVERE, null, e);
        }
    }

   

}
