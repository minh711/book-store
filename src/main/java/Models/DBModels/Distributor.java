package Models.DBModels;

/**
 * Write later
 * @author MinhTD
 */
public class Distributor {
    private int id;
    private String distributor;
    private boolean isAvailable;

    public Distributor() {
    }

    public Distributor(int id, String distributor, boolean isAvailable) {
        this.id = id;
        this.distributor = distributor;
        this.isAvailable = isAvailable;
    }

    // <editor-fold defaultstate="collapsed" desc="Getters and Setters">
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDistributor() {
        return distributor;
    }

    public void setDistributor(String distributor) {
        this.distributor = distributor;
    }

    public boolean isIsAvailable() {
        return isAvailable;
    }

    public void setIsAvailable(boolean isAvailable) {
        this.isAvailable = isAvailable;
    }
    // </editor-fold>
}
