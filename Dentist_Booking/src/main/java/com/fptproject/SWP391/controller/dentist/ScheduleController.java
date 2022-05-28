/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptproject.SWP391.controller.dentist;

import com.fptproject.SWP391.manager.dentist.ScheduleManager;
import com.fptproject.SWP391.model.DentistAvailiableTime;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.time.DayOfWeek;
import java.util.ArrayList;
import java.util.List;
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
 * @author hieunguyen
 */
@WebServlet(name = "ScheduleController", urlPatterns = {"/schedule/*"})
public class ScheduleController extends HttpServlet {

    static List<Date> list = null;

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

        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect("../login.jsp");
            return;
        }

        String path = request.getPathInfo();

        switch (path) {
            case "/show":
                show(request, response);
                break;
            case "/add":
                add(request, response);
                break;
            case "/delete":
                delete(request, response);
                break;
            default:
                throw new AssertionError();
        }
    }

    protected void show(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String dentistId = request.getParameter("dentistId");
        
        //load list day of week
        List<String> dayOfWeeks = new ArrayList<>();
        ScheduleManager manager = new ScheduleManager();
             for (DayOfWeek c : DayOfWeek.values()){
                dayOfWeeks.add(c.toString().toLowerCase());
             }
        //init list for slots in each day of week
        List<DentistAvailiableTime> mondaySchedule = new ArrayList<>();
        List<DentistAvailiableTime> tuesdaySchedule = new ArrayList<>();
        List<DentistAvailiableTime> wednesdaySchedule = new ArrayList<>();
        List<DentistAvailiableTime> thursdaySchedule = new ArrayList<>();
        List<DentistAvailiableTime> fridaySchedule = new ArrayList<>();
        List<DentistAvailiableTime> saturdaySchedule = new ArrayList<>();
        List<DentistAvailiableTime> sundaySchedule = new ArrayList<>();

        //load slots in each day of week from dtb
        mondaySchedule = manager.show(dentistId, "Monday");
        tuesdaySchedule = manager.show(dentistId, "Tuesday");
        wednesdaySchedule = manager.show(dentistId, "Wednesday");
        thursdaySchedule = manager.show(dentistId, "Thursday");
        fridaySchedule = manager.show(dentistId, "Friday");
        saturdaySchedule = manager.show(dentistId, "Saturday");
        sundaySchedule = manager.show(dentistId, "Sunday");

        //send slots in each day of week to dentist-upload-schedule.jsp page
        request.setAttribute("mondaySchedule", mondaySchedule);
        request.setAttribute("tuesdaySchedule", tuesdaySchedule);
        request.setAttribute("wednesdaySchedule", wednesdaySchedule);
        request.setAttribute("thursdaySchedule", thursdaySchedule);
        request.setAttribute("fridaySchedule", fridaySchedule);
        request.setAttribute("saturdaySchedule", saturdaySchedule);
        request.setAttribute("sundaySchedule", sundaySchedule);
        request.setAttribute("dayofweek", dayOfWeeks);
        request.setAttribute("dentistId", dentistId);
        
        request.getRequestDispatcher("/dentist/dentist-update-schedule.jsp").forward(request, response);
    }

    protected void add(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        ScheduleManager manager = null;
        DentistAvailiableTime availiableTime = null;

        String day = request.getParameter("day");
        String dentistId = request.getParameter("dentistId");

        String slot1 = request.getParameter("slot1");
        String slot2 = request.getParameter("slot2");
        String slot3 = request.getParameter("slot3");
        String slot4 = request.getParameter("slot4");
        String slot5 = request.getParameter("slot5");
        String slot6 = request.getParameter("slot6");
        
        int[] slot = {1,2,3,4,5,6};
        if(slot1 == null){
            slot[0]=0;
        }
        if(slot2 == null){
            slot[1]=0;
        }
        if(slot3 == null){
            slot[2]=0;
        }
        if(slot4 == null){
            slot[3]=0;
        }
        if(slot5 == null){
            slot[4]=0;
        }
        if(slot6 == null){
            slot[5]=0;
        }
        
        manager = new ScheduleManager();
        manager.addSlots(dentistId,day,slot);
        response.sendRedirect("show?dentistId=" + dentistId);
    }

    protected void delete(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        ScheduleManager manager = null;
        DentistAvailiableTime availiableTime = null;
        String dentistId = request.getParameter("dentistId");
        int slot = Integer.valueOf(request.getParameter("slot"));
        String day = request.getParameter("day");
        availiableTime = new DentistAvailiableTime(dentistId, slot, day);
        manager = new ScheduleManager();
        manager.deleteSlot(availiableTime);
        response.sendRedirect("show?dentistId=" + dentistId);
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
