/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptproject.SWP391.controller.employee;

import com.fptproject.SWP391.manager.customer.AppointmentDetailManager;
import com.fptproject.SWP391.manager.customer.EmployeeManager;
import com.fptproject.SWP391.manager.customer.InvoiceManager;
import com.fptproject.SWP391.manager.customer.PromotionManager;
import com.fptproject.SWP391.manager.customer.ServiceManager;
import com.fptproject.SWP391.manager.employee.EmployeeAppointmentManager;
import com.fptproject.SWP391.model.Appointment;
import com.fptproject.SWP391.model.AppointmentDetail;
import com.fptproject.SWP391.model.Employee;
import com.fptproject.SWP391.model.Invoice;
import com.fptproject.SWP391.model.Service;
import java.io.IOException;
import java.io.PrintWriter;
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
 * @author dangnguyen
 */
@WebServlet(name = "EmployeeInvoiceDetailController", urlPatterns = {"/EmployeeInvoiceDetail"})
public class EmployeeInvoiceDetailController extends HttpServlet {

    private static final String SUCCESS = "employee/invoice-detail.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String url = SUCCESS;

        try {
            String appointmentId = request.getParameter("appointmentId");
            ArrayList<Appointment> appointmentCheckoutList = new ArrayList<Appointment>();

            ArrayList<AppointmentDetail> listAppointmentDetailApplied;
            EmployeeAppointmentManager appointmentDAO;

                listAppointmentDetailApplied = new ArrayList<>();
                appointmentDAO = new EmployeeAppointmentManager();

                appointmentCheckoutList = (ArrayList<Appointment>) appointmentDAO.getInvoiceAppointment(appointmentId);

                HashMap<Appointment, ArrayList<AppointmentDetail>> appointmentApplied = new HashMap<>();

              
                for (Appointment appointment : appointmentCheckoutList) {
                    listAppointmentDetailApplied = appointmentDAO.invoiceDetailBeforePay(appointmentId);
                    appointmentApplied.put(appointment, listAppointmentDetailApplied);
                }
                if (appointmentCheckoutList.size() != 0 || appointmentApplied.size() != 0) {
                    request.setAttribute("EMPLOYEE_APPOINTMENT_DETAIL_LIST", appointmentApplied);
                    request.setAttribute("EMPLOYEE_APPOINTMENT_CHECKOUT_LIST", appointmentCheckoutList);
                }

            
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
