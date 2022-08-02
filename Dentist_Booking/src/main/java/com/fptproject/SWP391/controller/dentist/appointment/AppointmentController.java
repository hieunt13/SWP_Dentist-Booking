/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptproject.SWP391.controller.dentist.appointment;

import com.fptproject.SWP391.manager.customer.AppointmentManager;
import com.fptproject.SWP391.manager.customer.CustomerManager;
import com.fptproject.SWP391.manager.customer.DentistManager;
import com.fptproject.SWP391.manager.customer.ServiceManager;
import com.fptproject.SWP391.manager.dentist.DentistAppointmentManager;
import com.fptproject.SWP391.manager.dentist.DentistScheduleManager;
import com.fptproject.SWP391.model.Appointment;
import com.fptproject.SWP391.model.AppointmentDetail;
import com.fptproject.SWP391.model.Customer;
import com.fptproject.SWP391.model.Dentist;
import com.fptproject.SWP391.model.DentistAvailableTime;
import com.fptproject.SWP391.model.Service;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Time;
import java.time.LocalDate;
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
 * @author minha
 */
@WebServlet(name = "ConfirmAppointmentController", urlPatterns = {"/dentist/AppointmentController/*"})
public class AppointmentController extends HttpServlet {

    private static final String ERROR = "../dentist/Dashboard";
    private static final String SUCCESS = "../dentist/Dashboard";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String path = request.getPathInfo();

        //first attempt to dentist appointment page
        if (path == null) {
            response.setContentType("text/html;charset=UTF-8");
            String url = ERROR;
            try {
                HttpSession session = request.getSession();
                Dentist dentist = (Dentist) session.getAttribute("Login_Dentist");
                DentistAppointmentManager appointmentDAO = new DentistAppointmentManager();
                List<Appointment> appointmentList = appointmentDAO.getListAppointment(dentist.getId());
                List<Customer> customerList = null;
                for (Appointment appointment : appointmentList) {
                    customerList = appointmentDAO.getListCustomer(appointment.getCustomerId());
                }
                if (!appointmentList.isEmpty()) {
                    request.setAttribute("LIST_APPOINTMENT_DENTIST", appointmentList);
                    url = SUCCESS;
                }else request.setAttribute("SUCCESS", "Nothing is on your list");
                if (!customerList.isEmpty()) {
                    request.setAttribute("LIST_CUSTOMER_DENTIST", appointmentList);
                    url = SUCCESS;
                }
                Date now = new Date(System.currentTimeMillis());
                String a = now.toString();
                request.setAttribute("NOW", a);
            } catch (SQLException e) {
                log("Error at Appointment Controller" + e.toString());
            } finally {
                request.getRequestDispatcher(url).forward(request, response);
                return;
            }
        }

        switch (path) {
            case "/booking":
                //move to appointment booking page
                booking(request, response);
                break;
            case "/book":
                //make a appointment
                book(request, response);
                break;
            default:
                throw new NullPointerException();
        }

    }

    private void book(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

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
        int status = 1;//status (APPOINTMENT) : 0 is cancel, 1 is book success, 2 is checkin, 3 is complete appointment

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
            request.getRequestDispatcher("/dentist/AppointmentController/booking?dentistId=" + dentistId).forward(request, response);
            return;
        }

        //redirect to appointment page
        response.sendRedirect(request.getContextPath() + "/dentist/AppointmentController");
    }

    private void booking(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

        AppointmentManager appointmentManager = new AppointmentManager();

        //taking information
        String dentistId = request.getParameter("dentistId");
        String customerId = request.getParameter("customerId");
        String[] servicesId = request.getParameterValues("serviceId");

        //check if customer already have a appointment booked or not 
        if (appointmentManager.checkAppointmentOfCustomer(customerId)) {
            String paramMsg = "You cannot book any appointment for this customer because this customer already have an appointment which hasn't been completed yet!";
            response.sendRedirect(request.getContextPath() + "/dentist/AppointmentController" + "?Msg=" + paramMsg);
            return;
        }

        //take customer infomation
        CustomerManager customerManager = new CustomerManager();
        Customer customer = customerManager.show(customerId);
        request.setAttribute("customer", customer);

        //take dentist information
        DentistManager dentistManager = new DentistManager();
        Dentist dentist = dentistManager.showDetail(dentistId);
        request.setAttribute("dentist", dentist);

        //create list for available slots in each day of week
        List<DentistAvailableTime> mondaySchedule = new ArrayList<>();
        List<DentistAvailableTime> tuesdaySchedule = new ArrayList<>();
        List<DentistAvailableTime> wednesdaySchedule = new ArrayList<>();
        List<DentistAvailableTime> thursdaySchedule = new ArrayList<>();
        List<DentistAvailableTime> fridaySchedule = new ArrayList<>();
        List<DentistAvailableTime> saturdaySchedule = new ArrayList<>();
        List<DentistAvailableTime> sundaySchedule = new ArrayList<>();

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

        request.getRequestDispatcher("/dentist/dentist-book-appointment.jsp").forward(request, response);
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
