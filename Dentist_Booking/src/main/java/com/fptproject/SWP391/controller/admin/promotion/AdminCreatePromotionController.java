/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptproject.SWP391.controller.admin.promotion;

import com.fptproject.SWP391.error.PromotionError;
import com.fptproject.SWP391.manager.admin.AdminPromotionManager;
import com.fptproject.SWP391.model.Promotion;
import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.Calendar;
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
@WebServlet(name = "AdminCreatePromotionController", urlPatterns = {"/admin/AdminCreatePromotionController"})
public class AdminCreatePromotionController extends HttpServlet {

    private static final String ERROR = "../admin/AdminSearchPromotionController";
    private static final String SUCCESS = "../admin/AdminSearchPromotionController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        PromotionError promotionError = new PromotionError();
        //id, long_description, short_description, image, discount_percentage, status
        try {
            boolean checkError = false;
            Promotion promotion = new Promotion();
            AdminPromotionManager dao = new AdminPromotionManager();
            String longDescription = "";//request.getParameter("longDescription");
            String shortDescription = "";//request.getParameter("shortDescription");
            String image = "";//request.getParameter("image");
            String promotionName = "";//request.getParameter("promotionName");
            String expiredDateString = "";//request.getParameter("expiredDate");
            float discountPercentage = 0;//Float.parseFloat(request.getParameter("discountPercentage"));
            byte status = 1;
            
            // up load image
            String imgPathTmp = null;
            File file;
            int maxFileSize = 5000 * 1024;
            int maxMemSize = 5000 * 1024;
            ServletContext context = request.getServletContext();
            String filePath = context.getInitParameter("file-upload-admin-promotions-folder");//take the path file from web.xml
            // Verify the content type
            String contentType = request.getContentType();
            if ((contentType.indexOf("multipart/form-data") >= 0)) {
                DiskFileItemFactory factory = new DiskFileItemFactory();
                // maximum size that will be stored in memory
                factory.setSizeThreshold(maxMemSize);

                // Location to save data that is larger than maxMemSize.
                factory.setRepository(new File("D:/Chuyen nganh/SWP391/SWP_Dentist-Booking/Dentist_Booking/src/main/webapp/admin/assets/img/promotions/"));

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
                            if (fi.getFieldName().equals("longDescription")) {
                                longDescription = fi.getString();
                            }
                            if (fi.getFieldName().equals("shortDescription")) {
                                shortDescription = fi.getString();
                            }
                            if (fi.getFieldName().equals("promotionName")) {
                                promotionName = fi.getString();
                            }
                            if (fi.getFieldName().equals("expiredDate")) {
                               expiredDateString = fi.getString();
                            }
                            if (fi.getFieldName().equals("discountPercentage")) {
                               discountPercentage = Float.parseFloat(fi.getString());
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
            
            if (promotionName.trim().length() < 10 || promotionName.trim().length() > 30) {
                promotionError.setPromotionNameError("Promotion name must be >= 10 and <=30 characters");
                checkError = true;
            }
            
            if (shortDescription.trim().length() < 5 || shortDescription.trim().length() > 60) {
                promotionError.setShortDescriptionError("Short description must be >= 5 and <=60 characters");
                checkError = true;
            }

            if (longDescription.trim().length() < 20 || longDescription.trim().length() > 1000) {
                promotionError.setLongDescriptionError("Long description must be >= 20 and <=1000 characters");
                checkError = true;
            }

            Date currentDate = new Date(System.currentTimeMillis());
            Date expiredDate;
            String[] tmpDate = expiredDateString.split("-");
            Calendar cal = Calendar.getInstance();
            cal.set(Integer.parseInt(tmpDate[0]), Integer.parseInt(tmpDate[1]) - 1, Integer.parseInt(tmpDate[2]));
            expiredDate = new Date(cal.getTime().getTime());

            if (expiredDate.compareTo(currentDate) <= 0) {
                promotionError.setExpiredDateError("Expired date must be after today");
                checkError = true;
            }

            request.setAttribute("SEARCH", promotionName);
            
            if (checkError == false) {
                String id = promotion.getPromotionNextID(dao.getMaxPromotionID());
                promotion = new Promotion(id, promotionName.trim(),longDescription.trim(), shortDescription.trim(), image, discountPercentage, expiredDate, status);              
                if (dao.createPromotion(promotion)) {
                    url = SUCCESS;
                    request.setAttribute("SUCCESS", "Create promotion success");
                }
            } else {
                request.setAttribute("PROMOTION_ERROR", promotionError);
            }

        } catch (Exception e) {
            log("Error at AdminCreatePromotion Controller: " + e.toString());
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
