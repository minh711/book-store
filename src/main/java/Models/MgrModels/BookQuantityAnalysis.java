package Models.MgrModels;

import java.sql.Timestamp;

/**
 *
 * @author NhuLNT
 */
public class BookQuantityAnalysis {
    private int orderId;
    private int bookId;
    private int quantity;
    private int salePrice;
    private int price;
    private Timestamp date;

    public BookQuantityAnalysis(int orderId, int bookId, int quantity, int salePrice, int price, Timestamp date) {
        this.orderId = orderId;
        this.bookId = bookId;
        this.quantity = quantity;
        this.salePrice = salePrice;
        this.price = price;
        this.date = date;
    }

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

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }
}
