/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptproject.SWP391.controller.admin.feedback;

import com.fptproject.SWP391.manager.admin.AdminAppointmentManager;
import com.fptproject.SWP391.manager.admin.AdminCustomerManager;
import com.fptproject.SWP391.manager.admin.AdminDentistManager;
import com.fptproject.SWP391.manager.admin.AdminFeedbackManager;
import com.fptproject.SWP391.model.Appointment;
import com.fptproject.SWP391.model.Customer;
import com.fptproject.SWP391.model.Dentist;
import com.fptproject.SWP391.model.Feedback;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author admin
 */
@WebServlet(name = "AdminSearchFeedbackController", urlPatterns = {"/admin/AdminSearchFeedbackController"})
public class AdminSearchFeedbackController extends HttpServlet {
    private static final String ERROR ="/admin/reviews.jsp";
    private static final String SUCCESS ="/admin/reviews.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try{
            String fromRate = request.getParameter("fromRate");
            String toRate = request.getParameter("toRate");
            request.setAttribute("FROM_RATE", fromRate);
            request.setAttribute("TO_RATE", toRate);
            if(fromRate.isEmpty()){
                fromRate="0";
            }
            if(toRate.isEmpty()){
                toRate="5";
            }
            AdminFeedbackManager feedbackDAO = new AdminFeedbackManager();
            AdminAppointmentManager appointmentDAO = new AdminAppointmentManager();
            AdminCustomerManager customerDAO = new AdminCustomerManager();
            AdminDentistManager dentistDAO = new AdminDentistManager();
            HashMap<String,Customer> customerMap = new HashMap();
            HashMap<String,Dentist> dentistMap = new HashMap();
            HashMap<String,Appointment> appointmentMap = new HashMap();
            List<Feedback> feedbackList = feedbackDAO.searchListFeedback(fromRate, toRate);
            if(feedbackList.size()>0){
                for(Feedback feedback : feedbackList){
                    Appointment appointment = appointmentDAO.getAppointment(feedback.getAppointmentId());
                    if(appointment!=null){
                        appointmentMap.put(feedback.getAppointmentId(), appointment);
                        customerMap.put(appointment.getCustomerId(), customerDAO.getCustomerForAppointment(appointment.getCustomerId()));
                        dentistMap.put(appointment.getDentistId(), dentistDAO.getDentistForAppointment(appointment.getDentistId()));
                    }
                }
            }
            request.setAttribute("LIST_FEEDBACK", feedbackList);
            request.setAttribute("APPOINTMENT_MAP", appointmentMap);
            request.setAttribute("CUSTOMER_MAP", customerMap);
            request.setAttribute("DENTIST_MAP", dentistMap);
        }catch(Exception e){
            log("Error at AdminSearchFeedback Controller: " + e.toString() );
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
