/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptproject.SWP391.controller.customer.appointment;

import com.fptproject.SWP391.manager.customer.AppointmentDetailManager;
import com.fptproject.SWP391.manager.customer.AppointmentManager;
import com.fptproject.SWP391.manager.customer.DentistManager;
import com.fptproject.SWP391.manager.customer.PromotionManager;
import com.fptproject.SWP391.manager.customer.ServiceManager;
import com.fptproject.SWP391.model.Appointment;
import com.fptproject.SWP391.model.AppointmentDetail;
import com.fptproject.SWP391.model.Dentist;
import com.fptproject.SWP391.model.Service;
import java.io.IOException;
import java.util.ArrayList;
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
@WebServlet(name = "AppointmentCheckoutController", urlPatterns = {"/AppointmentCheckoutController"})
public class AppointmentCheckoutController extends HttpServlet {
    private static final String ERROR = "customer/checkout.jsp";
    private static final String SUCCESS = "customer/checkout.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try{
            String appointmentID = request.getParameter("appointmentID");
            String dentistId = request.getParameter("dentistID");
            DentistManager dentistDAO = new DentistManager();
            Dentist dentist  = dentistDAO.getDentistForPayment(dentistId);
            AppointmentManager appointmentDAO = new AppointmentManager();
            Appointment appointment = appointmentDAO.getAppointmentForPurchase(appointmentID);
            AppointmentDetailManager appointmentDetailDAO  = new AppointmentDetailManager();
            List<AppointmentDetail> listAppointmentDetail = appointmentDetailDAO.getListAppointment(appointmentID);
            List<Service> listService = new ArrayList<>();
            ServiceManager serviceDAO = new ServiceManager();
            PromotionManager promotionDAO = new PromotionManager();
            HashMap<String,Float> promotionDiscountMap = new HashMap<>();
            for( AppointmentDetail appointmentDetail : listAppointmentDetail){
                String serviceID = appointmentDetail.getServiceId();
                Service service = serviceDAO.getServiceForPurchase(serviceID);
                promotionDiscountMap.put(service.getPromotionId(), promotionDAO.getDiscountPercentage(service.getPromotionId()));
                listService.add(service);
            }
            
            if(appointment != null && dentist != null){
                request.setAttribute("APPOINTMENT", appointment);
                request.setAttribute("DENTIST", dentist);
                request.setAttribute("LIST_SERVICE", listService);
                request.setAttribute("HASHMAP_DISCOUNT_PROMOTION", promotionDiscountMap);
                request.setAttribute("LIST_APPOINTMENTDETAIL", listAppointmentDetail);
                url = SUCCESS;
            }
        }catch(Exception e){
            log("Error at AppointmentCheckout Controller: " + e.toString());
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
