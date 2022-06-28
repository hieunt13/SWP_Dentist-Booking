/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptproject.SWP391.controller.employee;

import com.fptproject.SWP391.manager.dentist.DentistFeedbackManager;
import com.fptproject.SWP391.manager.employee.EmployeeAppointmentManager;
import com.fptproject.SWP391.manager.employee.EmployeeInvoiceManager;
import com.fptproject.SWP391.model.Customer;
import com.fptproject.SWP391.model.Employee;
import com.fptproject.SWP391.model.Feedback;
import com.fptproject.SWP391.model.Invoice;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "CreateInvoiceController", urlPatterns = {"/CreateInvoice"})
public class CreateInvoiceController extends HttpServlet {

    static final String VIEW_BOOKING = "appointmentEmployee";
    static final String LOGIN_PAGE = "login.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = VIEW_BOOKING;
        try {
            Invoice invoice = new Invoice();
            EmployeeInvoiceManager dao = new EmployeeInvoiceManager();
            HttpSession session = request.getSession();
            Employee employee = (Employee) session.getAttribute("Login_Employee");
            if (employee == null) {
                url = LOGIN_PAGE;
            } else {
                String id = invoice.getInvoiceNextID(dao.getMaxInvoiceID());
                String appointmentId = request.getParameter("appointmentId");
                String employeeId = employee.getId();
                int price = Integer.parseInt(request.getParameter("invoicePrice"));
                byte paymentMethod = 0;
                byte status = 1;

                EmployeeAppointmentManager appointmnetDAO = new EmployeeAppointmentManager();
                if (appointmnetDAO.checkAppointmentStatus(appointmentId) == false) {
                    request.setAttribute("CHECKOUT_FAILLED", "Fail to checkout <br> This appointment hasn't confirmed by dentist yet!!");
                } else {
                    boolean check = appointmnetDAO.updateFinishAppointment(appointmentId);
                    if (check) {
                        invoice = new Invoice(id, appointmentId, employeeId, price, paymentMethod, status);
                        if (dao.createInvoice(invoice)) {

                            url = VIEW_BOOKING;
                            request.setAttribute("CHECKOUT_SUCCESS", "Checkout successfully <br> Invoice has been created");
                        } else {
                            request.setAttribute("CHECKOUT_FAILLED", "fail to create invoice");
                        }
                    }
                }

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
