/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptproject.SWP391.controller.customer.appointment;

import com.fptproject.SWP391.manager.customer.AppointmentManager;
import com.fptproject.SWP391.manager.customer.CustomerManager;
import com.fptproject.SWP391.manager.customer.DentistManager;
import com.fptproject.SWP391.manager.customer.ServiceManager;
import com.fptproject.SWP391.manager.dentist.DentistScheduleManager;
import com.fptproject.SWP391.model.Appointment;
import com.fptproject.SWP391.model.AppointmentDetail;
import com.fptproject.SWP391.model.Customer;
import com.fptproject.SWP391.model.Dentist;
import com.fptproject.SWP391.model.DentistAvailiableTime;
import com.fptproject.SWP391.model.Mail;
import com.fptproject.SWP391.model.Service;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
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
        //check whether session is created or not
        HttpSession session = request.getSession(false);
        Object customer = session.getAttribute("Login_Customer");
        if (customer == null || customer.equals("")) {
            response.sendRedirect("../login.jsp");
            return;
        }

        String path = request.getPathInfo();
        switch (path) {
            case "/booking":
                //move to appointment booking page
                booking(request, response);
                break;
            case "/book":
                //make a appointment
                book(request, response);
                break;
            case "/cancel":
                //cancel a appointment
                cancel(request, response);
                break;
            default:
                throw new AssertionError();
        }
    }

    private void book(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        //call manager for appointment
        AppointmentManager appointmentManager = new AppointmentManager();

        //get parameter
        String dentistId = request.getParameter("dentistId");
        String customerId = request.getParameter("customerId");

        //convert String to SQLDate using LocalDate
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("d/M/yyyy");
        String date = request.getParameter("date");
        LocalDate localDate = LocalDate.parse(date, formatter);
        Date meetingDate = Date.valueOf(localDate);

        //taking the time when customer books successfully
        long now = System.currentTimeMillis();
        Time bookTime = new Time(now);

        //taking the current day for book date
        Date bookDate = new Date(System.currentTimeMillis());
        
        String customerSymtom = request.getParameter("customerSymtom");
        String[] serviceId = request.getParameterValues("serviceId");
        String[] slot = request.getParameterValues("slot");

        //set status of appointment
        byte paymentConfirm = 0; //payment_confirm ( IN APPOINTMENT TABLE) : 0 is not confirm, 1 is confirm
        byte dentistConfirm = 0; //dentist_confirm ( IN APPOINTMENT TABLE) : 0 is not done yet, 1 is done
        int status = 1; //status (APPOINTMENT) : 0 is cancel, 1 is book success, 2 is checkin, 3 is complete appointment

        //init appointment id in format of APddMMYYYYQUANTITY
        String id = "AP" + localDate.getDayOfMonth() + localDate.getMonthValue() + localDate.getYear() + (appointmentManager.getQuantityOfAppointmentInOneDay(meetingDate) + 1);

        //counting number of service picked for appointment detail
        int noOfService = 0;
        for (int i = 0; i < serviceId.length; i++) {
            if (!serviceId[i].isEmpty()) {
                noOfService++;
            }
        }

        //init appointment
        AppointmentDetail[] appointmentDetail = new AppointmentDetail[noOfService];
        Appointment appointment = new Appointment(id, dentistId, customerId, meetingDate, customerSymtom, bookTime, status, paymentConfirm, dentistConfirm);
        appointment.setBookDate(bookDate);
        
        //init array of appointmentdetail include serviceId and slot
        for (int i = 0; i < serviceId.length; i++) {
            if (i == 1 && serviceId[i - 1].isEmpty()) {
                int defaultSlotLength = slot[i].length() - 1;//length of slot's string for taking number (1) of 'Slot no(1)'
                appointmentDetail[i - 1] = new AppointmentDetail(id, serviceId[i], Integer.valueOf(String.valueOf(slot[i].charAt(defaultSlotLength))));
                break;
            }
            if (!serviceId[i].isEmpty()) {
                int defaultSlotLength = slot[i].length() - 1;//length of slot's string for taking number (1) of 'Slot no(1)'
                appointmentDetail[i] = new AppointmentDetail(id, serviceId[i], Integer.valueOf(String.valueOf(slot[i].charAt(defaultSlotLength))));
            }
        }

        //check whether insert appointment into dtb successfully or not
        if (!appointmentManager.makeAppointment(appointment, appointmentDetail)) {
            request.setAttribute("appointmentMsg", "Book appointment unsuccessfully!!");
            request.getRequestDispatcher("/appointment/booking?dentistId=" + dentistId).forward(request, response);
        }
        
        //send mail
        CustomerManager customerDAO = new CustomerManager();
        DentistManager dentistDAO = new DentistManager();
        ServiceManager serviceDAO = new ServiceManager();
        HashMap<String,Service> serviceMap = new HashMap();
        for(AppointmentDetail detail : appointmentDetail){
            serviceMap.put(detail.getServiceId(), serviceDAO.getServiceForPurchase(detail.getServiceId()));
        }
        Mail sendMail = new Mail();
        sendMail.send(appointment, appointmentDetail, customerDAO.show(appointment.getCustomerId()), dentistDAO.getDentistForPayment(appointment.getDentistId()), serviceMap);
        
        response.sendRedirect(request.getContextPath() + "/ViewAppointmentController");
    }

    private void booking(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        HttpSession session = request.getSession(false);
        Customer customer = (Customer) session.getAttribute("Login_Customer");
        AppointmentManager appointmentManager = new AppointmentManager();
        
        //check if customers have booked an appointment then don't allow them to book again
        if(appointmentManager.checkAppointmentOfCustomer(customer.getId())){
            String paramCancelMsg = "You cannot book any appointment because of having an appointment which hasn't been completed yet!";
            response.sendRedirect(request.getContextPath() + "/ViewAppointmentController" + "?cancelMsg=" + paramCancelMsg);
            return;
        }
        
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
        DentistScheduleManager scheduelManager = new DentistScheduleManager();
        mondaySchedule = scheduelManager.show(dentistId, "Monday");
        tuesdaySchedule = scheduelManager.show(dentistId, "Tuesday");
        wednesdaySchedule = scheduelManager.show(dentistId, "Wednesday");
        thursdaySchedule = scheduelManager.show(dentistId, "Thursday");
        fridaySchedule = scheduelManager.show(dentistId, "Friday");
        saturdaySchedule = scheduelManager.show(dentistId, "Saturday");
        sundaySchedule = scheduelManager.show(dentistId, "Sunday");

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

        //get slot picked by another customers
        HashMap<AppointmentDetail, Date> slotUnavailable = appointmentManager.listAppointmentTime();
        request.setAttribute("slotUnavailable", slotUnavailable);

        request.getRequestDispatcher("/customer/book-appointment.jsp").forward(request, response);
    }

    private void cancel(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        
        String paramCancelMsg = "";
        String appointmentId = request.getParameter("appointmentId");
        String bookTime = request.getParameter("bookTime");
        String bookDateString = request.getParameter("bookDate");

        //take current dateand appointment's bookDate
        Date nowDate = new Date(System.currentTimeMillis());
        Date bookDate = Date.valueOf(bookDateString);
        
        //take current time and appointment's bookTime
        LocalTime bookLocalTime = LocalTime.parse(bookTime);
        LocalTime now = LocalTime.now();
        
        //check if time of appointment is over 2 hours after bookTime or not
        if ((nowDate.getDay() == bookDate.getDay() && nowDate.getMonth()== bookDate.getMonth() && nowDate.getYear() == bookDate.getYear()) && now.isBefore(bookLocalTime.plusHours(2))) {
            AppointmentManager appointmentManager = new AppointmentManager();
            if (appointmentManager.cancel(appointmentId)) {
                paramCancelMsg = "Your appointment is canceled!!";
            } else {
                paramCancelMsg = "Fail to cancel your appointment!";
            }
        } else {
            paramCancelMsg = "Time for canceling is over! You can only cancel in 2 hours after booking!";
        }
        response.sendRedirect(request.getContextPath() + "/ViewAppointmentController" + "?cancelMsg=" + paramCancelMsg);
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
