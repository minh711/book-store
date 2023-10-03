package Models.DBModels;

/**
 * Write later
 * @author MinhTD
 */
public class BookPicture {
    private int id;
    private String picture;
    private int bookId;

    public BookPicture() {
    }

    public BookPicture(int id, String picture, int bookId) {
        this.id = id;
        this.picture = picture;
        this.bookId = bookId;
    }

    // <editor-fold defaultstate="collapsed" desc="Getters and Setters">
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }
    // </editor-fold>
}
