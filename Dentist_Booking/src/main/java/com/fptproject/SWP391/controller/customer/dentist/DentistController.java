/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptproject.SWP391.controller.customer.dentist;

import com.fptproject.SWP391.manager.customer.DentistManager;
import com.fptproject.SWP391.manager.dentist.DentistFeedbackManager;
import com.fptproject.SWP391.manager.dentist.DentistScheduleManager;
import com.fptproject.SWP391.model.Dentist;
import com.fptproject.SWP391.model.DentistAvailableTime;
import com.fptproject.SWP391.model.Feedback;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
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
@WebServlet(name = "DentistController", urlPatterns = {"/dentists/*"})
public class DentistController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String path = request.getPathInfo();
        switch (path) {
            case "/list":
                list(request, response);
                break;
            case "/detail":
                detail(request, response);
                break;
            case "/search":
                search(request, response);
                break;
            case "/sort":
                sort(request, response);
                break;
            default:
                throw new AssertionError();
        }
    }

    //show all dentist
    protected void list(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        ArrayList<Dentist> list = new ArrayList<>();
        DentistManager manager = new DentistManager();
        list = manager.list();
        List<Dentist> pagingList = DentistController.paging(list, 1, 5);
        for (Dentist dentist : pagingList) {
            System.out.println(dentist.getId());
        }
        request.setAttribute("list", list);
        request.getRequestDispatcher("/customer/dentist.jsp").forward(request, response);
    }

    protected void sort(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        ArrayList<Dentist> list = new ArrayList<>();
        String sortRequest = request.getParameter("column");

        //check if sort button click without any select type or column
        if (sortRequest == null || sortRequest.equals("")) {
            response.sendRedirect(request.getContextPath() + "/dentists/list");
            return;
        }

        //take each part of parameter sortRequest(column-type)
        String[] part = sortRequest.split("-");
        String column = part[0];
        String type = part[1];

        //take the sorted list from dtb
        DentistManager manager = new DentistManager();
        list = manager.sort(column, type);

        request.setAttribute("sortRequest", sortRequest);
        request.setAttribute("list", list);
        request.getRequestDispatcher("/customer/dentist.jsp").forward(request, response);

    }

    protected void search(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        ArrayList<Dentist> list = new ArrayList<>();
        String nameSearch = request.getParameter("nameSearch");

        //check if nameSearch don't contain any value then redirect to show all dentists
        if (nameSearch == null || nameSearch.equals("")) {
            response.sendRedirect(request.getContextPath() + "/dentists/list");
            return;
        }

        DentistManager manager = new DentistManager();
        list = manager.search(nameSearch);
        if (list == null || list.size() < 1) {
            request.setAttribute("searchMsg", "No dentists were found to match your search!!");
        }

        request.setAttribute("nameSearch", nameSearch);
        request.setAttribute("list", list);
        request.getRequestDispatcher("/customer/dentist.jsp").forward(request, response);

    }

    protected void detail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        //take dentist id
        String dentistId = request.getParameter("id");

        //take dentist's information
        DentistManager manager = new DentistManager();
        Dentist dentist = new Dentist();
        dentist = manager.showDetail(dentistId);

        //take dentist's feedbacks
        DentistFeedbackManager feedbackManager = new DentistFeedbackManager();
        List<Feedback> listFeedback = feedbackManager.list(dentistId);

        //
        DentistScheduleManager scheduleManager = new DentistScheduleManager();
        //init list for slots in each day of week
        List<DentistAvailableTime> mondaySchedule = new ArrayList<>();
        List<DentistAvailableTime> tuesdaySchedule = new ArrayList<>();
        List<DentistAvailableTime> wednesdaySchedule = new ArrayList<>();
        List<DentistAvailableTime> thursdaySchedule = new ArrayList<>();
        List<DentistAvailableTime> fridaySchedule = new ArrayList<>();
        List<DentistAvailableTime> saturdaySchedule = new ArrayList<>();
        List<DentistAvailableTime> sundaySchedule = new ArrayList<>();

        //load slots in each day of week from dtb
        mondaySchedule = scheduleManager.show(dentistId, "Monday");
        tuesdaySchedule = scheduleManager.show(dentistId, "Tuesday");
        wednesdaySchedule = scheduleManager.show(dentistId, "Wednesday");
        thursdaySchedule = scheduleManager.show(dentistId, "Thursday");
        fridaySchedule = scheduleManager.show(dentistId, "Friday");
        saturdaySchedule = scheduleManager.show(dentistId, "Saturday");
        sundaySchedule = scheduleManager.show(dentistId, "Sunday");

        //send slots in each day of week to dentist-upload-schedule.jsp page
        request.setAttribute("mondaySchedule", mondaySchedule);
        request.setAttribute("tuesdaySchedule", tuesdaySchedule);
        request.setAttribute("wednesdaySchedule", wednesdaySchedule);
        request.setAttribute("thursdaySchedule", thursdaySchedule);
        request.setAttribute("fridaySchedule", fridaySchedule);
        request.setAttribute("saturdaySchedule", saturdaySchedule);
        request.setAttribute("sundaySchedule", sundaySchedule);

        request.setAttribute("listFeedback", listFeedback);
        request.setAttribute("dentist", dentist);
        request.getRequestDispatcher("/customer/dentist-detail.jsp").forward(request, response);
    }

    /**
     * Paging function
     *
     * @param list the list need to paging
     * @param pageIndex the specific page index
     * @param entries the number of elements show in one page
     * @return new <code>java.util.List</code> contain elements in one page
     */
    public static List paging(List list, int pageIndex, int entries) {
        List pagingList = new ArrayList(); //now list for paging
        int begin = 0; //begin elements of page
        int end; //end elements of page
        begin = (pageIndex - 1) * entries; 
        end = begin + entries;
        for (int i = begin; i < end; i++) {
            if (list.get(i) != null) {
                pagingList.add(list.get(i));
            }
        }
        return pagingList;
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
            Logger.getLogger(DentistController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(DentistController.class.getName()).log(Level.SEVERE, null, ex);
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
