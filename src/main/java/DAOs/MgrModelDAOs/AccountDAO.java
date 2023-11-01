/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs.MgrModelDAOs;

import DBConnection.DbConnection;
import Models.DBModels.Account;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author VTOS
 */
public class AccountDAO extends DbConnection {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public AccountDAO() {
        conn = DBConnection.DbConnection.getConnection();
    }

    public int addAccount(String fullName, String phone, String email, String gender, Date birthday, String username, String password, int roleId) {
        int ketqua = 0;
        String sql = "INSERT INTO Account (fullName,phone, email, gender,birthday,username,[password],otp, isAvailable,roleId) VALUES (?,?,?,?,?,?,?,null,1,?)";
        password = Utilities.StringMethods.MD5Hash(password);
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, fullName);
            ps.setString(2, phone);
            ps.setString(3, email);
            ps.setString(4, gender);
            ps.setDate(5, birthday);
            ps.setString(6, username);
            ps.setString(7, password);
            ps.setInt(8, roleId);
            ketqua = ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ketqua;
    }

//==========================================================================================
//Login
//kiểm tra password có đúng hay ko
    public boolean checkPass(String user, String pass) throws SQLException {
        String sql = "SELECT * FROM [dbo].[Account] WHERE username=? AND password=?";
        pass = Utilities.StringMethods.MD5Hash(pass);
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();

            if (rs.next()) {
                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);

        }

        return false;

    }

//kiểm tra tài khoản có tồn taih hay ko
    public boolean checkUserName(String user) throws SQLException {
        String sql = "SELECT * FROM [dbo].[Account] WHERE username=? ";

        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, user);

            rs = ps.executeQuery();

            if (rs.next()) {
                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);

        }

        return false;
    }

//================================================================================================
    //Signup
    public void addAccountC(String fullName, String phone, String email, String gender, Date birthday, String username, String password) throws SQLException {

        String sql = "INSERT INTO Account (fullName,phone, email, gender,birthday,username,[password],otp, isAvailable,roleId) VALUES (?,?,?,?,?,?,?,null,1,1)";
        password = Utilities.StringMethods.MD5Hash(password);
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, fullName);
            ps.setString(2, phone);
            ps.setString(3, email);
            ps.setString(4, gender);
            ps.setDate(5, birthday);
            ps.setString(6, username);
            ps.setString(7, password);

            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public boolean checkExistUserSDT(String phone) throws SQLException {
        String sql = "SELECT * FROM [dbo].[Account] WHERE phone=? ";

        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, phone);

            rs = ps.executeQuery();

            if (rs.next()) {
                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);

        }

        return false;
    }

    public boolean checkExistEmail(String email) throws SQLException {
        String sql = "SELECT * FROM [dbo].[Account] WHERE email=? ";

        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);

            rs = ps.executeQuery();

            if (rs.next()) {
                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);

        }

        return false;
    }

    public Account checkUserByName(String user) {
        String sql = "SELECT * FROM [dbo].[Account] WHERE username=? ";

        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, user);

            rs = ps.executeQuery();

            if (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getDate(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getBoolean(10), rs.getInt(11));
            }

        } catch (Exception e) {
        }
        return null;
    }

    //==========================================================================
    //thấy đổi pass
    public void updatePass(String pass, String email) throws SQLException {

        String sql = "UPDATE [dbo].[Account]\n"
                + "   SET \n"
                + "      [password]=?\n"
                + "      \n"
                + " WHERE email=?";
        pass = Utilities.StringMethods.MD5Hash(pass);
        try {
            ps = conn.prepareStatement(sql);

            ps.setString(1, pass);
            ps.setString(2, email);
            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    //kiểm tra password có đúng hay ko
    public boolean checkNewPass(String email, String pass) throws SQLException {
        String sql = "SELECT * FROM [dbo].[Account] WHERE email=? AND password=?";
        pass = Utilities.StringMethods.MD5Hash(pass);
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, pass);
            rs = ps.executeQuery();

            if (rs.next()) {
                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);

        }

        return false;

    }

    public boolean checkOTPExist(String otp, String email) throws SQLException {
        String sql = "SELECT * FROM [dbo].[Account] WHERE otp=? AND email=?";

        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, otp);
            ps.setString(2, email);
            rs = ps.executeQuery();

            if (rs.next()) {
                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);

        }

        return false;

    }

    public void updateOTP(String otp, String email) throws SQLException {

        String sql = "UPDATE [dbo].[Account]\n"
                + "   SET \n"
                + "      [otp]=?\n"
                + "      \n"
                + " WHERE email=?";

        try {
            ps = conn.prepareStatement(sql);

            ps.setString(1, otp);
            ps.setString(2, email);
            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void deleteOTP(String email) throws SQLException {

        String sql = "UPDATE [dbo].[Account]\n"
                + "   SET \n"
                + "      otp=null\n"
                + "      \n"
                + " WHERE email=?";

        try {
            ps = conn.prepareStatement(sql);

            ps.setString(1, email);
            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
