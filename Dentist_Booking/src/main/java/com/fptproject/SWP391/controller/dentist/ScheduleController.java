/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptproject.SWP391.controller.dentist;

import com.fptproject.SWP391.manager.dentist.ScheduleManager;
import com.fptproject.SWP391.model.DentistAvailiableTime;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hieunguyen
 */
@WebServlet(name = "ScheduleController", urlPatterns = {"/schedule/*"})
public class ScheduleController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

        ScheduleManager manager = null;
        DentistAvailiableTime availiableTime = null;

        String path = request.getPathInfo();

        switch (path) {
            case "show":

                break;
            case "save":
                save(request, response);
                break;

            default:
                throw new AssertionError();
        }
    }

    protected void save(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        ScheduleManager manager = null;
        DentistAvailiableTime availiableTime = null;
        String dentistId = request.getParameter("dentistId");
        int slot = Integer.valueOf(request.getParameter("slot"));
        String day = request.getParameter("day");
        availiableTime = new DentistAvailiableTime(dentistId, slot, day);
        manager = new ScheduleManager();
        manager.UpdateSchedule(availiableTime);
        request.setAttribute("dentistId", dentistId);
        request.setAttribute("slot", slot);
        request.setAttribute("day", day);
        request.getRequestDispatcher("/dentist/dentist-update-schedule.jsp").forward(request, response);
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
            Logger.getLogger(ScheduleController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ScheduleController.class.getName()).log(Level.SEVERE, null, ex);
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
