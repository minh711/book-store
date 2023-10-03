package Models.DBModels;

/**
 * Write later
 * @author MinhTD
 */
public class NotificationType {
    private int id;
    private String type;

    public NotificationType() {
    }

    public NotificationType(int id, String type) {
        this.id = id;
        this.type = type;
    }
    
    // <editor-fold defaultstate="collapsed" desc="Getters and Setters">
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
    // </editor-fold>
}
