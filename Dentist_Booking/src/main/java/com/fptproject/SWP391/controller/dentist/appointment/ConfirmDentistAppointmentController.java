/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptproject.SWP391.controller.dentist.appointment;

import com.fptproject.SWP391.manager.dentist.DentistAppointmentManager;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author minha
 */
@WebServlet(name = "ConfirmDentistAppointmentController", urlPatterns = {"/dentist/ConfirmDentistAppointment"})
public class ConfirmDentistAppointmentController extends HttpServlet {
    private static final String ERROR = "../dentist/AppointmentController";
    private static final String SUCCESS = "../dentist/AppointmentController";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;   
        Boolean check = false;
        try{
            String confirm = request.getParameter("confirm");
            String decline = request.getParameter("decline");
            String id = request.getParameter("id");
            //HttpSession session = request.getSession();
            //Dentist dentist = (Dentist) session.getAttribute("Login_Dentist");
            DentistAppointmentManager appointmentDAO = new DentistAppointmentManager();
            if (confirm!=null && !confirm.isEmpty()){
                check = appointmentDAO.setDentistConfirm(1, id);
            }
            if (decline!=null && !decline.isEmpty() ){
                check = appointmentDAO.setDentistConfirm(0, id); 
            }    
            if (check == true){
                url = SUCCESS;
            }                   
        }catch (Exception e){
            log("Error at Confirm Dentist Appointment Controller"+e.toString());
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
