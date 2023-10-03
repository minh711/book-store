package Models.DBModels;

/**
 * Write later
 * @author MinhTD
 */
public class BookGenre {
    private int bookId;
    private int genreId;

    public BookGenre() {
    }

    public BookGenre(int bookId, int genreId) {
        this.bookId = bookId;
        this.genreId = genreId;
    }

    // <editor-fold defaultstate="collapsed" desc="Getters and Setters">
    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public int getGenreId() {
        return genreId;
    }

    public void setGenreId(int genreId) {
        this.genreId = genreId;
    }
    // </editor-fold>
}
