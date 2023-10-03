package Models.DBModels;

/**
 * Write later
 * @author MinhTD
 */
public class Address {
    private int id;
    private String fullName;
    private String phone;
    private String address;
    private int customerId;

    public Address() {
    }

    public Address(int id, String fullName, String phone, String address, int customerId) {
        this.id = id;
        this.fullName = fullName;
        this.phone = phone;
        this.address = address;
        this.customerId = customerId;
    }

    // <editor-fold defaultstate="collapsed" desc="Getters and Setters">
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }
    // </editor-fold>
}
