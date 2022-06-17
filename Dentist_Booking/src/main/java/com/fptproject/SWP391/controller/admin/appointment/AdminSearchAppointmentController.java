/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptproject.SWP391.controller.admin.appointment;

import com.fptproject.SWP391.manager.admin.AdminAppointmentDetailManager;
import com.fptproject.SWP391.manager.admin.AdminAppointmentManager;
import com.fptproject.SWP391.manager.admin.AdminCustomerManager;
import com.fptproject.SWP391.manager.admin.AdminDentistManager;
import com.fptproject.SWP391.manager.admin.AdminServiceManager;
import com.fptproject.SWP391.model.Appointment;
import com.fptproject.SWP391.model.AppointmentDetail;
import com.fptproject.SWP391.model.Customer;
import com.fptproject.SWP391.model.Dentist;
import com.fptproject.SWP391.model.Service;
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
@WebServlet(name = "AdminSearchAppointmentController", urlPatterns = {"/admin/AdminSearchAppointmentController"})
public class AdminSearchAppointmentController extends HttpServlet {
    private static final String ERROR= "/admin/appointment-list.jsp";
    private static final String SUCCESS= "/admin/appointment-list.jsp";   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try{
            String fromDate = request.getParameter("fromDate");
            String toDate = request.getParameter("toDate");
            request.setAttribute("FROM_DATE", fromDate);
            request.setAttribute("TO_DATE", toDate);            
            if(fromDate.isEmpty()){
                fromDate = "2000-01-01";
            }
            if(toDate.isEmpty()){
                toDate = "2300-01-01";
            }
            AdminAppointmentManager appointmentDAO = new AdminAppointmentManager();
            AdminCustomerManager customerDAO = new AdminCustomerManager();
            AdminDentistManager dentistDAO = new AdminDentistManager();
            AdminServiceManager serviceDAO = new AdminServiceManager();
            AdminAppointmentDetailManager appointmentDetailDAO = new AdminAppointmentDetailManager();
            HashMap<String,Customer> customerMap = new HashMap();
            HashMap<String,Dentist> dentistMap = new HashMap();
            HashMap<String,List<AppointmentDetail>> appointmentDetailMap = new HashMap();
            HashMap<String,String> serviceMap = new HashMap();
            List<Appointment> appointmentList = appointmentDAO.searchListAppointment(fromDate,toDate);
            if(appointmentList.size()>0){
                List<Service> serviceList = serviceDAO.getAllService();
                for(Service service : serviceList){
                    serviceMap.put(service.getId(), service.getServiceName());
                }
                for(Appointment appointment : appointmentList){
                    customerMap.put(appointment.getCustomerId(), customerDAO.getCustomerForAppointment(appointment.getCustomerId()));
                    dentistMap.put(appointment.getDentistId(), dentistDAO.getDentistForAppointment(appointment.getDentistId()));
                    List<AppointmentDetail> appointmentDetailList = appointmentDetailDAO.getListAppointment(appointment.getId());
                    appointmentDetailMap.put(appointment.getId(), appointmentDetailList);
                }
                request.setAttribute("LIST_APPOINTMENT", appointmentList);
                request.setAttribute("APPOINTMENTDETAIL_MAP", appointmentDetailMap);
                request.setAttribute("CUSTOMER_MAP", customerMap);
                request.setAttribute("DENTIST_MAP", dentistMap);
                request.setAttribute("SERVICE_MAP", serviceMap);
                url= SUCCESS;                
            }
        }catch(Exception e){
            log("Error at AdminSearchAppointment Controller: "+e.toString());
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
