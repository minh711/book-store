package Models.DBModels;

/**
 * Write later
 * @author MinhTD
 */
public class Publisher {
    private int id;
    private String publisher;
    private boolean isAvailable;

    public Publisher() {
    }

    public Publisher(int id, String publisher, boolean isAvailable) {
        this.id = id;
        this.publisher = publisher;
        this.isAvailable = isAvailable;
    }

    // <editor-fold defaultstate="collapsed" desc="Getters and Setters">
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public boolean isIsAvailable() {
        return isAvailable;
    }

    public void setIsAvailable(boolean isAvailable) {
        this.isAvailable = isAvailable;
    }
    // </editor-fold>
}
