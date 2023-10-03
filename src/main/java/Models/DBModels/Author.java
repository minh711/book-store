package Models.DBModels;

/**
 * Write later
 * @author MinhTD
 */
public class Author {
    private int id;
    private String author;
    private boolean isAvailable;

    public Author() {
    }

    public Author(int id, String author, boolean isAvailable) {
        this.id = id;
        this.author = author;
        this.isAvailable = isAvailable;
    }

    // <editor-fold defaultstate="collapsed" desc="Getters and Setters">
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public boolean isIsAvailable() {
        return isAvailable;
    }

    public void setIsAvailable(boolean isAvailable) {
        this.isAvailable = isAvailable;
    }
    // </editor-fold>
}
