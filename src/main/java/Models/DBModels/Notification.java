package Models.DBModels;

/**
 * Write later
 * @author MinhTD
 */
public class Notification {
    private int id;
    private String notifiation;
    private boolean isViewed;
    private int accountId;

    public Notification() {
    }

    public Notification(int id, String notifiation, boolean isViewed, int accountId) {
        this.id = id;
        this.notifiation = notifiation;
        this.isViewed = isViewed;
        this.accountId = accountId;
    }

    // <editor-fold defaultstate="collapsed" desc="Getters and Setters">
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNotifiation() {
        return notifiation;
    }

    public void setNotifiation(String notifiation) {
        this.notifiation = notifiation;
    }

    public boolean isIsViewed() {
        return isViewed;
    }

    public void setIsViewed(boolean isViewed) {
        this.isViewed = isViewed;
    }
    
    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }
    // </editor-fold>
}
