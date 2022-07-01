/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptproject.SWP391.controller.authentication;

import com.fptproject.SWP391.error.CustomerError;
import com.fptproject.SWP391.manager.admin.AdminCustomerManager;
import com.fptproject.SWP391.manager.admin.AdminDentistManager;
import com.fptproject.SWP391.manager.admin.AdminEmployeeManager;
import com.fptproject.SWP391.model.Customer;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dangnguyen
 */
@WebServlet(name = "RegisterController", urlPatterns = {"/RegisterController"})
public class RegisterController extends HttpServlet {

    private static final String ERROR = "customer/register.jsp";
    private static final String SUCCESS = "login.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        CustomerError customerError = new CustomerError();

        try {
            boolean checkError = false;
            Customer customer = new Customer();
            AdminDentistManager daoDentist = new AdminDentistManager();
            AdminCustomerManager daoCustomer = new AdminCustomerManager();
            AdminEmployeeManager daoEmployee = new AdminEmployeeManager();
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String confirmPassword = request.getParameter("confirmPassword");
            String personalName = request.getParameter("personalName");
            String email = request.getParameter("emailAddress");
            int age = 0;
            String address = "";
            String phoneNumber = "";
            String role = "USER";
            byte gender = 0;
            String image = "assets/img/patients/default-avatar.jpg";
            byte status = 1;
            byte blacklistStatus = 0;
            

            //========check username====================
            if (username.trim().length() < 5 || username.trim().length() > 30) {
                customerError.setUsernameError("Characters must be >= 5 and <=30");
                checkError = true;
            }
            if (daoDentist.checkDuplicate(username) || daoCustomer.checkDuplicate(username) || daoEmployee.checkDuplicate(username)) {
                customerError.setUsernameError("this username has already existed");
                checkError = true;

            }
            //===========check validate email=============
            if (!CheckValidation.isValidEmailAddress(email)) {
                customerError.setEmailError("Email must match !xxxx@xxxx.xxx!");
                checkError = true;
            }
            //======check password============
            if (password.length() < 8 || password.length() > 30) {
                customerError.setPasswordError("Characters must be >=8 and <=30");
                checkError = true;
            } else {
                Pattern pattern = Pattern.compile("[0-9]");
                Matcher m = pattern.matcher(password);
                boolean checknum = m.find();

                pattern = Pattern.compile("[a-z]");
                m = pattern.matcher(password);
                boolean checkWordDowncase = m.find();

                pattern = pattern.compile("[A-Z]");
                m = pattern.matcher(password);
                boolean checkWordUpcase = m.find();

                if ((checknum & checkWordUpcase & checkWordDowncase) == false) {
                    customerError.setPasswordError("Password must include lowercase and uppercase letters, number");
                    checkError = true;
                }
            }
            //========check confirm password============
            if (confirmPassword.equals(password) == false) {
                checkError = true;
            }
            // ============check personal_name==========
            if (personalName.trim().length() < 5 || personalName.trim().length() > 30) {
                customerError.setPersonalNameError("Characters must be >= 5 and <=30");
                checkError = true;
            }
            if (checkError == false) {
                String id = customer.getCustomerNextID(daoCustomer.getMaxCustomerID());
                customer = new Customer(id, username, password, role, personalName, age, address, phoneNumber, email, gender, image, status, blacklistStatus);
                request.setAttribute("SUCCESS", "Create account success");
                if (daoCustomer.createCustomer(customer)) {
                    url = SUCCESS;
                }
            } else {
                request.setAttribute("CUSTOMER_ERROR", customerError);
                
                request.setAttribute("USERNAME_VALUE", username);
                request.setAttribute("FULLNAME_VALUE", personalName);
                request.setAttribute("EMAIL_ADDRESS", email);
                request.setAttribute("PASSWORD_VALUE", password);
            }

        } catch (Exception e) {
            log("Error At RegisterServlet: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
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
        processRequest(request, response);
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
        processRequest(request, response);
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
