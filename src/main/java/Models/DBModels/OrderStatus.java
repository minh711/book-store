package Models.DBModels;

/**
 * Write later
 * @author MinhTD
 */
public class OrderStatus {
    private int id;
    private String status;

    public OrderStatus() {
    }

    public OrderStatus(int id, String status) {
        this.id = id;
        this.status = status;
    }

    // <editor-fold defaultstate="collapsed" desc="Getters and Setters">
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    // </editor-fold>
}
