package Models.DBModels;

import java.sql.Timestamp;

/**
 * Write later
 * @author MinhTD
 */
public class Order {
    private int id;
    private int saleTotal;
    private int total;
    private String fullName;
    private String phone;
    private String address;
    private boolean isBanking;
    private String bankingImage;
    private String note;
    private Timestamp date;
    private int customerId;

    public Order() {
    }

    public Order(int id, int saleTotal, int total, String fullName, String phone, String address, boolean isBanking, String bankingImage, String note, Timestamp date, int customerId) {
        this.id = id;
        this.saleTotal = saleTotal;
        this.total = total;
        this.fullName = fullName;
        this.phone = phone;
        this.address = address;
        this.isBanking = isBanking;
        this.bankingImage = bankingImage;
        this.note = note;
        this.date = date;
        this.customerId = customerId;
    }

    // <editor-fold defaultstate="collapsed" desc="Getters and Setters">
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSaleTotal() {
        return saleTotal;
    }

    public void setSaleTotal(int saleTotal) {
        this.saleTotal = saleTotal;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public boolean isIsBanking() {
        return isBanking;
    }

    public void setIsBanking(boolean isBanking) {
        this.isBanking = isBanking;
    }

    public String getBankingImage() {
        return bankingImage;
    }

    public void setBankingImage(String bankingImage) {
        this.bankingImage = bankingImage;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }
    // </editor-fold>
}
