/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptproject.SWP391.controller.admin.clinic;

import com.fptproject.SWP391.manager.admin.AdminClinicInformationManager;
import com.fptproject.SWP391.model.ClinicInformation;
import java.io.IOException;
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
@WebServlet(name = "AdminLoadClinicInformationController", urlPatterns = {"/AdminLoadClinicInformationController"})
public class AdminLoadClinicInformationController extends HttpServlet {
    private static final String ERROR = "home/mainpage";
    private static final String SUCCESS = "home/mainpage";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try{
            AdminClinicInformationManager dao = new AdminClinicInformationManager();
            ClinicInformation clinicInformation = dao.getClinicInformation();
            Calendar cal = Calendar.getInstance();
            String[] openTime = clinicInformation.getOpenTime().toString().split(":");
            String[] closeTime = clinicInformation.getCloseTIme().toString().split(":");
            if(clinicInformation!=null){
                request.getServletContext().setAttribute("CLINIC_INFO", clinicInformation);
                request.getServletContext().setAttribute("OPEN_TIME", openTime);
                request.getServletContext().setAttribute("CLOSE_TIME", closeTime);
                url= SUCCESS;
            }
        }catch(Exception e){
                log("Error at AdminViewClinicInformation Controller: " + e.toString());
        }finally{
            response.sendRedirect(url);
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
