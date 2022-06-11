/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptproject.SWP391.controller.customer.customer;

import com.fptproject.SWP391.error.CustomerError;
import com.fptproject.SWP391.manager.customer.CustomerManager;
import com.fptproject.SWP391.model.Customer;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
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
            
            if (personalName.trim().length() < 5 || personalName.trim().length() > 30) {
                customerError.setPersonalNameError("Characters must be >= 5 and <=30");
                checkError = true;
            }
            
            if (address.trim().length() < 5 || address.trim().length() > 150) {
                customerError.setAddressError("Characters must be >= 5 and <=150");
                checkError = true;
            }
            
            String phoneRegex = "^0\\d{9,10}"; 
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
