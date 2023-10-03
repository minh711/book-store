package Models.DBModels;

/**
 * Write later
 * @author MinhTD
 */
public class OrderDetail {
    private int orderId;
    private int bookId;
    private int quantity;
    private int salePrice;
    private int price;

    public OrderDetail() {
    }

    public OrderDetail(int orderId, int bookId, int quantity, int salePrice, int price) {
        this.orderId = orderId;
        this.bookId = bookId;
        this.quantity = quantity;
        this.salePrice = salePrice;
        this.price = price;
    }

    // <editor-fold defaultstate="collapsed" desc="Getters and Setters">
    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(int salePrice) {
        this.salePrice = salePrice;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
    // </editor-fold>
}
