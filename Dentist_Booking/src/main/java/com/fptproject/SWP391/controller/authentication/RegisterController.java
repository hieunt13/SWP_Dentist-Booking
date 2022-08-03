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
import com.fptproject.SWP391.model.Mail;
import java.io.IOException;
import java.util.ArrayList;

import java.util.Date;
import java.util.Hashtable;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.codec.digest.DigestUtils;

import java.io.*;
import java.net.*;
import javax.naming.*;
import javax.naming.directory.*;

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
            int status = 2;
            byte blacklistStatus = 0;

            //========check username====================
            if (username.trim().length() < 5 || username.trim().length() > 30) {
                customerError.setUsernameError("Username must contain 5 to 30 characters");
                checkError = true;
            }
            if (daoDentist.checkDuplicate(username) || daoCustomer.checkDuplicate(username) || daoEmployee.checkDuplicate(username)) {
                customerError.setUsernameError("Username has already existed");
                checkError = true;

            } //===========check validate email=============
//            if (!this.isAddressValid(email)) {
//                if (!CheckValidation.isValidEmailAddress(email)) {
//                    customerError.setEmailError("Email must match !xxxx@xxxx.xxx!");
//                    checkError = true;
//                } else {
//                    customerError.setEmailError("Email doesn't exist!");
//                    checkError = true;
//                }
//            }
            
            if (daoDentist.checkDuplicateEmail(email)) {
                customerError.setEmailError("Email has already used");
                checkError = true;
            }
            //======check password============
            if (password.length() < 8 || password.length() > 30) {
                customerError.setPasswordError("Password must contain 8 to 30 characters");
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
                customerError.setPasswordError("Confirm password does not match");
                checkError = true;
            }
            // ============check personal_name==========
            if (personalName.matches("^[0-9]*$") && personalName.length() > 2 || personalName.trim().length() < 5 || personalName.trim().length() > 30) {
                customerError.setPersonalNameError("Full name must be >= 5 and <=30 and contain letter");
                checkError = true;
            }
            if (checkError == false) {
                String id = customer.getCustomerNextID(daoCustomer.getMaxCustomerID());
                String idHash = DigestUtils.md5Hex(id);
                Date createDate = new Date(System.currentTimeMillis());
                customer = new Customer(id, username, password, role, personalName, age, address, phoneNumber, email, gender, image, status, blacklistStatus, idHash, createDate);
                Mail mail = new Mail();
                mail.sendActivateLink(customer);
                request.setAttribute("SUCCESS", "Create account success.<br>Activation email was sent to your email.");
                if (daoCustomer.createCustomer(customer)) {
                    url = SUCCESS;
                }
            } else {
                request.setAttribute("CUSTOMER_ERROR", customerError);
                request.setAttribute("USERNAME_VALUE", username);
                request.setAttribute("FULLNAME_VALUE", personalName);
                request.setAttribute("EMAIL_ADDRESS", email);
                request.setAttribute("PASSWORD_VALUE", password);
                request.setAttribute("CONFIRM_PASSWORD_VALUE", confirmPassword);
            }

        } catch (Exception e) {
            log("Error At RegisterServlet: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    private static int hear(BufferedReader in) throws IOException {
        String line = null;
        int res = 0;
        while ((line = in.readLine()) != null) {
            String pfx = line.substring(0, 3);
            try {
                res = Integer.parseInt(pfx);
            } catch (Exception ex) {
                res = -1;
            }
            if (line.charAt(3) != '-') {
                break;
            }
        }
        return res;
    }

    private static void say(BufferedWriter wr, String text)
            throws IOException {
        wr.write(text + "\r\n");
        wr.flush();
        return;
    }

    private static ArrayList getMX(String hostName)
            throws NamingException {
        // Perform a DNS lookup for MX records in the domain
        Hashtable env = new Hashtable();
        env.put("java.naming.factory.initial",
                "com.sun.jndi.dns.DnsContextFactory");
        DirContext ictx = new InitialDirContext(env);
        Attributes attrs = ictx.getAttributes(hostName, new String[]{"MX"});
        Attribute attr = attrs.get("MX");
        // if we don't have an MX record, try the machine itself
        if ((attr == null) || (attr.size() == 0)) {
            attrs = ictx.getAttributes(hostName, new String[]{"A"});
            attr = attrs.get("A");
            if (attr == null) {
                throw new NamingException("No match for name '" + hostName + "'");
            }
        }
        // Huzzah! we have machines to try. Return them as an array list
        // NOTE: We SHOULD take the preference into account to be absolutely
        //   correct. This is left as an exercise for anyone who cares.
        ArrayList res = new ArrayList();
        NamingEnumeration en = attr.getAll();
        while (en.hasMore()) {
            String x = (String) en.next();
            String f[] = x.split(" ");
            if (f[1].endsWith(".")) {
                f[1] = f[1].substring(0, (f[1].length() - 1));
            }
            res.add(f[1]);
        }
        return res;
    }

    public boolean isAddressValid(String address) {
        // Find the separator for the domain name
        int pos = address.indexOf('@');
        // If the address does not contain an '@', it's not valid
        if (pos == -1) {
            return false;
        }
        // Isolate the domain/machine name and get a list of mail exchangers
        String domain = address.substring(++pos);
        ArrayList mxList = null;
        try {
            mxList = getMX(domain);
        } catch (NamingException ex) {
            return false;
        }
        // Just because we can send mail to the domain, doesn't mean that the
        // address is valid, but if we can't, it's a sure sign that it isn't
        if (mxList.size() == 0) {
            return false;
        }
        // Now, do the SMTP validation, try each mail exchanger until we get
        // a positive acceptance. It *MAY* be possible for one MX to allow
        // a message [store and forwarder for example] and another [like
        // the actual mail server] to reject it. This is why we REALLY ought
        // to take the preference into account.
        for (int mx = 0; mx < mxList.size(); mx++) {
            boolean valid = false;
            try {
                int res;
                Socket skt = new Socket((String) mxList.get(mx), 25);
                BufferedReader rdr = new BufferedReader(new InputStreamReader(skt.getInputStream()));
                BufferedWriter wtr = new BufferedWriter(new OutputStreamWriter(skt.getOutputStream()));
                res = hear(rdr);
                if (res != 220) {
                    throw new Exception("Invalid header");
                }
                say(wtr, "EHLO orbaker.com");
                res = hear(rdr);
                if (res != 250) {
                    throw new Exception("Not ESMTP");
                }
                // validate the sender address  
                say(wtr, "MAIL FROM: <tim@orbaker.com>");
                res = hear(rdr);
                if (res != 250) {
                    throw new Exception("Sender rejected");
                }
                say(wtr, "RCPT TO: <" + address + ">");
                res = hear(rdr);
                // be polite
                say(wtr, "RSET");
                hear(rdr);
                say(wtr, "QUIT");
                hear(rdr);
                if (res != 250) {
                    throw new Exception("Address is not valid!");
                }
                valid = true;
                rdr.close();
                wtr.close();
                skt.close();
            } catch (Exception ex) {
                // Do nothing but try next host
            } finally {
                if (valid) {
                    return true;
                }
            }
        }
        return false;
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
