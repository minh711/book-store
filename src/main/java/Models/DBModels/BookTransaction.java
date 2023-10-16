package Models.DBModels;

import java.sql.Timestamp;

/**
 * Write later
 * @author MinhTD
 */
public class BookTransaction {
    private int id;
    private int bookId;
    private int distributorId;
    private int executorId; // Account ID of the person perform the book transaction
    private int quantity;
    private Timestamp date;
    private int total;

    public BookTransaction() {
    }

    public BookTransaction(int id, int bookId, int distributorId, int executorId, int quantity, Timestamp date, int total) {
        this.id = id;
        this.bookId = bookId;
        this.distributorId = distributorId;
        this.executorId = executorId;
        this.quantity = quantity;
        this.date = date;
        this.total = total;
    }

    // <editor-fold defaultstate="collapsed" desc="Getters and Setters">
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

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

    public int getExecutorId() {
        return executorId;
    }

    public void setExecutorId(int executorId) {
        this.executorId = executorId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }
    // </editor-fold>
}
