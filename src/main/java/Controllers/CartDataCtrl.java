/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.DBModelDAOs.CartDAO;
import Models.DBModels.Cart;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;
import java.io.BufferedReader;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author NhuLNT
 */
public class CartDataCtrl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CartDAO cart = new CartDAO();
        
        String cItems = request.getParameter("cartItems");
        System.out.println(cItems);
        ObjectMapper objectMapper = new ObjectMapper();
        Cart[] cartItems = objectMapper.readValue(cItems, Cart[].class);

        for (Cart item : cartItems) {
            System.out.println(item.toString());
        }

        response.getWriter().write("Data received and processed successfully.");
    }

}
