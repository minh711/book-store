/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models.MgrModels;

/**
 *
 * @author PC
 */
public class OrderStatusDetailsName {

    private int orderStatusDetailId;
    private int orderId;
    private int orderStatusId;
    private String statusName;

    public OrderStatusDetailsName() {
    }

    public OrderStatusDetailsName(int orderStatusDetailId, int orderId, int orderStatusId, String statusName) {
        this.orderStatusDetailId = orderStatusDetailId;
        this.orderId = orderId;
        this.orderStatusId = orderStatusId;
        this.statusName = statusName;
    }

    public int getOrderStatusDetailId() {
        return orderStatusDetailId;
    }

    public void setOrderStatusDetailId(int orderStatusDetailId) {
        this.orderStatusDetailId = orderStatusDetailId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getOrderStatusId() {
        return orderStatusId;
    }

    public void setOrderStatusId(int orderStatusId) {
        this.orderStatusId = orderStatusId;
    }

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }
    
    
}
