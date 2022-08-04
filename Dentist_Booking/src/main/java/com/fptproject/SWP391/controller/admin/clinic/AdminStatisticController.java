/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptproject.SWP391.controller.admin.clinic;

import com.fptproject.SWP391.manager.admin.AdminCustomerManager;
import com.fptproject.SWP391.manager.admin.AdminDentistManager;
import com.fptproject.SWP391.manager.admin.AdminStatisticManager;
import com.fptproject.SWP391.model.Customer;
import com.fptproject.SWP391.model.Dentist;
import com.fptproject.SWP391.model.Invoice;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author minha
 */
@WebServlet(name = "AdminStatisticController", urlPatterns = {"/admin/AdminStatistic"})
public class AdminStatisticController extends HttpServlet {

    private static final String ERROR = "../admin/index.jsp";
    private static final String SUCCESS = "../admin/index.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            //statistic tabs
            AdminStatisticManager dao = new AdminStatisticManager();
            int numOfAppoinment = dao.countAppointment();
            request.setAttribute("NUM_OF_APPOINTMENT", numOfAppoinment);
            int numOfDentist = dao.countDentist();
            request.setAttribute("NUM_OF_DENTIST", numOfDentist);
            int numOfCustomer = dao.countCustomer();
            request.setAttribute("NUM_OF_CUSTOMER", numOfCustomer);
            int sumOfRevenue = dao.sumRevenue();
            request.setAttribute("SUM_OF_REVENUE", sumOfRevenue);

            //dentist list
            AdminDentistManager daoDentist = new AdminDentistManager();
            List<Dentist> dentistList = daoDentist.getAllListDentist();
            if (!dentistList.isEmpty()) {
                request.setAttribute("LIST_DENTIST", dentistList);
            }
            
            //dentist earn
            List<Invoice> invoiceList = daoDentist.getInvoice();
            if (!invoiceList.isEmpty()) {
                request.setAttribute("LIST_INVOICE", invoiceList);
            }
            //customer list
            AdminCustomerManager daoCustomer = new AdminCustomerManager();
            List<Customer> customerList = daoCustomer.getAllListCustomer();
            if (!customerList.isEmpty()) {
                request.setAttribute("LIST_CUSTOMER", customerList);
            }
            
            url = SUCCESS;
        } catch (Exception e) {
            log("Error at AdminStatisticController: " + e.toString());
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
