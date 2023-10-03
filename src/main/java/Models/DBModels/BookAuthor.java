package Models.DBModels;

/**
 * Write later
 * @author MinhTD
 */
public class BookAuthor {
    private int bookId;
    private int authorId;

    public BookAuthor() {
    }

    public BookAuthor(int bookId, int authorId) {
        this.bookId = bookId;
        this.authorId = authorId;
    }
    
    // <editor-fold defaultstate="collapsed" desc="Getters and Setters">
    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public int getAuthorId() {
        return authorId;
    }

    public void setAuthorId(int authorId) {
        this.authorId = authorId;
    }
    // </editor-fold>
}
