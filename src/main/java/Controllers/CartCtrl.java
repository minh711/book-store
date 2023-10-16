/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.DBModelDAOs.CartDAO;
import Models.MgrModels.UserCartDetail;
import java.io.IOException;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author mummykiara
 */
public class CartCtrl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = 1;
        CartDAO cart = new CartDAO();
        try {
            ArrayList<UserCartDetail> list = cart.GetCartByID(id);
            
            if (!list.isEmpty()) {
                request.setAttribute("CartList", list);
                request.getRequestDispatcher("Views/Cart/Cart.jsp").forward(request, response);
            }
        } catch (IOException | ServletException e) {
            System.out.println(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

}
