/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptproject.SWP391.controller.admin.service;

import com.fptproject.SWP391.error.ServiceError;
import com.fptproject.SWP391.manager.admin.AdminPromotionManager;
import com.fptproject.SWP391.manager.admin.AdminServiceManager;
import com.fptproject.SWP391.model.Service;
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
@WebServlet(name = "AdminUpdateServiceController", urlPatterns = {"/admin/AdminUpdateServiceController"})
public class AdminUpdateServiceController extends HttpServlet {
    private static final String ERROR = "../admin/AdminSearchServiceController";
    private static final String SUCCESS = "../admin/AdminSearchServiceController";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       String url = ERROR;
        ServiceError serviceError = new ServiceError();
        try {
            boolean checkError = false;
            Service service;
            AdminServiceManager serviceDao = new AdminServiceManager();
            AdminPromotionManager promotionDao = new AdminPromotionManager();
            List<String> promotionIdList = promotionDao.getAllPromotion();
            String id = "";//request.getParameter("id");
            String serviceName = ""; //request.getParameter("serviceName");
            String promotionId =  ""; //request.getParameter("promotionId");
            String shortDescription = ""; //request.getParameter("shortDescription");
            String longDescription = ""; //request.getParameter("longDescription");
            int price = 0; //Integer.parseInt(request.getParameter("price"));
            String image = ""; //request.getParameter("image");
            String currentImage = ""; //request.getParameter("currentImage");
            byte status = 1;
            
            // up load image
            String imgPathTmp = null;
            File file;
            int maxFileSize = 5000 * 1024;
            int maxMemSize = 5000 * 1024;
            ServletContext context = request.getServletContext();
            String filePath = context.getInitParameter("file-upload-admin-specialities-folder");//take the path file from web.xml
            // Verify the content type
            String contentType = request.getContentType();
            if ((contentType.indexOf("multipart/form-data") >= 0)) {
                DiskFileItemFactory factory = new DiskFileItemFactory();
                // maximum size that will be stored in memory
                factory.setSizeThreshold(maxMemSize);

                // Location to save data that is larger than maxMemSize.
                factory.setRepository(new File("D:/Chuyen nganh/SWP391/SWP_Dentist-Booking/Dentist_Booking/src/main/webapp/admin/assets/img/specialities/"));

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
                            if (fi.getFieldName().equals("serviceName")) {
                                serviceName = fi.getString();
                            }
                            if (fi.getFieldName().equals("promotionId")) {
                                promotionId = fi.getString();
                            }
                            if (fi.getFieldName().equals("shortDescription")) {
                                shortDescription = fi.getString();
                            }
                            if (fi.getFieldName().equals("longDescription")) {
                                longDescription = fi.getString();
                            }
                            if (fi.getFieldName().equals("price")) {
                                price = Integer.parseInt(fi.getString());
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
            
            if(serviceName.trim().length() < 2 || serviceName.trim().length() > 30){
                serviceError.setServiceNameError("Service name must be >= 2 va <=30 characters");
                checkError = true;
            }
            
            if(shortDescription.trim().length() < 10 || shortDescription.trim().length() > 100){
                serviceError.setShortDescriptionError("Short description must be >= 10 va <=100 characters");
                checkError = true;
            }
            
            if(longDescription.trim().length() < 40 || longDescription.trim().length() > 1000){
                serviceError.setLongDescriptionError("Long Description must be >= 40 va <=1000 characters");
                checkError = true;
            }
            
            if(promotionId.isEmpty())
                promotionId = null;
            else if(promotionIdList.contains(promotionId) == false){
                serviceError.setPromotionIdError("This promotion doesn't existed");
                checkError = true;
            }
            
            request.setAttribute("SEARCH", serviceName);
            
            if(checkError == false){
                service = new Service(id, serviceName.trim(), promotionId, shortDescription.trim(), longDescription.trim(), price, image, status);                
                if(serviceDao.updateService(service)){
                    url=SUCCESS;
                    request.setAttribute("SUCCESS", "Update service success");
                    
                }
            }
            else{
                request.setAttribute("SERVICE_ERROR", serviceError);
            }
            
        }catch(Exception e){
            log("Error at AdminUpdateService Controller: " + e.toString());
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
