/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptproject.SWP391.controller.customer.account;

import com.fptproject.SWP391.error.CustomerError;
import com.fptproject.SWP391.manager.customer.CustomerManager;
import com.fptproject.SWP391.model.Customer;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.Socket;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.naming.NamingEnumeration;
import javax.naming.NamingException;
import javax.naming.directory.Attribute;
import javax.naming.directory.Attributes;
import javax.naming.directory.DirContext;
import javax.naming.directory.InitialDirContext;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author admin
 */
@WebServlet(name = "ChangeProfileController", urlPatterns = {"/customer/ChangeProfileController"})
public class ChangeProfileController extends HttpServlet {
    private static final String SUCCESS = "profile-settings.jsp";
    private static final String ERROR = "profile-settings.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        CustomerError customerError = new CustomerError();
        try{
            CustomerManager dao = new CustomerManager();
            boolean checkError = false;
            String personalName="";
            String email="";
            String phone="";
            String address="";
            byte gender= 0;
            int age= 0;
            String image = "";
            String currentImage = "";
            String id = "";
            
            // up load image
            String imgPathTmp = null;
            File file;
            int maxFileSize = 5000 * 1024;
            int maxMemSize = 5000 * 1024;
            ServletContext context = request.getServletContext();
            String filePath = context.getInitParameter("file-upload-customer-folder");//take the path file from web.xml
            // Verify the content type
            String contentType = request.getContentType();
            if ((contentType.indexOf("multipart/form-data") >= 0)) {
                DiskFileItemFactory factory = new DiskFileItemFactory();
                // maximum size that will be stored in memory
                factory.setSizeThreshold(maxMemSize);

                // Location to save data that is larger than maxMemSize.
                factory.setRepository(new File("D:/Chuyen nganh/SWP391/SWP_Dentist-Booking/Dentist_Booking/src/main/webapp/customer/assets/img/patients/"));

                // Create a new file upload handler
                ServletFileUpload upload = new ServletFileUpload(factory);

                // maximum file size to be uploaded.
                upload.setSizeMax(maxFileSize);

                try {
                    // Parse the request to get file items.
                    List fileItems = upload.parseRequest(request);

                    // Process the uploaded file items
                    Iterator i = fileItems.iterator();
                    while (i.hasNext()) {
                        FileItem fi = (FileItem) i.next();
                        if (fi.isFormField()) {
                            // get the uploaded file's fields
                            if (fi.getFieldName().equals("id")) {
                                id = fi.getString();
                            }
                            if (fi.getFieldName().equals("personalName")) {
                                personalName = fi.getString();
                            }
                            if (fi.getFieldName().equals("gender")) {
                                gender = Byte.parseByte(fi.getString());
                            }
                            if (fi.getFieldName().equals("address")) {
                                address = fi.getString();
                            }
                            if (fi.getFieldName().equals("email")) {
                                email = fi.getString();
                            }
                            if (fi.getFieldName().equals("phone")) {
                                phone = fi.getString();
                            }
                            if (fi.getFieldName().equals("age")) {
                                age = Integer.parseInt(fi.getString());
                            }
                            if (fi.getFieldName().equals("currentImage")) {
                                currentImage = fi.getString();
                            }

                        } else {
                            //process write file to disk
                            String fieldName = fi.getFieldName();
                            String fileName = fi.getName();
                            
                            // filePath += group + "/" + cmanager.ConvertStringtoName(category) + "/";
                            boolean isInMemory = fi.isInMemory();
                            long sizeInBytes = fi.getSize();

                            // Write the file
                            if(!fileName.isEmpty()){
                                if (fileName.lastIndexOf("\\") >= 0) {
                                    file = new File(filePath
                                            + fileName.substring(fileName.lastIndexOf("\\")));
                                } else {
                                    file = new File(filePath
                                            + fileName.substring(fileName.lastIndexOf("\\") + 1));
                                }
                                //get the img path for saving to database
                                imgPathTmp = file.getAbsolutePath();
                                fi.write(file);
                                //create imgpath
                                String tmp[] = imgPathTmp.split("\\\\");
                                image =  tmp[tmp.length - 4] + "/" + tmp[tmp.length - 3] + "/" + tmp[tmp.length - 2] + "/" + tmp[tmp.length - 1];
                            }else{
                                image = currentImage;
                            }
                           
                        }

                    }

                } catch (Exception ex) {
                    System.out.println(ex);
                }
            }  
            // end updload image
            
            String alphabet = "[a-zA-Z]+";
            Pattern pattern2 = Pattern.compile(alphabet);
            Matcher matcher2;
            
            matcher2 = pattern2.matcher(personalName);
            if (personalName.trim().length() < 5 || personalName.trim().length() > 30 || matcher2.find() == false) {
                customerError.setPersonalNameError("Characters must be >= 5 and <=30 and contain alphabets");
                checkError = true;
            }
            
            matcher2 = pattern2.matcher(address);
            if (address.trim().length() < 5 || address.trim().length() > 150 || matcher2.find() == false) {
                customerError.setAddressError("Characters must be >= 5 and <=150 and contain alphabets");
                checkError = true;
            }
            
            String phoneRegex = "^0\\d{9,10}$"; 
            Pattern pattern = Pattern.compile(phoneRegex);
            Matcher matcher = pattern.matcher(phone);
            
            if (matcher.find() == false){
                customerError.setPhoneNumberError("Phone number must start with 0 and have 10 or 11 numbers");
                checkError = true;
            }
            
//            String emailRegex = "^(?=.{1,64}@)[A-Za-z0-9_-]+(\\.[A-Za-z0-9_-]+)*@"
//                                + "[^-][A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z]{2,})$";
//            pattern = Pattern.compile(emailRegex);
//            matcher = pattern.matcher(email);
//            
//            if(matcher.find() == false){
//                customerError.setEmailError("Only special character:. , _ , - is allowed in local-part\n"
//                                            +". is not first or last character \n" 
//                                            +". does not appear consecutively");
//                checkError = true;
//            }
            
//            if(this.isAddressValid(email) == false){
//                customerError.setEmailError("Email doesn't exist");
//                checkError = true;
//            }else 
            
            if(dao.checkEmailDuplication(email) == true){
                HttpSession session = request.getSession();
                Customer loginCustomer = (Customer)session.getAttribute("Login_Customer");
                if(!loginCustomer.getEmail().equals(email)){
                    customerError.setEmailError("This email has already been used");
                    checkError = true;
                }
            }
            
            Customer customer = new Customer(id, personalName.trim(), age, address.trim(), phone, email, gender, image);
            
            if (checkError == false) {
                HttpSession session = request.getSession();
                request.setAttribute("SUCCESS", "Update successfully");
                Customer loginCustomer = (Customer)session.getAttribute("Login_Customer");
                loginCustomer.setPersonalName(personalName);
                loginCustomer.setAge(age);
                loginCustomer.setAddress(address);
                loginCustomer.setPhoneNumber(phone);
                loginCustomer.setEmail(email);
                loginCustomer.setGender(gender);
                loginCustomer.setImage(image);
                if (dao.updateProfile(customer)) {
                    url = SUCCESS;
                }
                session.setAttribute("Login_Customer", loginCustomer);
            } else {
                request.setAttribute("CUSTOMER_ERROR", customerError);
                request.setAttribute("CURRENT_INPUT", customer);
            }
            
        }catch(Exception e){
            log("Error at ChangeProfileController: "+e.toString());
        }finally{
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
