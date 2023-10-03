package Models.DBModels;

/**
 * Write later
 * @author MinhTD
 */
public class Language {
    private int id;
    private String language;
    private boolean isAvailable;

    public Language() {
    }

    public Language(int id, String language, boolean isAvailable) {
        this.id = id;
        this.language = language;
        this.isAvailable = isAvailable;
    }

    // <editor-fold defaultstate="collapsed" desc="Getters and Setters">
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public boolean isIsAvailable() {
        return isAvailable;
    }

    public void setIsAvailable(boolean isAvailable) {
        this.isAvailable = isAvailable;
    }
    // </editor-fold>
}
