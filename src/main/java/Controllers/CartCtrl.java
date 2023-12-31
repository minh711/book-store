/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.DBModelDAOs.AddressDAO;
import DAOs.DBModelDAOs.BookDAO;
import DAOs.DBModelDAOs.CartDAO;
import Models.DBModels.Cart;
import Models.MgrModels.BookDetail;
import Models.MgrModels.OrderItem;
import Models.MgrModels.UserCartDetail;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author mummykiara
 */
public class CartCtrl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        int id = (int) session.getAttribute("accountId");
        CartDAO cart = new CartDAO();
        BookDAO book = new BookDAO();
        BookDetail b;
        
        ArrayList<BookDetail> bookDetailList = new ArrayList<>();
        
        try {
            ArrayList<UserCartDetail> list = cart.GetUserCartDetailByID(id);
            for (UserCartDetail c : list) {
                bookDetailList.add(book.getBookDetailByID(c.getBookid()));
            }
            if (!list.isEmpty()) {
                request.setAttribute("CartList", list);
                request.setAttribute("BookList", bookDetailList);
//                request.getRequestDispatcher("Views/Customer/Cart/Cart.jsp").forward(request, response);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        request.getRequestDispatcher("Views/Customer/Cart/Cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Submit 
        if (request.getParameter("btnSubmit") != null && !request.getParameter("btnSubmit").equals("")) {
            List<OrderItem> orderlist = new ArrayList<>();
            BookDAO book = new BookDAO();
            BookDetail b;

            String[] bookIds = request.getParameterValues("bookIds");
            String[] customerIds = request.getParameterValues("customerIds");
            String[] quantities = request.getParameterValues("quantities");

            HttpSession session = request.getSession();
            int customerID = (int) session.getAttribute("accountId");
            AddressDAO addressDao = new AddressDAO();

            try {
                for (int i = 0; i < bookIds.length; i++) {
                    String bookId = bookIds[i];
                    String quantity = quantities[i];

                    int bookID = Integer.parseInt(bookId);

                    int bookQuantity = Integer.parseInt(quantity);
                    b = book.getBookDetailByID(bookID);
                    orderlist.add(new OrderItem(b.getId(), b.getTitle(), b.getPrice(), b.getSalePrice(), bookQuantity, b.getThumbnail()));
                }
                
                ObjectMapper objectMapper = new ObjectMapper();
                String jsonList = objectMapper.writeValueAsString(orderlist);
                request.setAttribute("jsonList", jsonList.replace("\"", "'"));
                request.setAttribute("OrderItems", orderlist);
                request.setAttribute("addresses", addressDao.getAll(customerID));
                request.getRequestDispatcher("Views/Customer/OrderCreate/createOrder.jsp").forward(request, response);
            } catch (NumberFormatException e) {}
        }

        // Get Cart items
        String cItems = request.getParameter("jsonData");
        if (cItems != null && !cItems.equals("")) {
            System.out.println(cItems);
            ObjectMapper objectMapper = new ObjectMapper();
            Cart[] cartItems = objectMapper.readValue(cItems, Cart[].class);

            CartDAO cart = new CartDAO();
            for (Cart item : cartItems) {
                ArrayList<Cart> oldCart = cart.GetCartByID(item.getCustomerId(), item.getBookId());
                int diff = oldCart.get(0).getQuantity() - item.getQuantity();
                System.out.println("Old: " + oldCart.get(0).getQuantity());
                System.out.println("New: " + item.getQuantity());
                System.out.println("Diff: " + diff);
                BookDAO bookDAO = new BookDAO();
                bookDAO.updateQuantity(item.getBookId(), diff);
                cart.UpdateCart(item.getQuantity(), item.getCustomerId(), item.getBookId());
            }
        }
        
        // Delele Cart item
        if (request.getParameter("isDeleteCartItem") != null && request.getParameter("isDeleteCartItem").equals("true")) {
            CartDAO cart = new CartDAO();
            int bookID = Integer.parseInt(request.getParameter("bookId"));
            int customerID = Integer.parseInt(request.getParameter("customerId"));
            ArrayList<Cart> cartItem = cart.GetCartByID(customerID, bookID);
            BookDAO bookDAO = new BookDAO();
            bookDAO.updateQuantity(bookID, cartItem.get(0).getQuantity());
            cart.RemoveUserCartProduct(customerID, bookID);
        }
    }
}
