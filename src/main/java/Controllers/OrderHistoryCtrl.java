package Controllers;

import DAOs.DBModelDAOs.OrderDAO;
import Models.DBModels.Order;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

/**
 *
 * @author HienHT
 */
public class OrderHistoryCtrl extends HttpServlet {

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
        // suppose customerID is retrieve from session
        HttpSession session = request.getSession();
        int customerId = (int) session.getAttribute("accountId");
        
        OrderDAO orderDAO = new OrderDAO();
        ArrayList<Order> orders = orderDAO.getCustomerOrderList(customerId);
        request.setAttribute("orders", orders);
        request.setAttribute("orderDAO", orderDAO);
        request.getRequestDispatcher("/Views/Customer/OrderDetail/OrderHistory.jsp").forward(request, response);
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
