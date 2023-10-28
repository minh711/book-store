package DAOs.DBModelDAOs;

import Models.DBModels.Account;
import Models.MgrModels.AccountDetail;
import Models.MgrModels.AccountList;
import Utilities.StringMethods;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DuyenLTM
 */
public class AccountDAO {

    private Connection conn = null;

    public AccountDAO() {
        conn = DBConnection.DbConnection.getConnection();
    }

    public int addAccount(String fullName, String phone, String email, String gender, Date birthday, String username, String password, int roleId) {
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

    public ArrayList<AccountList> getAccounts() {
        ArrayList<AccountList> accounts = new ArrayList<>();
        String sql = "SELECT \n"
                + "    A.id AS AccountID,\n"
                + "    A.username AS Username,\n"
                + "    A.fullName AS FullName,\n"
                + "    R.role AS Role,\n"
                + "    A.isAvailable AS IsAvailable\n"
                + "FROM \n"
                + "    Account A\n"
                + "JOIN\n"
                + "    Role R\n"
                + "ON\n"
                + "    A.roleId = R.id;";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String a = "";
                if (rs.getBoolean(5)) {
                    a = "Hoạt động";
                } else {
                    a = "Đã xóa";
                }
                accounts.add(new AccountList(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), a));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
//            return null;
        }
        return accounts;
    }
//
//    public AccountDetail getAccount(int id) {
//        AccountDetail accountDetail = null;
//        ResultSet rs = null;
//        PreparedStatement ps;
//        String sql = "select fullName, phone, email, username, [password], gender, birthday, [Role].[role]\n"
//                + "from Account\n"
//                + "INNER JOIN [Role]\n"
//                + "on Account.roleId=[Role].id\n"
//                + "WHERE Account.id=?;";
//
//        try {
//            ps = conn.prepareStatement(sql);
//            ps.setInt(1, id);
//            rs = ps.executeQuery();
//            accountDetail = new AccountDetail(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
//                    rs.getString(5), rs.getString(6), rs.getDate(7), rs.getString(8));
//        } catch (SQLException ex) {
//            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return accountDetail;
//    }

    public AccountDetail getAccountDetails(int id) {
        AccountDetail account = new AccountDetail();
        String sql = "select fullName, phone, email, username, [password], gender, birthday, [Role].[role]\n"
                + "from Account\n"
                + "INNER JOIN [Role]\n"
                + "on Account.roleId=[Role].id\n"
                + "WHERE Account.id=?;";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                account = new AccountDetail(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getDate(7), rs.getString(8));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return account;
    }

    public int Update(Account newAccount) {
        int ketqua = 0;
        if (newAccount.getPassword() == "") {
            String sql = "Update Account set fullName=?,phone=?,email=?,gender=?,birthday=?, username=?,"
                    + "roleId=? where id=?";
            try {
                PreparedStatement ps = conn.prepareStatement(sql);

                ps.setString(1, newAccount.getFullName());
                ps.setString(2, newAccount.getPhone());
                ps.setString(3, newAccount.getEmail());
                ps.setString(4, newAccount.getGender());
                ps.setDate(5, newAccount.getBirthday());
                ps.setString(6, newAccount.getUsername());
                ps.setInt(7, newAccount.getRoleId());
                ps.setInt(8, newAccount.getId());
                ketqua = ps.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            String sql = "Update Account set fullName=?,phone=?,email=?,gender=?,birthday=?, username=?,"
                    + "password=?, roleId=? where id=?";
            try {
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1, newAccount.getFullName());
                ps.setString(2, newAccount.getPhone());
                ps.setString(3, newAccount.getEmail());
                ps.setString(4, newAccount.getGender());
                ps.setDate(5, newAccount.getBirthday());
                ps.setString(6, newAccount.getUsername());
                ps.setString(7, StringMethods.MD5Hash(newAccount.getPassword()));
                ps.setInt(8, newAccount.getRoleId());
                ps.setInt(9, newAccount.getId());
                ketqua = ps.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return ketqua;
    }

    public int deleteAccount(int id) {
        int result = 0;
        String sql = "update Account\n"
                + "set isAvailable=0\n"
                + "where id=?;";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            result = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

}
