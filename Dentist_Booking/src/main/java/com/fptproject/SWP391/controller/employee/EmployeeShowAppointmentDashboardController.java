/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptproject.SWP391.controller.employee;

import com.fptproject.SWP391.manager.employee.EmployeeAppointmentManager;
import com.fptproject.SWP391.manager.employee.EmployeeCustomerManager;
import com.fptproject.SWP391.manager.employee.EmployeeDentistManager;
import com.fptproject.SWP391.model.Appointment;
import com.fptproject.SWP391.model.Customer;
import com.fptproject.SWP391.model.Dentist;
import java.io.IOException;
import java.sql.Date;
import java.util.Calendar;
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
@WebServlet(name = "ShowAppointmentDashboardController", urlPatterns = {"/ShowAppointmentDashboardController"})
public class EmployeeShowAppointmentDashboardController extends HttpServlet {
    private static final String ERROR = "employee/employee-dashboard-real.jsp";
    private static final String SUCCESS = "employee/employee-dashboard-real.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try{
            EmployeeAppointmentManager appointmentDAO = new  EmployeeAppointmentManager();
            EmployeeDentistManager dentistDAO = new EmployeeDentistManager();
            EmployeeCustomerManager customerDAO = new EmployeeCustomerManager();
            Date today = new Date(System.currentTimeMillis());
            String[] tmpDate = today.toString().split("-");
            Calendar cal = Calendar.getInstance();
            cal.set(Integer.parseInt(tmpDate[0]), Integer.parseInt(tmpDate[1]) - 1, Integer.parseInt(tmpDate[2]));
            int offset = cal.get(Calendar.DAY_OF_WEEK)-1;
            if(offset!=0){
              cal.add(Calendar.DAY_OF_WEEK, 7-offset);
            }
            Date sunday = new Date(cal.getTime().getTime());
            HashMap<String,Customer> customerMap = new HashMap();
            HashMap<String,Dentist> dentistMap = new HashMap();
            List<Appointment> weekAppointmentList = appointmentDAO.searchListAppointmentBetweenDate(today.toString(), sunday.toString());
            List<Appointment> upcomingAppointmentList = appointmentDAO.searchListAppointmentFromTodayDate(today.toString());
            List<Appointment> todayAppointmentList = appointmentDAO.searchListAppointmentDate(today.toString());
            List<Appointment> beforeAppointmentList = appointmentDAO.searchListAppointmentBeforeDate(today.toString());
            int todayAppointmentCount = todayAppointmentList.size();
            int weekAppointmentCount = weekAppointmentList.size();
            int patientCount = 0;
            if(weekAppointmentList.size() > 0){
                for(Appointment appointment : weekAppointmentList){
                    if(!customerMap.containsKey(appointment.getCustomerId())){
                        customerMap.put(appointment.getCustomerId(), customerDAO.getCustomerForAppointment(appointment.getCustomerId()));
                        patientCount += 1;
                    }
                    if(!dentistMap.containsKey(appointment.getDentistId())){
                        dentistMap.put(appointment.getDentistId(), dentistDAO.getDentistForAppointment(appointment.getDentistId()));
                    }
                }
            }
            
            if(upcomingAppointmentList.size() > 0){
                for(Appointment appointment : upcomingAppointmentList){
                    if(!customerMap.containsKey(appointment.getCustomerId())){
                        customerMap.put(appointment.getCustomerId(), customerDAO.getCustomerForAppointment(appointment.getCustomerId()));
                        patientCount += 1;
                    }
                    if(!dentistMap.containsKey(appointment.getDentistId())){
                        dentistMap.put(appointment.getDentistId(), dentistDAO.getDentistForAppointment(appointment.getDentistId()));
                    }
                }
            }
            
            if(beforeAppointmentList.size() > 0){
                for(Appointment appointment : beforeAppointmentList){
                    if(!customerMap.containsKey(appointment.getCustomerId())){
                        customerMap.put(appointment.getCustomerId(), customerDAO.getCustomerForAppointment(appointment.getCustomerId()));
                        patientCount += 1;
                    }
                    if(!dentistMap.containsKey(appointment.getDentistId())){
                        dentistMap.put(appointment.getDentistId(), dentistDAO.getDentistForAppointment(appointment.getDentistId()));
                    }
                }
            }
            request.setAttribute("LIST_BEFORE_APPOINTMENT", beforeAppointmentList);
            request.setAttribute("LIST_WEEK_APPOINTMENT", weekAppointmentList);
            request.setAttribute("LIST_TODAY_APPOINTMENT", todayAppointmentList);
            request.setAttribute("LIST_UPCOMING_APPOINTMENT", upcomingAppointmentList);
            request.setAttribute("CUSTOMER_MAP", customerMap);
            request.setAttribute("DENTIST_MAP", dentistMap);
            request.setAttribute("TODAY_APPOINTMENT_COUNT", todayAppointmentCount);
            request.setAttribute("WEEK_APPOINTMENT_COUNT", weekAppointmentCount);
            request.setAttribute("PATIENT_COUNT", patientCount);
        }catch(Exception e){
            log("Error at ShowAppointmentDashboardController: "+e.toString());
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
