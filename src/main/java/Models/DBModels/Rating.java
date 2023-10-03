package Models.DBModels;

/**
 * Write later
 * @author MinhTD
 */
public class Rating {
    private int id;
    private int star;
    private String comment;
    private int customerId;

    public Rating() {
    }

    public Rating(int id, int star, String comment, int customerId) {
        this.id = id;
        this.star = star;
        this.comment = comment;
        this.customerId = customerId;
    }
    
    // <editor-fold defaultstate="collapsed" desc="Getters and Setters">
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getStar() {
        return star;
    }

    public void setStar(int star) {
        this.star = star;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }
    // </editor-fold>
}
