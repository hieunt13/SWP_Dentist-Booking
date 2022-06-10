/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptproject.SWP391.controller.customer.appointment;

import com.fptproject.SWP391.manager.customer.AppointmentManager;
import com.fptproject.SWP391.manager.customer.DentistManager;
import com.fptproject.SWP391.manager.customer.ServiceManager;
import com.fptproject.SWP391.manager.dentist.ScheduleManager;
import com.fptproject.SWP391.model.Appointment;
import com.fptproject.SWP391.model.AppointmentDetail;
import com.fptproject.SWP391.model.Dentist;
import com.fptproject.SWP391.model.DentistAvailiableTime;
import com.fptproject.SWP391.model.Service;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
@WebServlet(name = "AppointmentController", urlPatterns = {"/appointment/*"})
public class AppointmentController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        HttpSession session = request.getSession(false);
        Object dentist = session.getAttribute("Login_Customer");
        if (dentist == null || dentist.equals("")) {
            response.sendRedirect("../login.jsp");
            return;
        }
        String path = request.getPathInfo();
        switch (path) {
            case "/booking":
                booking(request, response);
                break;
            case "/book":
                book(request, response);
                break;
            default:
                throw new AssertionError();
        }

    }

    protected void book(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
//        String customerEmail = request.getParameter("customerEmail");
//        String customerPhone = request.getParameter("customerPhone");
//        String customerName = request.getParameter("customerName");

        //call manager for appointment
        AppointmentManager appointmentManager = new AppointmentManager();

        //get parameter
        String dentistId = request.getParameter("dentistId");
        String customerId = request.getParameter("customerId");

        //convert String to LocalDate
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("d/M/yyyy");
        String date = request.getParameter("date");
        LocalDate localDate = LocalDate.parse(date, formatter);
        Date meetingDate = Date.valueOf(localDate);

        String customerSymtom = request.getParameter("customerSymtom");
        String[] serviceId = request.getParameterValues("serviceId");
        String[] promotionId = request.getParameterValues("promotionId");
        String[] slot = request.getParameterValues("slot");

        //check whether the services picked duplicated or not 
        if (serviceId[0].equalsIgnoreCase(serviceId[1])) {
            request.setAttribute("customerId", customerId);
            request.setAttribute("customerSymtom", customerSymtom);
            request.setAttribute("serviceId", serviceId);
            request.setAttribute("promotionId", promotionId);
            request.setAttribute("serviceErrorMsg", "Services picked cannot be duplicated!");
            request.getRequestDispatcher("/appointment/booking?dentistId=" + dentistId).forward(request, response);
            return;
        }
        //length of slot's string for taking number (1) of 'Slot no(1)'
        int defaultSlotLength = slot[0].length() - 1;
        byte paymentConfirm = 0;
        byte dentistConfirm = 1;
        int status = 1;
        //init appointment id in format of APddMMYYYYQUANTITY
        String id = "AP" + localDate.getDayOfMonth() + localDate.getMonthValue() + localDate.getYear() + (appointmentManager.getQuantityOfAppointmentInOneDay(meetingDate) + 1);

        //init appointment
        AppointmentDetail[] appointmentDetail = new AppointmentDetail[2];
        Appointment appointment = new Appointment(id, dentistId, customerId, meetingDate, customerSymtom, status, paymentConfirm, dentistConfirm);

        //init array of appointmentdetail include serviceId and slot
        for (int i = 0; i < serviceId.length; i++) {
            if (serviceId[i].contains("SV") && slot[i].length() == defaultSlotLength) {
                appointmentDetail[i] = new AppointmentDetail(id, serviceId[i], Integer.valueOf(String.valueOf(slot[i].charAt(defaultSlotLength))));
            }
        }

        //check whether insert appointment into dtb successfully or not
        if (appointmentManager.makeAppointment(appointment, appointmentDetail)) {
            request.setAttribute("appointmentMsg", "Book appointment successfully!!");
        }

        request.getRequestDispatcher("/appointment/booking?dentistId=" + dentistId).forward(request, response);
    }

    protected void booking(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

        String dentistId = request.getParameter("dentistId");

        String[] servicesId = request.getParameterValues("serviceId");

        //take list of dentists for another choices
        List<Dentist> listDentists = new ArrayList<>();
        DentistManager dentistManager = new DentistManager();
        listDentists = dentistManager.list();
        request.setAttribute("dentists", listDentists);

        //set dentistId if there is no param for the first time access
        if (dentistId == null || dentistId.equals("")) {
            dentistId = listDentists.get(0).getId();
        }

        //load available slot of dentist
        List<DentistAvailiableTime> mondaySchedule = new ArrayList<>();
        List<DentistAvailiableTime> tuesdaySchedule = new ArrayList<>();
        List<DentistAvailiableTime> wednesdaySchedule = new ArrayList<>();
        List<DentistAvailiableTime> thursdaySchedule = new ArrayList<>();
        List<DentistAvailiableTime> fridaySchedule = new ArrayList<>();
        List<DentistAvailiableTime> saturdaySchedule = new ArrayList<>();
        List<DentistAvailiableTime> sundaySchedule = new ArrayList<>();

        //load dentist's available slots in each day of week from dtb
        ScheduleManager manager = new ScheduleManager();
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

        //send dentistId picked
        request.setAttribute("dentistId", dentistId);

        //take list of services for another choices
        List<Service> listService = new ArrayList<>();
        ServiceManager serviceManager = new ServiceManager();
        listService = serviceManager.list();
        request.setAttribute("services", listService);

        //send servicesId picked
        request.setAttribute("servicesId", servicesId);

        request.getRequestDispatcher("/customer/book-appointment.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
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
            Logger.getLogger(AppointmentController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(AppointmentController.class.getName()).log(Level.SEVERE, null, ex);
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
