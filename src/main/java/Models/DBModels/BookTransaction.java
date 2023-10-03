package Models.DBModels;

import java.sql.Timestamp;

/**
 * Write later
 * @author MinhTD
 */
public class BookTransaction {
    private int bookId;
    private int distributorId;
    private int excutorId;
    private int quantiy;
    private Timestamp date;

    public BookTransaction() {
    }

    public BookTransaction(int bookId, int distributorId, int excutorId, int quantiy, Timestamp date) {
        this.bookId = bookId;
        this.distributorId = distributorId;
        this.excutorId = excutorId;
        this.quantiy = quantiy;
        this.date = date;
    }

    // <editor-fold defaultstate="collapsed" desc="Getters and Setters">
    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public int getDistributorId() {
        return distributorId;
    }

    public void setDistributorId(int distributorId) {
        this.distributorId = distributorId;
    }

    public int getExcutorId() {
        return excutorId;
    }

    public void setExcutorId(int excutorId) {
        this.excutorId = excutorId;
    }

    public int getQuantiy() {
        return quantiy;
    }

    public void setQuantiy(int quantiy) {
        this.quantiy = quantiy;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }
    // </editor-fold>
}
