package Models.MgrModels;

import java.sql.Timestamp;

/**
 * Write later
 * @author MinhTD
 */
public class BookTransactionMgr {
    private int id;
    private String thumbnail;
    private int bookId;
    private String title;
    private String distributor;
    private int quantity;
    private Timestamp date;
    private int total;
    private String executor;

    public BookTransactionMgr() {
    }

    public BookTransactionMgr(int id, String thumbnail, int bookId, String title, String distributor, int quantity, Timestamp date, int total, String executor) {
        this.id = id;
        this.thumbnail = thumbnail;
        this.bookId = bookId;
        this.title = title;
        this.distributor = distributor;
        this.quantity = quantity;
        this.date = date;
        this.total = total;
        this.executor = executor;
    }

    

    // <editor-fold defaultstate="collapsed" desc="Getters and Setters">
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDistributor() {
        return distributor;
    }

    public void setDistributor(String distributor) {
        this.distributor = distributor;
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

    public String getExecutor() {
        return executor;
    }

    public void setExecutor(String executor) {
        this.executor = executor;
    }
    // </editor-fold>
}
