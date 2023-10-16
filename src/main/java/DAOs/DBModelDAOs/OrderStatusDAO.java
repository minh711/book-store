/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs.DBModelDAOs;

import Models.DBModels.OrderStatus;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PC
 */
public class OrderStatusDAO {
  private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public OrderStatusDAO() {
         conn = DBConnection.DbConnection.getConnection();
    }
   /**
    * @author HienHT
    * get the name of a status
    * @param ID
    * @return 
    */ 
    public String getOrderStatusName(int ID){
        OrderStatus tem = new OrderStatus();
        String sql ="SELECT * FROM [dbo].[OrderStatus] WHERE id =?";
        try{
           ps = conn.prepareStatement(sql);
            ps.setInt(1, ID);
            rs = ps.executeQuery();
            if(rs.next()){
                tem = new OrderStatus(rs.getInt(1), rs.getString(2));
            }
        }
        catch(SQLException ex){
            
         Logger.getLogger(OrderStatusDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return tem.getStatus();
    }
  
   
}
