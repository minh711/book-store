/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO.DBModels;

import DBConnection.DbConnection;
import Models.DBModels.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DatNTT
 */
public class signupDAO extends DbConnection {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public signupDAO() {
        conn = DBConnection.DbConnection.getConnection();
    }

    public void signup(String fullname, String phone, String email, String user, String pass, String gt, String sn) {
        String query = "INSERT INTO [dbo].[Account]\n"
                + "           ([fullName]\n"
                + "           ,[phone]\n"
                + "           ,[email]\n"
                + "           ,[gender]\n"
                + "           ,[birthday]\n"
                + "           ,[username]\n"
                + "           ,[password]\n"
                + "           ,[otp]\n"
                + "           ,[isAvailable]\n"
                + "           ,[roleId])\n"
                + "     VALUES\n"
                + "           (<fullName, nvarchar(100),>\n"
                + "           ,<phone, varchar(11),>\n"
                + "           ,<email, varchar(100),>\n"
                + "           ,<gender, nvarchar(5),>\n"
                + "           ,<birthday, date,>\n"
                + "           ,<username, varchar(50),>\n"
                + "           ,<password, varchar(32),>\n"
                + "           ,<otp, varchar(6),>\n"
                + "           ,<isAvailable, bit,>\n"
                + "           ,<roleId, int,>)";
        pass = Utilities.MD5Hash.MD5Hash(pass);
        try {
            PreparedStatement ds = conn.prepareStatement(query);

            ds.setString(1, fullname);
            ds.setString(2, phone);
            ds.setString(3, email);
            ds.setString(4, gt);
            ds.setString(5, sn);

            ds.setString(6, user);

            ds.setString(7, pass);

            ds.executeUpdate();
            // sử dụng khi ko có kết quả trả về
        } catch (Exception ex) {
            Logger.getLogger(signupDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public Account checkExist(String user) {
        String query = "SELECT * FROM [dbo].[Account] WHERE username=?;";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, user);

            ResultSet rs = ps.executeQuery();
            //chỉ sử dụng khi có kết quả trả về từ sql
            if (rs.next()) {

                return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getDate(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getBoolean(10), rs.getInt(11));

            }

        } catch (Exception ex) {
            Logger.getLogger(signupDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

}
