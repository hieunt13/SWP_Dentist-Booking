/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptproject.SWP391.controller.employee;

import com.fptproject.SWP391.manager.employee.EmployeeAppointmentManager;
import com.fptproject.SWP391.model.Appointment;
import com.fptproject.SWP391.model.AppointmentDetail;
import com.fptproject.SWP391.model.Employee;
import java.io.IOException;
import java.util.ArrayList;
import static java.util.Collections.list;
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
 * @author dangnguyen
 */
@WebServlet(name = "Employee_AppointmentController", urlPatterns = {"/appointmentEmployee"})
public class AppointmentController extends HttpServlet {

    private static final String SUCCESS = "employee/employee-appointment-confirm.jsp";
    private static final String LOGIN_PAGE = "login.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String url = SUCCESS;

        try {
            ArrayList<Appointment> appointmentPendingList = new ArrayList<Appointment>();
            ArrayList<Appointment> appointmentCheckoutList = new ArrayList<Appointment>();

            ArrayList<AppointmentDetail> listAppointmentDetailApplied;
            EmployeeAppointmentManager appointmentDAO;

            HttpSession session = request.getSession();
            Employee employee = (Employee) session.getAttribute("Login_Employee");
            String msg = "";
            if (employee == null) {
                url = LOGIN_PAGE;
                msg = "You Need Login To Process This Request!";
            } else {

                listAppointmentDetailApplied = new ArrayList<>();
                appointmentDAO = new EmployeeAppointmentManager();

                appointmentPendingList = (ArrayList<Appointment>) appointmentDAO.getListPendingAppointment();
                appointmentCheckoutList = (ArrayList<Appointment>) appointmentDAO.getListCheckoutAppointment();

                HashMap<Appointment, ArrayList<AppointmentDetail>> appointmentApplied = new HashMap<>();

                for (Appointment appointment : appointmentPendingList) {
                    listAppointmentDetailApplied = appointmentDAO.listAppointmentDetailApplied(appointment.getId());
                    appointmentApplied.put(appointment, listAppointmentDetailApplied);
                }
                for (Appointment appointment : appointmentCheckoutList) {
                    listAppointmentDetailApplied = appointmentDAO.listAppointmentDetailApplied(appointment.getId());
                    appointmentApplied.put(appointment, listAppointmentDetailApplied);
                }
                if (appointmentPendingList.size() != 0 || appointmentApplied.size() != 0) {
                    request.setAttribute("EMPLOYEE_APPOINTMENT_DETAIL_LIST", appointmentApplied);
                    request.setAttribute("EMPLOYEE_APPOINTMENT_LIST", appointmentPendingList);
                }

                if (appointmentCheckoutList.size() != 0 || appointmentApplied.size() != 0) {
                    request.setAttribute("EMPLOYEE_APPOINTMENT_DETAIL_LIST", appointmentApplied);
                    request.setAttribute("EMPLOYEE_APPOINTMENT_CHECKOUT_LIST", appointmentCheckoutList);
                }
//                
                List<Appointment> appointmentCancelledList = appointmentDAO.getListCancelledAppointment();
                if (appointmentCancelledList.size() == 0) {
                    msg = "nothing In Your List!";
                } else {
                    request.setAttribute("EMPLOYEE_APPOINTMENT_CANCELLED_LIST", appointmentCancelledList);
                    msg = "Success!";
                }
            }
            request.setAttribute("VIEW_ERROR_MSG", msg);
        } catch (Exception e) {
            log("Error at ViewCartServlet: " + e.toString());
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
