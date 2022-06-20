/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptproject.SWP391.controller.customer.appointment;

import com.fptproject.SWP391.model.Appointment;
import com.fptproject.SWP391.model.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.Calendar;
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
@WebServlet(name = "NotificationController", urlPatterns = {"/NotificationController"})
public class NotificationController extends HttpServlet {
    private static final String VIEW_NOTI = "customer/customer-dashboard.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = VIEW_NOTI;
        try{
            HttpSession session = request.getSession();
            Customer customer = (Customer) session.getAttribute("Login_Customer");
            List<Appointment> appointmentList = (List<Appointment>) request.getAttribute("APPOINTMENT_LIST");
            for (Appointment appointment : appointmentList) {
                Date d1 = appointment.getMeetingDate();
                Date d2 = new Date(System.currentTimeMillis());
                Calendar cal = Calendar.getInstance();
                cal.setTime(d1);
                cal.add(Calendar.DAY_OF_MONTH, 1);
                Date dnew = new Date(cal.getTime().getTime());
                if ((dnew.equals(d2) || d1.equals(d2)) && customer.getId().equals(appointment.getCustomerId()) && appointment.getStatus()==1) {
                    request.setAttribute("Appointment_Noti", appointment);
                }
            }
        }catch (Exception e){
            log("Error at Notification Controller:"+e.toString());
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
