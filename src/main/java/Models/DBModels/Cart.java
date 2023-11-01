package Models.DBModels;

/**
 * Write later
 * @author MinhTD
 */
public class Cart {
    private int id;
    private int quantity;
    private int bookId;

    public Cart() {
    }

    public Cart(  int id, int quantity, int bookId) {
        this.id = id;
        this.quantity = quantity;
        this.bookId = bookId;
    }

    @Override
    public String toString() {
        return "Cart{" + "id=" + id + ", quantity=" + quantity + ", bookId=" + bookId + '}';
    }

    // <editor-fold defaultstate="collapsed" desc="Getters and Setters">
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

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
    // </editor-fold>
}
