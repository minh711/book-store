package Models.DBModels;

/**
 * Write later
 * @author MinhTD
 */
public class Notification {
    private int id;
    private String notifiation;
    private boolean isViewed;
    private int notificationTypeId;

    public Notification() {
    }

    public Notification(int id, String notifiation, boolean isViewed, int notificationTypeId) {
        this.id = id;
        this.notifiation = notifiation;
        this.isViewed = isViewed;
        this.notificationTypeId = notificationTypeId;
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

    public int getNotificationTypeId() {
        return notificationTypeId;
    }

    public void setNotificationTypeId(int notificationTypeId) {
        this.notificationTypeId = notificationTypeId;
    }
    // </editor-fold>
}
