package DAOs.DBModelDAOs;

import Models.DBModels.Account;
import Utilities.StringMethods;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DuyenLTM
 */
public class ProfileDAO {

    private Connection conn = null;

    public ProfileDAO() {
        conn = DBConnection.DbConnection.getConnection();
    }

    public int UpdateCustomer(Account newAccount) {
        int ketqua = 0;
        if (newAccount.getPassword() == "") {
            String sql = "Update Account set fullName=?,phone=?,email=?,gender=?,birthday=?, username=?"
                    + " where id=?";
            try {
                PreparedStatement ps = conn.prepareStatement(sql);

                ps.setString(1, newAccount.getFullName());
                ps.setString(2, newAccount.getPhone());
                ps.setString(3, newAccount.getEmail());
                ps.setString(4, newAccount.getGender());
                ps.setDate(5, newAccount.getBirthday());
                ps.setString(6, newAccount.getUsername());
                ps.setInt(7, newAccount.getId());
                ketqua = ps.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            String sql = "Update Account set fullName=?,phone=?,email=?,gender=?,birthday=?, username=?,"
                    + "password=? where id=?";
            try {
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1, newAccount.getFullName());
                ps.setString(2, newAccount.getPhone());
                ps.setString(3, newAccount.getEmail());
                ps.setString(4, newAccount.getGender());
                ps.setDate(5, newAccount.getBirthday());
                ps.setString(6, newAccount.getUsername());
                ps.setString(7, StringMethods.MD5Hash(newAccount.getPassword()));
                ps.setInt(8, newAccount.getId());
                ketqua = ps.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return ketqua;
    }
    
//    public static void main(String[] args) {
//        ProfileDAO a=new ProfileDAO();
//        
//        int b=a.UpdateCustomer(new Account(52, "Duyen nè", "", "", "", '03-03-2003', "", "", null, true, 4));
//        System.out.println(b);
//    }
}
