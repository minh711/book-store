/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

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
public class AccountDAO{

    private Connection conn = null;

    public AccountDAO() {
        conn = DBConnection.DbConnection.getConnection();
    }

    public int addAccount(String fullName,String phone,String email,String gender,Date birthday,String username,String password,int roleId) {
        int ketqua = 0;
        String sql = "INSERT INTO Account (fullName,phone, email, gender,birthday,username,[password],otp, isAvailable,roleId) VALUES (?,?,?,?,?,?,?,null,1,?)";
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
//    public Account GetSV(int id) {
//        Account sv = null;
//        String sql = "select *from Account where id=?";
//        try {
//            PreparedStatement ps = conn.prepareStatement(sql);
//            ps.setInt(1, id);
//            ResultSet rs = ps.executeQuery();
//            if (rs.next()) {
//                sv = new Account(rs.getString("fullName"), rs.getString("phone"), rs.getString("email"), rs.getString("gender"), rs.getDate("birthday"), rs.getString("username"), rs.getString("[password]"), null, true, rs.getInt("roleId"));
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return sv;
//    }
//    public int Delete(int id){
//        int ketqua=0;
//        String sql="delete from Account where id=?";
//        try {
//            PreparedStatement ps=conn.prepareStatement(sql);
//            ps.setInt(1, id);
//            ketqua=ps.executeUpdate();
//        } catch (SQLException ex) {
//            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return ketqua;
//    }
}