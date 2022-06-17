/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptproject.SWP391.controller.admin.dentist;

import com.fptproject.SWP391.error.DentistError;
import com.fptproject.SWP391.manager.admin.AdminDentistManager;
import com.fptproject.SWP391.model.Dentist;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
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
@WebServlet(name = "AdminUpdateDentistController", urlPatterns = {"/admin/AdminUpdateDentistController"})
public class AdminUpdateDentistController extends HttpServlet {
    private static final String ERROR = "../admin/AdminSearchDentistController";
    private static final String SUCCESS = "../admin/AdminSearchDentistController";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        DentistError dentistError = new DentistError();
        try{
            AdminDentistManager dao = new AdminDentistManager();
            boolean checkError = false;
            String id= "";
            String personalName = "";
            float rate = 5;
            byte gender = 0;
            byte status = 1;
            String speciality = "";
            String description = "";
            String education = "";
            int workingExperience = 0;
            String award = "";
            String image = "";
            String currentImage = "";
//            String id = request.getParameter("id");
//            String personalName = request.getParameter("personalName");
//            byte gender = Byte.parseByte(request.getParameter("gender"));
//            String speciality = request.getParameter("speciality");
//            String description = request.getParameter("description");
//            String education = request.getParameter("education");
//            int workingExperience = Integer.parseInt(request.getParameter("workingExperience"));
//            String award = request.getParameter("award");
//            String newImage = request.getParameter("image");
//            String currentImage = request.getParameter("currentImage");
//            float rate = 5;
//            byte status = 1;

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
                            if (fi.getFieldName().equals("id")) {
                                id = fi.getString();
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
                                image = tmp[tmp.length - 4] + "/" + tmp[tmp.length - 3] + "/" + tmp[tmp.length - 2] + "/" + tmp[tmp.length - 1];
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

            if(personalName.trim().length() < 5 || personalName.trim().length() > 30){
                dentistError.setPersonalNameError("Personal name must be >= 5 and <=30 characters");
                checkError = true;
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
            if(checkError == false){
//                String image = "assets/img/doctors/";
//                if(newImage.isEmpty()){
//                    image = currentImage;
//                }else{
//                    image+=newImage;
//                }
                Dentist dentist = new Dentist(id, personalName.trim(), rate, gender, status, speciality, description.trim(), education.trim(), workingExperience, award.trim(), image);
                request.setAttribute("SEARCH", personalName);
                if(dao.updateDentist(dentist)){
                    url= SUCCESS;
                    request.setAttribute("SUCCESS", "Update account success");
                }
            }else{
                request.setAttribute("DENTIST_ERROR", dentistError);
            }
            
        }catch(Exception e){
            log("Error at AdminUpdateDentist Controller: " + e.toString());
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
