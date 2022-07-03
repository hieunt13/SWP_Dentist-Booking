/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptproject.SWP391.controller.authentication;

import com.fptproject.SWP391.manager.admin.AdminCustomerManager;
import com.fptproject.SWP391.manager.admin.AdminDentistManager;
import com.fptproject.SWP391.model.Customer;
import com.fptproject.SWP391.model.UserGoogleDto;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

/**
 *
 * @author dangnguyen
 */
@WebServlet(name = "GoogleLoginController", urlPatterns = {"/GoogleLoginController"})
public class GoogleLoginController extends HttpServlet {

    private static final String CUSTOMER_PAGE = "AdminLoadClinicInformationController";
    private static final String ERROR = "login.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String code = request.getParameter("code");
        String accessToken = getToken(code);
        UserGoogleDto user = getUserInfo(accessToken);
        System.out.println(user);

        String username = user.getEmail();
        String password = user.getId();
        String personalName = user.getGiven_name();
        String email = user.getEmail();
        int age = 0;
        String address = "";
        String phoneNumber = "";
        String role = "USER";
        byte gender = 0;

        //String image = user.getPicture();
        String image = "assets/img/patients/default-avatar.jpg";
        byte status = 1;
        byte blacklistStatus = 0;

        Customer customer = new Customer();
        AdminDentistManager daoDentist = new AdminDentistManager();
        AdminCustomerManager daoCustomer = new AdminCustomerManager();
        String url = ERROR;
        
        if (!daoDentist.checkDuplicateEmail(user.getEmail())) {
            String id = customer.getCustomerNextID(daoCustomer.getMaxCustomerID());
            customer = new Customer(id, username, password, role, personalName, age, address, phoneNumber, email, gender, image, status, blacklistStatus);
            
            if (daoCustomer.createCustomer(customer)) {
                HttpSession session = request.getSession();
                session.setAttribute("Login_Customer", customer);
                url = CUSTOMER_PAGE;
            }  
        } else {
                LoginDAO dao = new LoginDAO();
                customer = dao.checkLoginCustomer(username, password);
                if (customer != null) {
                    HttpSession session = request.getSession();
                    session.setAttribute("Login_Customer", customer);
                    url = CUSTOMER_PAGE;
                } else {
                    request.setAttribute("ERROR", "Your username or password is incorrect");
                    request.getRequestDispatcher("/"+url).forward(request, response);
                }
            } 
        response.sendRedirect(url);
    }

    public static String getToken(String code) throws ClientProtocolException, IOException {
        // call api to get token
        String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
                        .add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", Constants.GOOGLE_REDIRECT_URI).add("code", code)
                        .add("grant_type", Constants.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();

        JsonObject jobj = new Gson().fromJson(response, JsonObject.class
        );
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static UserGoogleDto getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();

        UserGoogleDto googlePojo = new Gson().fromJson(response, UserGoogleDto.class
        );

        return googlePojo;
    }

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
        try {
            processRequest(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(GoogleLoginController.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(GoogleLoginController.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
