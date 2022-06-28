/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptproject.SWP391.controller.admin.customer;

import com.fptproject.SWP391.manager.admin.AdminAppointmentManager;
import com.fptproject.SWP391.manager.admin.AdminCustomerManager;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dangnguyen
 */
@WebServlet(name = "SetBlacklistController", urlPatterns = {"/admin/SetBlacklistController"})
public class AdminSetBlacklistController extends HttpServlet {

    private static final String ERROR = "../admin/AdminSearchCustomerController";
    private static final String SUCCESS = "../admin/AdminSearchCustomerController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {

            String ID = request.getParameter("customerID");
            AdminAppointmentManager appointmnetDAO = new AdminAppointmentManager();
            if (appointmnetDAO.checkDeleteCondition(ID) == false) {
                request.setAttribute("ERROR", "Fail to Restrict because this customer still appears in one or more appointments");
            } else {
                AdminCustomerManager customerDAO = new AdminCustomerManager();
                boolean check = customerDAO.restrictCustomer(ID);
                if (check) {
                    url = SUCCESS;
                    request.setAttribute("SUCCESS", "Restrict successfully");
                }
            }
        } catch (Exception e) {
            log("Error at AdminDeleteDentist Controller: " + e.toString());
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
