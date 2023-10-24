/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.DBModelDAOs.AddressDAO;
import DAOs.DBModelDAOs.CartDAO;
import DAOs.MgrModelDAOs.OrderItemDAO;
import DAOs.DBModelDAOs.OrderDAO;
import DAOs.DBModelDAOs.OrderDetailDao;
import DAOs.DBModelDAOs.OrderStatusDetailDAO;
import Models.DBModels.Address;
import Models.DBModels.Order;
import Models.DBModels.OrderDetail;
import Models.MgrModels.OrderItem;
import Models.DBModels.OrderStatusDetail;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Part;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.Collection;
import java.util.stream.Collectors;

/**
 * a servlet to handle order creation
 *
 * @author HienHT
 */
@WebServlet("/CreateOrderCtrl")
@MultipartConfig
public class CreateOrderCtrl extends HttpServlet {

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

        OrderItem item1 = new OrderItem(4, "あの花見", 40520, 38990, 21, "hehe.png");
        OrderItem item2 = new OrderItem(5, "ドラえもん ", 33000, 24000, 2, "hehe.png");
        int customerID = 3;
        AddressDAO addressDao = new AddressDAO();
        ArrayList<OrderItem> listItem = new ArrayList<>();
        listItem.add(item1);
        listItem.add(item2);

        try 
        {
            if (listItem.isEmpty() == false)
            {
                request.setAttribute("OrderItems", listItem);
                System.out.println(listItem.get(0).getThumbnail());
                request.setAttribute("addresses", addressDao.getAll(customerID));
                request.getRequestDispatcher("Views/Customer/OrderCreate/createOrder.jsp").forward(request, response);
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
        OrderItem item1 = new OrderItem(4, "あの花見", 40520, 38990, 21, "hehe.png");
        OrderItem item2 = new OrderItem(5, "ドラえもん ", 33000, 24000, 2, "hehe.png");
        int customerID = 3;
        // Retrieve data from the form
        long currentTimeMillis = System.currentTimeMillis();

        // get data from JSP to create Order object
        Timestamp timestamp = new Timestamp(currentTimeMillis);
        Collection<Part> parts = request.getParts();
        String selectedAddress = "";
        String total = "";
        String saleTotal = "";
        String note = "";
        String paymentMethod = "";
        for (Part part : parts) {
            String fieldName = part.getName();
            if (fieldName != null) {
                if (fieldName.equals("selectedAddress")) {
                    selectedAddress = getPartValue(part);

                } else if (fieldName.equals("total1Value")) {
                    saleTotal = getPartValue(part);
                } else if (fieldName.equals("totalSaleValue")) {
                    total = getPartValue(part);
                } else if (fieldName.equals("note")) {
                    note = getPartValue(part);
                } else if (fieldName.equals("payment-method")) {
                    paymentMethod = getPartValue(part);
                }

                // Handle other form fields here
            }
        }
        String[] pics = Utilities.FileMethods.UploadPictures(request, "paymentImage", "");
         String picPath ="";
        if(pics.length>0){
           picPath = pics[0];
        }
        int saleTotalValue = Integer.parseInt(saleTotal);
        int totalValue = Integer.parseInt(total);
        //----------------------------------- //

        // retrieve more infor from address oject then call AddNew to create Order
        address = addressDAO.getAddressByID(customerID, Integer.parseInt(selectedAddress));
        order = new Order(customerID, saleTotalValue, totalValue, address.getFullName(), address.getPhone(),
                address.getAddress(), paymentMethod.equals("true"),picPath , note, timestamp, customerID);
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
        out.println("Address Select: " + selectedAddress);
        out.println("Payment Method: " + paymentMethod);
        out.println("Total: " + total);
        out.println("Sale total: " + saleTotal);
        out.println("note: " + request.getParameter("note"));
        out.println("Address: " + address.getAddress());
        out.println("hinh:" + picPath);
//        out.println("object ne:" + order.getSaleTotal() + " " + order.getTotal() + " " + order.getFullName() + " " + order.getDate() + order.isIsBanking());

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

    private String getPartValue(Part part) throws IOException {
        return new BufferedReader(new InputStreamReader(part.getInputStream()))
                .lines()
                .collect(Collectors.joining("\n"));
    }
}
