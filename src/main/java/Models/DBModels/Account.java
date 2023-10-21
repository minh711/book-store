package Models.DBModels;

import static Utilities.StringMethods.Decrypt;
import java.sql.Date;

/**
 * Write later
 * @author MinhTD
 */
public class Account {
    private int id;
    private String fullName;
    private String phone;
    private String email;
    private String gender;
    private Date birthday;
    private String username;
    private String password;
    private String otp;
    private boolean isAvalable;
    private int roleId;

    public Account() {
    }

    public Account(int id, String fullName, String phone, String email, String gender, Date birthday, String username, String password, String otp, boolean isAvalable, int roleId) {
        this.id = id;
        this.fullName = fullName;
        this.phone = phone;
        this.email = email;
        this.gender = gender;
        this.birthday = birthday;
        this.username = username;
        this.password = password;
        this.otp = otp;
        this.isAvalable = isAvalable;
        this.roleId = roleId;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getOtp() {
        return otp;
    }

    public void setOtp(String otp) {
        this.otp = otp;
    }

    public boolean isIsAvalable() {
        return isAvalable;
    }

    public void setIsAvalable(boolean isAvalable) {
        this.isAvalable = isAvalable;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }
    // </editor-fold>
}
