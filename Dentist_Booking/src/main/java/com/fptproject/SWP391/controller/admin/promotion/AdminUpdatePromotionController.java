/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptproject.SWP391.controller.admin.promotion;

import com.fptproject.SWP391.error.PromotionError;
import com.fptproject.SWP391.manager.admin.AdminPromotionManager;
import com.fptproject.SWP391.model.Promotion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author admin
 */
@WebServlet(name = "AdminUpdatePromotionController", urlPatterns = {"/admin/AdminUpdatePromotionController"})
public class AdminUpdatePromotionController extends HttpServlet {
    private static final String ERROR = "../admin/AdminSearchPromotionController?search=";
    private static final String SUCCESS = "../admin/AdminSearchPromotionController?search=";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = ERROR;
        PromotionError promotionError = new PromotionError();
        try{
            boolean checkError = false;
            Promotion promotion = new Promotion();
            AdminPromotionManager dao = new AdminPromotionManager();
            String id = request.getParameter("id");
            String longDescription = request.getParameter("longDescription");
            String shortDescription = request.getParameter("shortDescription");
            String imageName = request.getParameter("image");
            String promotionName = request.getParameter("promotionName");
            String expiredDateString = request.getParameter("expiredDate");
            float discountPercentage = Float.parseFloat(request.getParameter("discountPercentage"));
            byte status = 1;
            
            if (promotionName.trim().length() < 10 || promotionName.trim().length() > 30) {
                promotionError.setPromotionNameError("Promotion name must be >= 10 and <=30 characters");
                checkError = true;
            }
            
            if (shortDescription.trim().length() < 10 || shortDescription.trim().length() > 600) {
                promotionError.setShortDescriptionError("Short description must be >= 10 and <=600 characters");
                checkError = true;
            }

            if (longDescription.trim().length() < 20 || longDescription.trim().length() > 1000) {
                promotionError.setLongDescriptionError("Long description must be >= 20 and <=1000 characters");
                checkError = true;
            }

            Date currentDate = new Date(System.currentTimeMillis());
            Date expiredDate;
            String[] tmp = expiredDateString.split("-");
            Calendar cal = Calendar.getInstance();
            cal.set(Integer.parseInt(tmp[0]), Integer.parseInt(tmp[1]) - 1, Integer.parseInt(tmp[2]));
            expiredDate = new Date(cal.getTime().getTime());

            if (expiredDate.compareTo(currentDate) <= 0) {
                promotionError.setExpiredDateError("Expired date must be after today");
                checkError = true;
            }

            if (checkError == false) {
                String image = "assets/img/promotions/" + imageName;
                promotion = new Promotion(id, promotionName.trim(),longDescription.trim(), shortDescription.trim(), image, discountPercentage, expiredDate, status);              
                if (dao.updatePromotion(promotion)) {
                    url = SUCCESS;
                    request.setAttribute("SUCCESS", "Update promotion success");
                }
            } else {
                request.setAttribute("PROMOTION_ERROR", promotionError);
            }
        }catch(Exception e){
            log("Error at AdminUpdatePromotion Controller: " + e.toString());
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
