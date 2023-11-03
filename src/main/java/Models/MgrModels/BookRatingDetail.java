/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models.MgrModels;

import java.sql.Timestamp;

/**
 *
 * @author mummykiara
 */
public class BookRatingDetail {
    private int id;
    private String Name;
    private int star;
    private String comment;
    private int customerId;
    private int bookId;
    private Timestamp dateRating;

    public BookRatingDetail(int id, String Name, int star, String comment, int customerId, int bookId, Timestamp dateRating) {
        this.id = id;
        this.Name = Name;
        this.star = star;
        this.comment = comment;
        this.customerId = customerId;
        this.bookId = bookId;
        this.dateRating = dateRating;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
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

    public Timestamp getDateRating() {
        return dateRating;
    }

    public void setDateRating(Timestamp dateRating) {
        this.dateRating = dateRating;
    }
    
    
}
