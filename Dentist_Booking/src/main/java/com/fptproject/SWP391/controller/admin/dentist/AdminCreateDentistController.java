/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptproject.SWP391.controller.admin.dentist;

import com.fptproject.SWP391.error.DentistError;
import com.fptproject.SWP391.manager.admin.AdminCustomerManager;
import com.fptproject.SWP391.manager.admin.AdminDentistManager;
import com.fptproject.SWP391.manager.admin.AdminEmployeeManager;
import com.fptproject.SWP391.model.Dentist;
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
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author admin
 */
@WebServlet(name = "AdminCreateDentistController", urlPatterns = {"/admin/AdminCreateDentistController"})
public class AdminCreateDentistController extends HttpServlet {
        private static final String ERROR = "../admin/AdminSearchDentistController";
        private static final String SUCCESS = "../admin/AdminSearchDentistController";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        DentistError dentistError = new DentistError();
        try {
            boolean checkError = false;
            Dentist dentist = new Dentist();
            AdminDentistManager daoDentist = new AdminDentistManager();
            AdminCustomerManager daoCustomer = new AdminCustomerManager();
            AdminEmployeeManager daoEmployee = new AdminEmployeeManager();
            String username =  "";//request.getParameter("username");
            String password =  "";//request.getParameter("password");
            String role = "DENTIST";
            String personalName = "";//request.getParameter("personalName");
            float rate = 5;
            byte gender = 0;//Byte.parseByte(request.getParameter("gender"));
            byte status = 1;
            String speciality = "";//request.getParameter("speciality");
            String description = "";//request.getParameter("description");
            String education = "";//request.getParameter("education");
            int workingExperience = 0;//Integer.parseInt(request.getParameter("workingExperience"));
            String award = "";//request.getParameter("award");
            String image = "";//request.getParameter("image");
            
            // up load image
            String imgPathTmp = null;
            File file;
            int maxFileSize = 5000 * 1024;
            int maxMemSize = 5000 * 1024;
            ServletContext context = request.getServletContext();
            String filePath = context.getInitParameter("file-upload-admin-doctors-folder");//take the path file from web.xml
            // Verify the content type
            String contentType = request.getContentType();
            if ((contentType.indexOf("multipart/form-data") >= 0)) {
                DiskFileItemFactory factory = new DiskFileItemFactory();
                // maximum size that will be stored in memory
                factory.setSizeThreshold(maxMemSize);

                // Location to save data that is larger than maxMemSize.
                factory.setRepository(new File("D:/Chuyen nganh/SWP391/SWP_Dentist-Booking/Dentist_Booking/src/main/webapp/admin/assets/img/doctors/"));

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
                            if (fi.getFieldName().equals("username")) {
                                username = fi.getString();
                            }
                            if (fi.getFieldName().equals("password")) {
                                password = fi.getString();
                            }
                            if (fi.getFieldName().equals("personalName")) {
                                personalName = fi.getString();
                            }
                            if (fi.getFieldName().equals("gender")) {
                                gender = Byte.parseByte(fi.getString());
                            }
                            if (fi.getFieldName().equals("speciality")) {
                                speciality = fi.getString();
                            }
                            if (fi.getFieldName().equals("description")) {
                                description = fi.getString();
                            }
                            if (fi.getFieldName().equals("education")) {
                                education = fi.getString();
                            }
                            if (fi.getFieldName().equals("workingExperience")) {
                                workingExperience = Integer.parseInt(fi.getString());
                            }
                            if (fi.getFieldName().equals("award")) {
                                award = fi.getString();
                            }

                        } else {
                            //process write file to disk
                            String fieldName = fi.getFieldName();
                            String fileName = fi.getName();
                            // filePath += group + "/" + cmanager.ConvertStringtoName(category) + "/";
                            boolean isInMemory = fi.isInMemory();
                            long sizeInBytes = fi.getSize();

                            // Write the file
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
                        }

                    }

                } catch (Exception ex) {
                    System.out.println(ex);
                }
            }
            //create imgpath
            String tmp[] = imgPathTmp.split("\\\\");
            image = tmp[tmp.length - 4] + "/" + tmp[tmp.length - 3] + "/" + tmp[tmp.length - 2] + "/" + tmp[tmp.length - 1];
            
            // end updload image
            
            
            if(username.trim().length() < 5 || username.trim().length() > 30){
                dentistError.setUsernameError("Username must be >= 5 and <=30 characters");
                checkError = true;
            }
            
            if(personalName.trim().length() < 5 || personalName.trim().length() > 30){
                dentistError.setPersonalNameError("Personal name must be >= 5 and <=30 characters");
                checkError = true;
            }
            
            
            if(password.length() < 8 || password.length() > 30){
                dentistError.setPasswordError("Password must be >=8 and <=30 characters");
                checkError = true;
            }
            else{
                Pattern pattern = Pattern.compile("[0-9]");
                Matcher m = pattern.matcher(password);
                boolean checknum = m.find();

                pattern = Pattern.compile("[a-z]");
                m = pattern.matcher(password);
                boolean checkWordDowncase = m.find();

                pattern = pattern.compile("[A-Z]");
                m = pattern.matcher(password);
                boolean checkWordUpcase = m.find();
                
                if((checknum & checkWordUpcase & checkWordDowncase) == false){
                    dentistError.setPasswordError("Password must include lowercase and uppercase letters, number");
                    checkError=true;
                }
            }
            
            if(daoDentist.checkDuplicate(username) || daoCustomer.checkDuplicate(username) || daoEmployee.checkDuplicate(username)){
                dentistError.setUsernameError("this username has already existed");
                checkError= true; 
            }
            
            if(description.trim().length() < 10 || description.trim().length() > 500){
                dentistError.setDescriptionError("Description must be >= 10 and <=500 characters");
                checkError = true;
            }
            
            if(education.trim().length() < 10 || education.trim().length() > 300){
                dentistError.setEducationError("Education must be >= 10 and <=300 characters");
                checkError = true;
            }
            
            if(award.trim().length() < 5 || award.trim().length() > 300){
                dentistError.setAwardError("Award must be >= 5 and <=300 characters");
                checkError = true;
            }
            
            request.setAttribute("SEARCH", personalName);
            
            if(checkError == false){
                String id = dentist.getDentistNextID(daoDentist.getMaxDentistID());
                dentist = new Dentist(id, username.trim(), password, role, personalName.trim(), rate, gender, status, speciality, description.trim(), education.trim(), workingExperience, award.trim(), image);
                if(daoDentist.createDentist(dentist))
                    url=SUCCESS;
                    request.setAttribute("SUCCESS", "Create account success");
            }
            else{
                request.setAttribute("DENTIST_ERROR", dentistError);
            }
            
            
            
        } catch (Exception e) {
            log("Error at AdminCreateDentist Controller: " + e.toString());
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
