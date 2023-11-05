package Controllers;

import Utilities.StringMethods;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author MinhTD
 */
public class LogoutCtrl extends HttpServlet {

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Kill cookies
        Cookie ci = new Cookie("accountId", null);
        Cookie cp = new Cookie("password", null);
        Cookie cr = new Cookie("rem", null);
            
        ci.setMaxAge(0);
        cr.setMaxAge(0);
        cp.setMaxAge(0);
        
        ci.setPath("/");
        cr.setPath("/");
        cp.setPath("/");
        
        response.addCookie(ci);
        response.addCookie(cr);
        response.addCookie(cp);
        
        // Kill sessions 
        request.getSession().invalidate();
        
        response.sendRedirect("/Home");
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
    }
}
