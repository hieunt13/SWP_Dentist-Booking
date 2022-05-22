/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptproject.SWP391.controller.admin.promotion;

import com.fptproject.SWP391.error.PromotionError;
import com.fptproject.SWP391.manager.admin.AdminPromotionManager;
import com.fptproject.SWP391.model.Promotion;
import java.io.IOException;
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
@WebServlet(name = "AdminCreatePromotionController", urlPatterns = {"/admin/AdminCreatePromotionController"})
public class AdminCreatePromotionController extends HttpServlet {

    private static final String ERROR = "/admin/promotion-management.jsp";
    private static final String SUCCESS = "/admin/promotion-management.jsp";

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
            String longDescription = request.getParameter("longDescription");
            String shortDescription = request.getParameter("shortDescription");
            String imageName = request.getParameter("image");
            String expiredDateString = request.getParameter("expiredDate");
            float discountPercentage = Float.parseFloat(request.getParameter("discountPercentage"));
            byte status = 1;

            if (shortDescription.trim().length() < 10 || shortDescription.trim().length() > 600) {
                promotionError.setShortDescriptionError("So kí tu phai >= 10 va <=600");
                checkError = true;
            }

            if (longDescription.trim().length() < 20 || longDescription.trim().length() > 1000) {
                promotionError.setLongDescriptionError("So kí tu phai >= 20 va <=1000");
                checkError = true;
            }

            Date currentDate = new Date(System.currentTimeMillis());
            Date expiredDate;
            String[] tmp = expiredDateString.split("-");
            Calendar cal = Calendar.getInstance();
            cal.set(Integer.parseInt(tmp[0]), Integer.parseInt(tmp[1]) - 1, Integer.parseInt(tmp[2]));
            expiredDate = new Date(cal.getTime().getTime());

            if (expiredDate.compareTo(currentDate) <= 0) {
                promotionError.setExpiredDateError("Han su dung phai sau ngay hom nay");
                checkError = true;
            }

            if (checkError == false) {
                String id = promotion.getPromotionNextID(dao.getMaxPromotionID());
                String image = "assets/img/promotions/" + imageName;
                promotion = new Promotion(id, longDescription, shortDescription, image, discountPercentage, expiredDate, status);
                request.setAttribute("SUCCESS", "Create promotion success");
                if (dao.createPromotion(promotion)) {
                    url = SUCCESS;
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
