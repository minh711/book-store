package Controllers;

import DAOs.DBModelDAOs.AccountDAO;
import DAOs.DBModelDAOs.AddressDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
/**
 *
 * @author DuyenLTM
 */
public class ProfileUpdate extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // ở trang nào đó khi nhấn nút muốn chỉnh profile sẽ gửi qua 1 id của account hiện tại
        AccountDAO accountDAO=new AccountDAO();
        AddressDAO accAddressDAO=new AddressDAO();
        request.setAttribute("customerId", 27);
        request.setAttribute("profileDetail", accountDAO.getAccountDetails(27));
        request.setAttribute("profileAddress", accAddressDAO.getAll(27));
        request.getRequestDispatcher("/Views/Customer/ProfileUpdate/ProfileUpdate.jsp").forward(request, response);
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
}
