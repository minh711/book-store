package Models.DBModels;

import java.sql.Date;
import java.sql.Timestamp;

/**
 * Write later
 * @author MinhTD
 */
public class Rating {
    private int id;
    private int star;
    private String comment;
    private int customerId;
    private int bookId;
    private Timestamp dateRating;

    public Rating() {
    }

    public Rating(int id, int star, String comment,int bookId, int customerId,Timestamp dateRating) {
        this.id = id;
        this.star = star;
        this.comment = comment;
        this.bookId = bookId;
        this.customerId = customerId;
        this.dateRating = dateRating;
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
    
    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }
    
    // </editor-fold>

    public Timestamp getDateRating() {
        return dateRating;
    }

    public void setDateRating(Timestamp dateRating) {
        this.dateRating = dateRating;
    }
}
