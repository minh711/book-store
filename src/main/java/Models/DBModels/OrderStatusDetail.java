package Models.DBModels;

import java.sql.Timestamp;

/**
 * Write later
 * @author MinhTD
 */
public class OrderStatusDetail {
    private int id;
    private Timestamp date;
    private int orderId;
    private int orderStatusId;

    public OrderStatusDetail() {
    }

    public OrderStatusDetail(int id, Timestamp date, int orderId, int orderStatusId) {
        this.id = id;
        this.date = date;
        this.orderId = orderId;
        this.orderStatusId = orderStatusId;
    }

    // <editor-fold defaultstate="collapsed" desc="Getters and Setters">
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
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
    // </editor-fold>
}
