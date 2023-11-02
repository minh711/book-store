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
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
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
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.List;
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
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        OrderDAO orderDAO = new OrderDAO();
        Order order;
        OrderDetailDao orderDetailDAO = new OrderDetailDao();

        AddressDAO addressDAO = new AddressDAO();
        Address address;

        
        
        //Assume customerID and item list retrieve from session 
        int customerID = 50;
        // Retrieve data from the form
        long currentTimeMillis = System.currentTimeMillis();
        // get data from JSP to create Order object
        Timestamp timestamp = new Timestamp(currentTimeMillis);
        Collection<Part> parts = request.getParts();
        String selectedAddress = "";
        String total = "";
        String saleTotal = "";
        String note = request.getParameter("note");
        String paymentMethod = "";
        
        String jsonList = "";
        for (Part part : parts) {
            String fieldName = part.getName();
            if (fieldName != null) {
                if (fieldName.equals("selectedAddress")) {
                    selectedAddress = getPartValue(part);
                } else if (fieldName.equals("total1Value")) {
                    saleTotal = getPartValue(part);
                } else if (fieldName.equals("totalSaleValue")) {
                    total = getPartValue(part);
                } else if (fieldName.equals("payment-method")) {
                    paymentMethod = getPartValue(part);
                }  
                else if (fieldName.equals("data")){
                    jsonList = getPartValue(part).replace("'", "\"");
                }

                // Handle other form fields here
            }
        }
                 ObjectMapper objectMapper = new ObjectMapper();
        List<OrderItem> orderItems = objectMapper.readValue(jsonList, new TypeReference<List<OrderItem>>() {
        });
        System.out.println("dy nef choi oiwP: "+ orderItems.size());
       
         
        String[] pics = Utilities.FileMethods.UploadPictures(request, "paymentImage", "");
        String picPath = "";
        if (pics.length > 0) {
            picPath = pics[0];
        }
        int saleTotalValue = Integer.parseInt(saleTotal);
        int totalValue = Integer.parseInt(total);
        //----------------------------------- //

        // retrieve more infor from address oject then call AddNew to create Order
        address = addressDAO.getAddressByID(customerID, Integer.parseInt(selectedAddress));
        order = new Order(customerID, saleTotalValue, totalValue, address.getFullName(), address.getPhone(),
                address.getAddress(), paymentMethod.equals("true"), picPath, note, timestamp, customerID);
        orderDAO.AddNew(order);
        ///

        /// get OrderID to insert OrderDetail //
        int LatestID = orderDAO.getLatestOrderID(customerID);

       
        ArrayList<OrderDetail> orderDetails = new ArrayList<>();
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

     response.sendRedirect("orderDetailCustomerCtrl?id=" + LatestID);
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

 


    
 

