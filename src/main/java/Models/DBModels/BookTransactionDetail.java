package Models.DBModels;

/**
 * Write later
 * @author MinhTD
 */
public class BookTransactionDetail {
    private int bookTransactionId;
    private int bookId;
    private int distributorId;
    private int quantity;
    private int total;

    public BookTransactionDetail() {
    }

    public BookTransactionDetail(int bookTransactionId, int bookId, int distributorId, int quantity, int total) {
        this.bookTransactionId = bookTransactionId;
        this.bookId = bookId;
        this.distributorId = distributorId;
        this.quantity = quantity;
        this.total = total;
    }

    // <editor-fold defaultstate="collapsed" desc="Getters and Setters">
    public int getBookTransactionId() {
        return bookTransactionId;
    }

    public void setBookTransactionId(int bookTransactionId) {
        this.bookTransactionId = bookTransactionId;
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

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }
    // </editor-fold>
}
