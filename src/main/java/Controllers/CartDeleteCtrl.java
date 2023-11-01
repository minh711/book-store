package Controllers;

import DAOs.DBModelDAOs.CartDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author nhulnt
 */
public class CartDeleteCtrl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        CartDAO cart = new CartDAO();
        int bookID = Integer.parseInt(request.getParameter("bookId"));
        int customerID = Integer.parseInt(request.getParameter("customerId"));
        cart.RemoveUserCartProduct(customerID, bookID);
        
    }
}
