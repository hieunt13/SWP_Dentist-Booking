/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptproject.SWP391.controller.customer.appointment;

import com.fptproject.SWP391.manager.customer.AppointmentManager;
import com.fptproject.SWP391.manager.customer.FeedbackManager;
import com.fptproject.SWP391.manager.employee.EmployeeAppointmentManager;
import com.fptproject.SWP391.model.Appointment;
import com.fptproject.SWP391.model.AppointmentDetail;
import com.fptproject.SWP391.model.Customer;
import com.fptproject.SWP391.model.Feedback;
import java.io.IOException;
import java.sql.Date;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
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
 * @author dangnguyen
 */
@WebServlet(name = "ViewAppointmentController", urlPatterns = {"/ViewAppointmentController"})
public class ViewAppointmentController extends HttpServlet {

    private static final String VIEW_BOOKING = "customer/customer-dashboard.jsp";
    private static final String LOGIN_PAGE = "login.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        String url = VIEW_BOOKING;
        try {
            ArrayList<Appointment> appointmentList = new ArrayList<Appointment>();
            ArrayList<Appointment> appointmentCheckoutList = new ArrayList<Appointment>();

            ArrayList<AppointmentDetail> listAppointmentDetailApplied = new ArrayList<>();
            AppointmentManager customerAppointmentDAO = new AppointmentManager();
            EmployeeAppointmentManager appointmentDAO = new EmployeeAppointmentManager();

            HttpSession session = request.getSession();
            Customer customer = (Customer) session.getAttribute("Login_Customer");
            String msg = "";
            if (customer == null) {
                url = LOGIN_PAGE;
                msg = "You Need Login To Process This Request!";
            } else {
                appointmentList = (ArrayList<Appointment>) customerAppointmentDAO.getListAppointment(customer.getId());
                appointmentCheckoutList = (ArrayList<Appointment>) appointmentDAO.getListCheckoutAppointment();

                HashMap<Appointment, ArrayList<AppointmentDetail>> appointmentApplied = new HashMap<>();

                for (Appointment appointment : appointmentList) {
                    listAppointmentDetailApplied = appointmentDAO.listAppointmentDetailApplied(appointment.getId());
                    appointmentApplied.put(appointment, listAppointmentDetailApplied);
                }

                if (appointmentList.size() != 0 || appointmentApplied.size() != 0) {
                    request.setAttribute("EMPLOYEE_APPOINTMENT_DETAIL_LIST", appointmentApplied);
                    request.setAttribute("EMPLOYEE_APPOINTMENT_LIST", appointmentList);
                }
//                
//                List<Appointment> appointmentList = appointmentDAO.getListAppointment(customer.getId());
                if (appointmentList.size() == 0) {
                    msg = "nothing In Your List!";
                } else {
                    request.setAttribute("APPOINTMENT_LIST", appointmentList);
                    msg = "Success!";
                }
            }
            
            //Notification for Customer
            for (Appointment appointment : appointmentList) {
                Date d1 = appointment.getMeetingDate();
                Date d2 = new Date(System.currentTimeMillis());
                Calendar cal_1 = Calendar.getInstance();
                Calendar cal_2 = Calendar.getInstance();
                int rs;
                cal_1.setTime(d1);
                cal_2.setTime(d2);
                if (cal_1.get(Calendar.YEAR) == cal_2.get(Calendar.YEAR)) {
                    if (cal_1.get(Calendar.MONTH) == cal_2.get(Calendar.MONTH)) {
                        rs = cal_1.get(Calendar.DAY_OF_MONTH) - cal_2.get(Calendar.DAY_OF_MONTH);
                        if (rs == 0 || rs == 1) {
                            request.setAttribute("Appointment_Noti", appointment);
                            request.setAttribute("Meeting_Date", appointment.getMeetingDate());
                            break;
                        }                       
                    }
                }

            }
            //Feedback list
            FeedbackManager dao = new FeedbackManager();
            List<Feedback> listFeedback = dao.getListFeedback();
            if (listFeedback != null){
                request.setAttribute("FEEDBACKLIST", listFeedback);
            }
            request.setAttribute("VIEW_ERROR_MSG", msg);
        } catch (SQLException e) {
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ViewAppointmentController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ViewAppointmentController.class.getName()).log(Level.SEVERE, null, ex);
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
