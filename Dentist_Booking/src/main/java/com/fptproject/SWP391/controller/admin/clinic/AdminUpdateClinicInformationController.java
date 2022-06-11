/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptproject.SWP391.controller.admin.clinic;

import com.fptproject.SWP391.error.ClinicInformationError;
import com.fptproject.SWP391.manager.admin.AdminClinicInformationManager;
import com.fptproject.SWP391.model.ClinicInformation;
import java.io.IOException;
import java.sql.Time;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author admin
 */
@WebServlet(name = "AdminUpdateClinicInformationController", urlPatterns = {"/admin/AdminUpdateClinicInformationController"})
public class AdminUpdateClinicInformationController extends HttpServlet {
    private static final String ERROR = "/admin/profile.jsp";
    private static final String SUCCESS = "/admin/profile.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        ClinicInformationError error = new ClinicInformationError();
        try{
            boolean checkError=false;
            AdminClinicInformationManager dao = new AdminClinicInformationManager();
            String name = request.getParameter("name");
            String openTime = request.getParameter("openTime");
            String closeTime = request.getParameter("closeTime");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            
            String[] extractTimePart = openTime.split(":");
            if(extractTimePart.length == 3){
                openTime = extractTimePart[0]+":"+extractTimePart[1];
            }
            
            extractTimePart = closeTime.split(":");
            if(extractTimePart.length == 3){
                closeTime = extractTimePart[0]+":"+extractTimePart[1];
            }
            
            
            if(name.trim().length() < 5 || name.trim().length() > 30){
                error.setNameError("Character must be >= 5 and <=30 characters");
                checkError = true;
            }
            
            if (address.trim().length() < 5 || address.trim().length() > 150) {
                error.setAddressError("Characters must be >= 5 and <=150");
                checkError = true;
            }
            
            if(openTime.compareTo(closeTime)>=0){
                error.setOpenTimeError("Open time must be before close time ");
                checkError = true;
            }
            
            if(closeTime.compareTo(openTime)<=0){
                error.setCloseTImeError("Close time must be after open time");
                checkError = true;
            }
            
            String phoneRegex = "^0\\d{9,10}"; 
            Pattern pattern = Pattern.compile(phoneRegex);
            Matcher matcher = pattern.matcher(phone);
            
            if (matcher.find() == false){
                error.setPhoneError("Phone number must start with 0 and have 10 or 11 numbers");
                checkError = true;
            }
            
            ClinicInformation clinicInformation = new ClinicInformation(name.trim(), address.trim(), phone, email, Time.valueOf(openTime+":00"), Time.valueOf(closeTime+":00"));
            
            if (checkError == false) {
                request.setAttribute("SUCCESS", "Update successfully");
                ClinicInformation clinicInformationContext = (ClinicInformation)request.getServletContext().getAttribute("CLINIC_INFO");
                clinicInformationContext.setName(name);
                clinicInformationContext.setOpenTime(Time.valueOf(openTime+":00"));
                clinicInformationContext.setCloseTIme(Time.valueOf(closeTime+":00"));
                clinicInformationContext.setPhone(phone);
                clinicInformationContext.setEmail(email);
                clinicInformationContext.setAddress(address);
                if (dao.updateInformation(clinicInformation)) {
                    url = SUCCESS;
                }
                request.getServletContext().setAttribute("CLINIC_INFO", clinicInformationContext);
                //update time in customer index.jsp
                String[] openTimeArray = clinicInformationContext.getOpenTime().toString().split(":");
                String[] closeTimeArray = clinicInformationContext.getCloseTIme().toString().split(":");
                request.getServletContext().setAttribute("OPEN_TIME", openTimeArray);
                request.getServletContext().setAttribute("CLOSE_TIME", closeTimeArray);
            } else {
                request.setAttribute("CLINIC_ERROR", error);
                request.setAttribute("CURRENT_INPUT", clinicInformation);
            }
        }catch(Exception e){
            log("Error at AdminUpdateClinicInformationController: " + e.toString());
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
