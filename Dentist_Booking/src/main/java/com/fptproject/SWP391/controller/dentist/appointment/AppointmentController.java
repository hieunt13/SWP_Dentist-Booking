/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptproject.SWP391.controller.dentist.appointment;

import com.fptproject.SWP391.manager.dentist.DentistAppointmentManager;
import com.fptproject.SWP391.model.Appointment;
import com.fptproject.SWP391.model.Dentist;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author minha
 */
@WebServlet(name = "ConfirmAppointmentController", urlPatterns = {"/dentist/AppointmentController"})
public class AppointmentController extends HttpServlet {
    private static final String ERROR = "../dentist/dentist-appointment.jsp";
    private static final String SUCCESS = "../dentist/dentist-appointment.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try{
            HttpSession session = request.getSession();
            Dentist dentist = (Dentist) session.getAttribute("Login_Dentist");
            DentistAppointmentManager appointmentDAO = new DentistAppointmentManager();
            List<Appointment> appointmentList = appointmentDAO.getListAppointment(dentist.getId());
            if (!appointmentList.isEmpty()){
                request.setAttribute("LIST_APPOINTMENT_DENTIST", appointmentList);
                url = SUCCESS;
            }
        }catch (SQLException e){
            log("Error at Appointment Controller"+e.toString());
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
