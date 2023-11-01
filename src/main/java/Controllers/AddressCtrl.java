package Controllers;

import DAOs.DBModelDAOs.AddressDAO;
import Models.DBModels.Address;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.ArrayList;

/**
 *
 * @author DuyenLTM
 */
public class AddressCtrl extends HttpServlet {

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
        if (request.getParameter("isLoad") != null && request.getParameter("isLoad").equals("true")) {
            int customerId = Integer.valueOf(request.getParameter("customerId"));
            AddressDAO accAddressDAO = new AddressDAO();
            ArrayList<Address> addresses = accAddressDAO.getAll(customerId);
            PrintWriter out = response.getWriter();

            for (Address a : addresses) {
                out.println("<div class=\"mt-3 d-flex bg-light rounded p-3 justify-content-between\">\n"
                        + "                                            <div>\n"
                        + "                                                <div>" + a.getFullName() + ", " + a.getPhone() + ", " + a.getAddress() + "</div>\n"
                        + "                                            </div>\n"
                        + "                                            <div>\n"
                        + "                                                <i onclick=\"deleteAddress(this);\" class=\"fa fa-close\" data-id=\"" + a.getId() + "\"></i>\n"
                        + "                                            </div>\n"
                        + "                                        </div>");
            }
            return;
        }

        String deleteAddressIdString = request.getParameter("deleteAddressId");
        if (deleteAddressIdString != null) {
            int addressId = Integer.parseInt(deleteAddressIdString);
            AddressDAO addressDAO = new AddressDAO();
            int result = addressDAO.deleteAddress(addressId);
        }

        String customerIdString = request.getParameter("customerId");
        String fullNameAddString = request.getParameter("fullNameAdd");
        String phoneAddString = request.getParameter("phoneAdd");
        String addressAddString = request.getParameter("addressAdd");
        if (fullNameAddString != null && phoneAddString != null && addressAddString != null && customerIdString != null) {
            int customerId = Integer.parseInt(customerIdString);
            AddressDAO addressDAO = new AddressDAO();
            int result = addressDAO.addAddress(fullNameAddString, phoneAddString, addressAddString, customerId);
//            String json = new Gson().toJson(result);
//
//            response.setContentType("application/json");
//            response.setCharacterEncoding("UTF-8");
//            response.getWriter().write(json);
        }

    }
}
