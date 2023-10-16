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
public class loginServlet extends HttpServlet {

    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       try {
            String user = request.getParameter("name");
            String pass = request.getParameter("pass");
            String rem = request.getParameter("rem");
            AccountDAO dao = new AccountDAO();
            Account a = dao.checkUserName(user);
            //kiểm tra xem user có tồn tại ko
            if(a==null){
                request.setAttribute("mess", "User not exit");
                request.getRequestDispatcher("Views/login/LoginBookStore.jsp").forward(request, response);
            }
            
            else{
            //nếu user có tồn tại thì nhảy qua kiểm tra mật khẩu
            Account b = dao.checkPass(user, pass);
            if (b == null) {
                request.setAttribute("mess", "Wrong password");
                request.getRequestDispatcher("Views/login/LoginBookStore.jsp").forward(request, response);
            } else {

                Cookie cu = new Cookie("user", user);
                Cookie cp = new Cookie("pass", pass);
                Cookie cr = new Cookie("rem", rem);
                if (rem == null) {
                    cu.setMaxAge(0);
                    cr.setMaxAge(0);
                    cp.setMaxAge(0);
                } else {
                    cu.setMaxAge(24 * 60 * 60);
                    cr.setMaxAge(24 * 60 * 60);
                    cp.setMaxAge(24 * 60 * 60);
                }
                response.addCookie(cu);
                response.addCookie(cr);
                response.addCookie(cp);
                HttpSession session = request.getSession();
                response.sendRedirect("Views/login/redirect.jsp");
            }
            }
        } catch (Exception ex) {
              Logger.getLogger(loginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
