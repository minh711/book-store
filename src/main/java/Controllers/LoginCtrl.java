/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controllers;

import DAOs.MgrModelDAOs.AccountDAO;
import Models.DBModels.Account;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
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
            boolean ifAccountExist = dao.checkUserName(user);
            //kiểm tra xem user có tồn tại ko
            if(ifAccountExist==false){
                request.setAttribute("mess", "User not exit");
                request.getRequestDispatcher("/Views/Customer/Authentication/Login.jsp").forward(request, response);
            }
            
            else{
            //nếu user có tồn tại thì nhảy qua kiểm tra mật khẩu
            boolean ifPasswordCorrect = dao.checkPass(user, pass);
            if (ifPasswordCorrect == false) {
                request.setAttribute("mess", "Wrong password");
                request.getRequestDispatcher("/Views/Customer/Authentication/Login.jsp").forward(request, response);
            } else {

              
                response.sendRedirect("/Views/Customer/Home/Home.jsp");
            }
            }
        } catch (Exception ex) {
              Logger.getLogger(LoginCtrl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
