package Models.DBModels;

/**
 * Write later
 * @author MinhTD
 */
public class Cart {
    private int quantity;
    private int bookId;
    private int customerId;

    public Cart() {
    }

    public Cart(int quantity, int bookId, int customerId) {
        this.quantity = quantity;
        this.bookId = bookId;
        this.customerId = customerId;
    }

    // <editor-fold defaultstate="collapsed" desc="Getters and Setters">
    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }
    // </editor-fold>
}
