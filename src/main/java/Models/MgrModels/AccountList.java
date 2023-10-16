/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models.MgrModels;

/**
 *
 * @author Duyên
 */
public class AccountList {
    private int id;
    private String username;
    private String fullName;
    private String roleName;
    private String isAvailString;

    public AccountList() {
    }
    
    

    public AccountList(int id, String username, String fullName, String roleName, String isAvailString) {
        this.id = id;
        this.username = username;
        this.fullName = fullName;
        this.roleName = roleName;
        this.isAvailString = isAvailString;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getIsAvailString() {
        return isAvailString;
    }

    public void setIsAvailString(String isAvailString) {
        this.isAvailString = isAvailString;
    }
    
    
    
}
