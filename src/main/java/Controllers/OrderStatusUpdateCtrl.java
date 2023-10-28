/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.DBModelDAOs.OrderDAO;
import DAOs.DBModelDAOs.OrderStatusDAO;
import DAOs.DBModelDAOs.OrderStatusDetailDAO;
import DAOs.MgrModelDAOs.OrderItemDAO;
import Models.DBModels.Order;
import Models.DBModels.OrderStatusDetail;
import Models.MgrModels.OrderItem;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import java.util.ArrayList;

/**
 *
 * @author PC
 */
public class OrderStatusUpdateCtrl extends HttpServlet {

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
            out.println("<title>Servlet OrderStatusUpdate</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderStatusUpdate at " + request.getContextPath() + "</h1>");
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
         // create objects
        OrderItemDAO orderItemDao = new OrderItemDAO();
        OrderDAO orderDao = new OrderDAO();
        OrderStatusDetailDAO orderStatusDetailDAO = new OrderStatusDetailDAO();
        OrderStatusDAO orderStatusDAO = new OrderStatusDAO();
        
        
        // suppose the OrderID is retrieve from the request
        int OrderID = Integer.parseInt(request.getParameter("id"));
         request.setAttribute("OrderID", OrderID);
         
         
        
        // get the items of an order and its information
        ArrayList<OrderItem> listItem = orderItemDao.getOrderItemByID(OrderID);
        Order order = orderDao.getOrderByID(OrderID);

        // get the current and previous status
        int currentStatus = orderStatusDetailDAO.getCurrentStatus(OrderID).getOrderStatusId();
        int previousStatus = orderStatusDetailDAO.getPreviousStatus(OrderID).getOrderStatusId();
        String currentStatusName = orderStatusDAO.getOrderStatusName(currentStatus);
        
        
         // set attributes used in JSP
        try {
            if (listItem.isEmpty() == false) {
                request.setAttribute("OrderItems", listItem);
                request.setAttribute("Order", order);
                request.setAttribute("currentStatus", currentStatus);
                request.setAttribute("previousStatus", previousStatus);
                request.setAttribute("currentStatusName", currentStatusName);
                 request.setAttribute("OrderID", OrderID);
                request.getRequestDispatcher("Views/Admin/OrderList/OrderStatusUpdate.jsp").forward(request, response);
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
        // suppose the OrderID is retrieve from the request
       int orderID = Integer.parseInt(request.getParameter("OrderID"));
       int requestingStatus = Integer.parseInt(request.getParameter("statusButton"));
       //  add cancel information 
        OrderStatusDetail orderStatusDetail = new OrderStatusDetail(1, new Timestamp(System.currentTimeMillis()), orderID, requestingStatus);
        OrderStatusDetailDAO orderStatusDetailDAO = new OrderStatusDetailDAO();
        orderStatusDetailDAO.AddOrderStatusDetail(orderStatusDetail);
        response.sendRedirect("OrderStatusUpdate?id=" + orderID);
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
