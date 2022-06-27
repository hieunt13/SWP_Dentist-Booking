/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptproject.SWP391.controller.employee;

import com.fptproject.SWP391.manager.customer.AppointmentManager;
import com.fptproject.SWP391.manager.employee.EmployeeAppointmentManager;
import com.fptproject.SWP391.model.Employee;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "UpdateAppointmentStatusController", urlPatterns = {"/UpdateAppointmentStatusController"})
public class UpdateAppointmentStatusController extends HttpServlet {

    private static final String ERROR = "../employee/employee-appointment-confirm.jsp";
    private static final String SUCCESS = "appointmentEmployee";
    private static final String LOGIN_PAGE = "login.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            Employee employee = (Employee) session.getAttribute("Login_Employee");
            String msg = "";
            if (employee == null) {
                url = LOGIN_PAGE;
                msg = "";
                request.setAttribute("LOGIN_REQUIREMENT", "You Need Login To Process This Request!");
            } else {
                String appointmentID = request.getParameter("appointmentID");
                EmployeeAppointmentManager appointmentDAO = new EmployeeAppointmentManager();
                AppointmentManager appointmentCustomerDAO = new AppointmentManager();
                Date meetingDate = appointmentCustomerDAO.getAppointmentForPurchase(appointmentID).getMeetingDate();
                Date now = new java.sql.Date(Calendar.getInstance().getTimeInMillis());
                //check whether meeting date is equal the current date or not 
                if ((meetingDate.getDate() == now.getDate()) && (meetingDate.getMonth() == now.getMonth()) && (meetingDate.getYear() == now.getYear())) {
                    boolean check = appointmentDAO.updatePendingAppointment(appointmentID);
                    if (check) {
                        url = SUCCESS;
                        request.setAttribute("CHECKIN_ALERT_SUCCESS", "Checkin sucessfully");
                    }
                }else{
                    url = SUCCESS;
                    request.setAttribute("CHECKIN_ALERT_FAILLED", "Appointment doesn't meet the due date!!");
                }
            }
        } catch (Exception e) {
            log("Error at Delete COntroller" + e.toString());
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateAppointmentStatusController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateAppointmentStatusController.class.getName()).log(Level.SEVERE, null, ex);
        }
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