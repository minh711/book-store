package Controllers;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import DAOs.MgrModelDAOs.AccountDAO;
import Models.DBModels.Account;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DatNTTce171366
 */
public class EmailCtrl extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            String email = request.getParameter("email");

            RequestDispatcher dispatcher = null;

            HttpSession mySession = request.getSession();
            AccountDAO dao = new AccountDAO();

            boolean ifAccountEmailExist = dao.checkExistEmail(email);
            if (ifAccountEmailExist == true) {

                RePass rePass = new RePass(email);//kết nói email của EmailCtrl với RePass
                 
                rePass.sendEmail();//thực hiện gửi email thông qua RePass

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

        } catch (Exception ex) {
            Logger.getLogger(LoginCtrl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
