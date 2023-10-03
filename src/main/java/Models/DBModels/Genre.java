package Models.DBModels;

/**
 * Write later
 * @author MinhTD
 */
public class Genre {
    private int id;
    private String genre;
    private boolean isAvailable;

    public Genre() {
    }

    public Genre(int id, String genre, boolean isAvailable) {
        this.id = id;
        this.genre = genre;
        this.isAvailable = isAvailable;
    }

    // <editor-fold defaultstate="collapsed" desc="Getters and Setters">
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public boolean isIsAvailable() {
        return isAvailable;
    }

    public void setIsAvailable(boolean isAvailable) {
        this.isAvailable = isAvailable;
    }
    // </editor-fold>
}
