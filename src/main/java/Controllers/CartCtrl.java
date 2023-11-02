/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.DBModelDAOs.AddressDAO;
import DAOs.DBModelDAOs.BookDAO;
import DAOs.DBModelDAOs.CartDAO;
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
import java.util.List;

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
                request.getRequestDispatcher("Views/Customer/Cart/Cart.jsp").forward(request, response);
            }
        } catch (IOException | ServletException e) {
            System.out.println(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<OrderItem> orderlist = new ArrayList<>();
        BookDAO book = new BookDAO();
        BookDetail b;
        
        String[] bookIds = request.getParameterValues("bookIds");
        String[] customerIds = request.getParameterValues("customerIds");
        String[] quantities = request.getParameterValues("quantities");
        
        int customerID = 1;
        AddressDAO addressDao = new AddressDAO();

        try {
            for (int i = 0; i < bookIds.length; i++) {
                String bookId = bookIds[i];
                String quantity = quantities[i];

                int bookID = Integer.parseInt(bookId);

                int bookQuantity = Integer.parseInt(quantity);
                b = book.getBookDetailByID(bookID);
                orderlist.add(new OrderItem(b.getId(), b.getTitle(), b.getPrice(), b.getSalePrice(), bookQuantity, b.getThumbnail()));

                ObjectMapper objectMapper = new ObjectMapper();
                String jsonList = objectMapper.writeValueAsString(orderlist);              
                request.setAttribute("jsonList", jsonList.replace("\"", "'"));
                request.setAttribute("OrderItems", orderlist);
                request.setAttribute("addresses", addressDao.getAll(customerID));
                request.getRequestDispatcher("Views/Customer/OrderCreate/createOrder.jsp").forward(request, response);
            }
            
             

        } catch (NumberFormatException e) {

        }
    }
}
