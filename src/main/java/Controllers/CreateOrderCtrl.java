/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.ModelDAOs.AddressDAO;
import DAOs.ModelDAOs.CartDAO;
import DAOs.ModelDAOs.OrderItemDAO;
import DAOs.ModelDAOs.OrderDAO;
import DAOs.ModelDAOs.OrderDetailDao;
import DAOs.ModelDAOs.OrderStatusDetailDAO;
import Models.DBModels.Address;
import Models.DBModels.Order;
import Models.DBModels.OrderDetail;
import Models.MngModels.OrderItem;
import Models.DBModels.OrderStatusDetail;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Timestamp;

/**
 * a servlet to handle order creation
 *
 * @author PC
 */
public class CreateOrderCtrl extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CreateOrderCtrl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateOrderCtrl at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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

        OrderItem item1 = new OrderItem(2, "Gone with the wind", 30000, 27000, 4, "hehe.png");
        OrderItem item2 = new OrderItem(3, "The haunted house ", 45000, 40000, 2, "hehe.png");
        int customerID = 1;
        AddressDAO addressDao = new AddressDAO();
        ArrayList<OrderItem> listItem = new ArrayList<>();
        listItem.add(item1);
        listItem.add(item2);

        try {
            if (listItem.isEmpty() == false) {
                request.setAttribute("OrderItems", listItem);
                System.out.println(listItem.get(0).getThumbnail());
                request.setAttribute("addresses", addressDao.getAll(customerID));
                request.getRequestDispatcher("Views/createOrder/createOrder.jsp").forward(request, response);
            }
        } catch (Exception e) {
            System.out.println(e);
        }

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
        OrderDAO orderDAO = new OrderDAO();
        Order order;
        OrderDetailDao orderDetailDAO = new OrderDetailDao();

        AddressDAO addressDAO = new AddressDAO();
        Address address;
        //Assume customerID and item list retrieve from session 
        OrderItem item1 = new OrderItem(2, "Gone with the wind", 30000, 27000, 4, "hehe.png");
        OrderItem item2 = new OrderItem(3, "The haunted house ", 45000, 40000, 2, "hehe.png");
        int customerID = 1;
        // Retrieve data from the form
        long currentTimeMillis = System.currentTimeMillis();

        // get data from JSP to create Order object
        Timestamp timestamp = new Timestamp(currentTimeMillis);
        String addressSelect = request.getParameter("selectedAddress");
        String paymentMethod = request.getParameter("payment-method");
        int saleTotal = Integer.parseInt(request.getParameter("total1Value"));
        int total = Integer.parseInt(request.getParameter("totalSaleValue"));
        String thumbnailPath = request.getParameter("thumbnailPath");
        String note = request.getParameter("note");
        //----------------------------------- //

        // retrieve more infor from address oject then call AddNew to create Order
        address = addressDAO.getAddressByID(customerID, Integer.parseInt(addressSelect));
        order = new Order(customerID, saleTotal, total, address.getFullName(), address.getPhone(),
                address.getAddress(), paymentMethod.equals("true"), thumbnailPath, note, timestamp, customerID);
        orderDAO.AddNew(order);
        ///

        /// get OrderID to insert OrderDetail //
        int LatestID = orderDAO.getLatestOrderID(customerID);
        ArrayList<OrderItem> orderItems = new ArrayList<>();
        ArrayList<OrderDetail> orderDetails = new ArrayList<>();
        orderItems.add(item1);
        orderItems.add(item2);
        for (OrderItem orderItem : orderItems) {
            orderDetails.add(new OrderDetail(LatestID, orderItem.getBookID(),
                    orderItem.getQuantity(), orderItem.getSalePrice(), orderItem.getPrice()));
        }
        for (OrderDetail orderDetail1 : orderDetails) {
            orderDetailDAO.AddOrderDetails(orderDetail1);
        }
        /// add data to OrderStatusDetail //
        OrderStatusDetail osd = new OrderStatusDetail(0, order.getDate(), LatestID, 1);
        OrderStatusDetailDAO orderStadao = new OrderStatusDetailDAO();
        orderStadao.AddOrderStatusDetail(osd);
        ////

//        /// remove items that are ordered
//        CartDAO cartDAO = new CartDAO();
//        for (int i : id) {
//            cartDAO.RemoveOrderItem(i);
//        }
        PrintWriter out = response.getWriter();
        out.println("Address Select: " + addressSelect);
        out.println("Payment Method: " + paymentMethod);
        out.println("Total: " + total);
        out.println("Sale total: " + saleTotal);
        out.println("note: " + request.getParameter("note"));
        out.println("Address: " + address.getAddress());
        out.println("hinh:" + thumbnailPath);
        out.println("object ne:" + order.getSaleTotal() + " " + order.getTotal() + " " + order.getFullName() + " " + order.getDate() + order.isIsBanking());

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
