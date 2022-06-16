/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptproject.SWP391.controller.admin.promotion;

import com.fptproject.SWP391.manager.admin.AdminPromotionManager;
import com.fptproject.SWP391.manager.admin.AdminServiceManager;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author admin
 */
@WebServlet(name = "AdminDeletePromotionController", urlPatterns = {"/admin/AdminDeletePromotionController"})
public class AdminDeletePromotionController extends HttpServlet {
    private static final String ERROR = "../admin/AdminSearchPromotionController";
    private static final String SUCCESS = "../admin/AdminSearchPromotionController";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try{
            String ID = request.getParameter("promotionID");
            AdminServiceManager serviceDAO = new AdminServiceManager();
            if(serviceDAO.checkDeleteCondition(ID) == false){
                request.setAttribute("ERROR", "Fail to delete (This promotion still appears in one or more services)");
            }else{
                AdminPromotionManager promotionDAO = new AdminPromotionManager();
                boolean check = promotionDAO.deletePromotion(ID);
                if (check){
                    url = SUCCESS;
                    request.setAttribute("SUCCESS", "Delete successfully");
                }
            }
        }catch(Exception e){
            log("Error at AdminDeletePromotion Controller: " + e.toString());
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
