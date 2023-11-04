/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.MgrModelDAOs.AccountDAO;
import Utilities.SendEmail;
import jakarta.servlet.RequestDispatcher;
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
public class ResetPasswordCtrl extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        // Input email
        String email = request.getParameter("email");
        if (email != null && !email.equals("")) {
            try {
                RequestDispatcher dispatcher = null;

                HttpSession mySession = request.getSession();
                AccountDAO dao = new AccountDAO();

                boolean ifAccountEmailExist = dao.checkExistEmail(email);
                if (ifAccountEmailExist == true) {
                    SendEmail rePass = new SendEmail(email);//kết nói email của EmailCtrl với SendEmail

                    rePass.sendEmail();//thực hiện gửi email thông qua SendEmail

                    dispatcher = request.getRequestDispatcher("Views/Customer/Authentication/OTP.jsp");
                    request.setAttribute("mess", "Mã OTP đã được gửi đến email của bạn");

                    mySession.setAttribute("email", email);
                    dispatcher.forward(request, response);
//                  Nếu cắt "request.getRequestDispatcher("Views/Customer/Authentication/OTPBookStore.jsp").forward(request, response);"
//                  và cho nội dung vào trước cái forward thì nội dung sẽ được hiện ở trang sau thay vì trang hiện tại
                } else {
                    request.setAttribute("mess", "Email không tồn tại");
                    request.setAttribute("mess2", email);
                    dispatcher = request.getRequestDispatcher("Views/Customer/Authentication/MailOtp.jsp");
                    dispatcher.forward(request, response);
                }
            } catch (ServletException | IOException | SQLException ex) {
                Logger.getLogger(ResetPasswordCtrl.class.getName()).log(Level.SEVERE, null, ex);
            }
        } 
        
        // Cancel Reset
        if (request.getParameter("btnCancel") != null && request.getParameter("btnCancel").equals("Cancel")) {
            try {
                AccountDAO dao = new AccountDAO();
                HttpSession session = request.getSession();
                String sessionEmail = (String) session.getAttribute("email");

                dao.deleteOTP(sessionEmail);

                response.sendRedirect("Views/Customer/Authentication/Login.jsp");
            } catch (SQLException ex) {
                Logger.getLogger(ResetPasswordCtrl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        // Submit OTP
        String action = request.getParameter("action");
        if (action != null) {
            try {
                HttpSession session = request.getSession();
                String value = request.getParameter("otp");

                AccountDAO dao = new AccountDAO();
                String sessionEmail = (String) session.getAttribute("email");

                RequestDispatcher dispatcher = null;
                if ("resetPassword".equals(action)) {
                    if (dao.checkOTPExist(value, sessionEmail) == true) {
                        //check otp
                        request.setAttribute("email", sessionEmail);

                        dao.deleteOTP(sessionEmail);

                        dispatcher = request.getRequestDispatcher("Views/Customer/Authentication/ResetPass.jsp");
                        dispatcher.forward(request, response);
                    } else {

                        request.setAttribute("mess", "sai OTP");

                        dispatcher = request.getRequestDispatcher("Views/Customer/Authentication/OTP.jsp");
                        dispatcher.forward(request, response);
                    }
                } else if ("resendOTP".equals(action)) {
                    SendEmail rePass = new SendEmail(sessionEmail);//kết nói email của EmailCtrl với SendEmail

                    rePass.sendEmail();//thực hiện gửi email thông qua SendEmail

                    request.setAttribute("mess", "Mã OTP đã được gửi lại đến email của bạn");

                    dispatcher = request.getRequestDispatcher("Views/Customer/Authentication/OTP.jsp");
                    dispatcher.forward(request, response);
                }
            } catch (SQLException ex) {
                Logger.getLogger(ResetPasswordCtrl.class.getName()).log(Level.SEVERE, null, ex);
            }
        } 
        
        // Submit new password
        try {
            HttpSession session = request.getSession();
            String rep = request.getParameter("Repass");
            String sessionEmail =(String) session.getAttribute("email");
            
            AccountDAO dao = new AccountDAO();
            
            boolean ifPassTheSame = dao.checkNewPass(sessionEmail,rep);
            if(ifPassTheSame==true){
                request.setAttribute("mess", "Bạn đang nhập mật khẩu cũ, vui lòng nhập lại mật khẩu mới");
                request.getRequestDispatcher("Views/Customer/Authentication/ResetMail.jsp").forward(request, response);
            }
            else{
                dao.updatePass(rep,sessionEmail);
                response.sendRedirect("Views/Customer/Authentication/Login.jsp");
            }
        } catch (ServletException | IOException | SQLException ex) {
            Logger.getLogger(ResetPasswordCtrl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
