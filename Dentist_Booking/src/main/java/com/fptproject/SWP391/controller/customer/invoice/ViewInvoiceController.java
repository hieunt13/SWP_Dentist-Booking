/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptproject.SWP391.controller.customer.invoice;

import com.fptproject.SWP391.manager.customer.AppointmentManager;
import com.fptproject.SWP391.manager.customer.InvoiceManager;
import com.fptproject.SWP391.model.Appointment;
import com.fptproject.SWP391.model.Customer;
import com.fptproject.SWP391.model.Invoice;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author admin
 */
@WebServlet(name = "ViewInvoiceController", urlPatterns = {"/ViewInvoiceController"})
public class ViewInvoiceController extends HttpServlet {
    private static final String ERROR = "customer/invoices.jsp";
    private static final String SUCCESS = "customer/invoices.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            Customer customer = (Customer) session.getAttribute("Login_Customer");
            AppointmentManager appointmentDAO = new AppointmentManager();
            InvoiceManager invoiceDAO = new InvoiceManager();
            List<Appointment> appointmentList = appointmentDAO.getListAppointment(customer.getId());
            List<Invoice> invoiceList = new ArrayList<>();
            Invoice invoice = null;
            for( Appointment appointment : appointmentList ){
                invoice = invoiceDAO.getInvoiceByAppointmentID(appointment.getId());
                if(invoice!=null){
                    invoiceList.add(invoice);
                }
            }
            if(invoiceList.size()>0){
                request.setAttribute("LIST_INVOICE", invoiceList);
                url = SUCCESS;
            }
        } catch (Exception e) {
            log("Error at ViewInvoiceController: " + e.toString());
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
