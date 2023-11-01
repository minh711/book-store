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
        try {
             HttpSession session = request.getSession();
            String rep = request.getParameter("Repass");
            String email =(String) session.getAttribute("email");
            
            
            AccountDAO dao = new AccountDAO();
            
            boolean ifPassTheSame = dao.checkNewPass(email,rep);
            if(ifPassTheSame==true){
                
                request.setAttribute("mess", "Bạn đang nhập mật khẩu cũ, vui lòng nhập lại mật khẩu mới");
                request.getRequestDispatcher("Views/Customer/Authentication/ResetMail.jsp").forward(request, response);

            }
            else{
                dao.updatePass(rep,email);
                response.sendRedirect("Views/Customer/Authentication/Login.jsp");
            }
            
            
        } catch (Exception ex) {
            Logger.getLogger(LoginCtrl.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
