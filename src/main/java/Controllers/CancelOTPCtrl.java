/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.MgrModelDAOs.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DatNTTce171366
 */
public class CancelOTPCtrl extends HttpServlet {

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            AccountDAO dao = new AccountDAO();
            HttpSession session = request.getSession();
            String email = (String) session.getAttribute("email");

            dao.deleteOTP(email);
            
            response.sendRedirect("Views/Customer/Authentication/Login.jsp");
            
        } catch (SQLException ex) {
            Logger.getLogger(CancelOTPCtrl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

  
}
