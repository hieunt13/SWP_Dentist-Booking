/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptproject.SWP391.controller.dentist.appointment;

import com.fptproject.SWP391.manager.customer.AppointmentManager;
import com.fptproject.SWP391.manager.dentist.DentistAppointmentManager;
import com.fptproject.SWP391.manager.employee.EmployeeAppointmentManager;
import com.fptproject.SWP391.model.Appointment;
import com.fptproject.SWP391.model.AppointmentDetail;
import com.fptproject.SWP391.model.Customer;
import com.fptproject.SWP391.model.Dentist;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
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
@WebServlet(name = "DashboardController", urlPatterns = {"/dentist/Dashboard"})
public class DashboardController extends HttpServlet {

    private static final String ERROR = "../dentist/dentist-dashboard.jsp";
    private static final String DASHBOARD = "../dentist/dentist-dashboard.jsp";
    private static final String LOGIN_PAGE = "login.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = DASHBOARD;
//        try {
//             HttpSession session= request.getSession();
//            Dentist dentistModel = (Dentist) session.getAttribute("Login_Dentist");
//            DentistAppointmentManager dao = new DentistAppointmentManager();
//            List<Appointment> appointmentList = dao.getListAppointmentDashboad(dentistModel.getId());
//            if (appointmentList != null) {
//                request.setAttribute("APPOINTMENT_LIST_DASHBOARD", appointmentList);
//                url = SUCCESS;
//            }
//        } catch (Exception e) {
//            log("Error at Dentist Dashboad Controller: " + e.toString());
//        } finally {
//            request.getRequestDispatcher(url).forward(request, response);
//        }
        try {
            HttpSession session = request.getSession();
            Dentist dentist = (Dentist) session.getAttribute("Login_Dentist");
            if (dentist == null) {
                url = LOGIN_PAGE;
            } else {
//                ArrayList<Appointment> appointmentList = new ArrayList<Appointment>();
//                ArrayList<Appointment> appointmentCheckoutList = new ArrayList<Appointment>();
//
//                ArrayList<AppointmentDetail> listAppointmentDetailApplied = new ArrayList<>();
                DentistAppointmentManager dentistAppointmentDAO = new DentistAppointmentManager();
                EmployeeAppointmentManager employeeAppointmentDAO = new EmployeeAppointmentManager();
                ArrayList<Appointment> appointmentList = (ArrayList<Appointment>) dentistAppointmentDAO.getListAppointmentDashboad(dentist.getId());
                ArrayList<Appointment> appointmentCheckoutList = (ArrayList<Appointment>) employeeAppointmentDAO.getListCheckoutAppointment();

                HashMap<Appointment, ArrayList<AppointmentDetail>> appointmentApplied = new HashMap<>();

                for (Appointment appointment : appointmentList) {
                    ArrayList<AppointmentDetail> listAppointmentDetailApplied = employeeAppointmentDAO.listAppointmentDetailApplied(appointment.getId());
                    appointmentApplied.put(appointment, listAppointmentDetailApplied);
                }

                if (!appointmentApplied.isEmpty() || !appointmentList.isEmpty()) {
                    request.setAttribute("EMPLOYEE_APPOINTMENT_DETAIL_LIST", appointmentApplied);
                    request.setAttribute("EMPLOYEE_APPOINTMENT_LIST", appointmentList);
                } else {
                }
//                
//                List<Appointment> appointmentList = appointmentDAO.getListAppointment(customer.getId());
                if (appointmentList.isEmpty()) {
                } else {
                    Date now = new Date(System.currentTimeMillis());
                    String a = now.toString();
                    request.setAttribute("NOW", a);
                    request.setAttribute("APPOINTMENT_LIST_DASHBOARD", appointmentList);
                }
            }
        } catch (SQLException e) {
            log("Error at Dentist Dashboard Controller: " + e.toString());
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
