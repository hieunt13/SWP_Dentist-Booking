/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptproject.SWP391.controller.employee;

import com.fptproject.SWP391.manager.dentist.DentistFeedbackManager;
import com.fptproject.SWP391.model.Employee;
import com.fptproject.SWP391.model.Feedback;
import java.io.IOException;
import java.util.List;
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
@WebServlet(name = "ListFeedbackController", urlPatterns = {"/ListFeedbackController"})
public class ListFeedbackController extends HttpServlet {

    private static final String VIEW_BOOKING = "employee/employee-dashboard.jsp";
    private static final String LOGIN_PAGE = "login.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = VIEW_BOOKING;
        
        try {
            HttpSession session = request.getSession();
            Employee employee = (Employee) session.getAttribute("Login_Employee");
            String msg = "";
            if (employee == null) {
                url = LOGIN_PAGE;
                msg = "You Need Login To Process This Request!";
            } else {
                DentistFeedbackManager feedbackDAO = new DentistFeedbackManager();
                List<Feedback> feedbackList = (List<Feedback>) feedbackDAO.listFeedback();
                if (feedbackList.size() == 0) {
                    msg = "nothing In Your List!";
                } else {
                    request.setAttribute("FEEDBACK_LIST", feedbackList);
                    msg = "Success!";
                }
            }
            request.setAttribute("VIEW_ERROR_MSG", msg);
        } catch (Exception e) {
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
