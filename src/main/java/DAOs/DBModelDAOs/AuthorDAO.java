/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs.DBModelDAOs;

import Models.DBModels.Author;
import Models.DBModels.Genre;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author MinhTD
 */
public class AuthorDAO {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public AuthorDAO() {
        conn = DBConnection.DbConnection.getConnection();
    }

    /**
     * Get all available Publishers.
     *
     * @return Publisher array.
     * @author MinhTD
     */
    public Author[] getAll() {
        List<Author> ls = new ArrayList<>();
        String sql
                = "SELECT * "
                + "FROM [Author] "
                + "WHERE [isAvailable] = 1"; // 1 means True in BIT data type
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                ls.add(new Author(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getBoolean(3)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AuthorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        Author[] arr = new Author[ls.size()];
        ls.toArray(arr);
        return arr;
    }

    
}
