package Models.DBModels;

import java.sql.Timestamp;

/**
 * Write later
 * @author MinhTD
 */
public class BookTransaction {
    private int id;
    private int executorId; // Account ID of the person perform the book transaction
    private Timestamp date;
    private int total;

    public BookTransaction() {
    }

    public BookTransaction(int id, int executorId, Timestamp date, int total) {
        this.id = id;
        this.executorId = executorId;
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

    public int getExecutorId() {
        return executorId;
    }

    public void setExecutorId(int executorId) {
        this.executorId = executorId;
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
