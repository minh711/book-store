/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.MgrModelDAOs.AccountDAO;
import Models.DBModels.Account;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DatNTTce171366
 */
public class OTPCtrl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
            
            System.out.println("thanh cong");
            HttpSession session = request.getSession();
            String action = request.getParameter("action");
            String value = request.getParameter("otp");

            AccountDAO dao = new AccountDAO();
            String email = (String) session.getAttribute("email");

            System.out.println("email: " + email);
            System.out.println("OTP received: " + value);

            RequestDispatcher dispatcher = null;
            if ("resetPassword".equals(action)) {

                if (dao.checkOTPExist(value,email) == true) {
                    //check otp
                    
                  
                    request.setAttribute("email", email);

                    dao.deleteOTP(email);

                    dispatcher = request.getRequestDispatcher("Views/Customer/Authentication/ResetPass.jsp");
                    dispatcher.forward(request, response);

                } else {

                    request.setAttribute("mess", "sai OTP");

                    dispatcher = request.getRequestDispatcher("Views/Customer/Authentication/OTP.jsp");
                    dispatcher.forward(request, response);

                }
            } else if ("resendOTP".equals(action)) {

                RePass rePass = new RePass(email);//kết nói email của EmailCtrl với RePass

                rePass.sendEmail();//thực hiện gửi email thông qua RePass

                request.setAttribute("mess", "Mã OTP đã được gửi lại đến email của bạn");

                dispatcher = request.getRequestDispatcher("Views/Customer/Authentication/OTP.jsp");
                dispatcher.forward(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OTPCtrl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
