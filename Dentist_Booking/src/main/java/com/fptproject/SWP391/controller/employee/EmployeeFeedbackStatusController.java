/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptproject.SWP391.controller.employee;

import com.fptproject.SWP391.manager.employee.EmployeeFeedbackManager;
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
@WebServlet(name = "FeedbackStatusController", urlPatterns = {"/FeedbackStatusController"})
public class EmployeeFeedbackStatusController extends HttpServlet {

    private static final String ERROR = "ListFeedbackController";
    private static final String SUCCESS = "ListFeedbackController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String ID = request.getParameter("appointmentID");
            int status = Integer.valueOf(request.getParameter("status"));

            EmployeeFeedbackManager feedbackDAO = new EmployeeFeedbackManager();
            if (status == 0) {
                boolean check = feedbackDAO.setFeedBackStatus(ID, status);
                if (check) {
                    url = SUCCESS;
                    request.setAttribute("SUCCESS", "Feedback " + ID + " restricted!!");
                } else {
                    url = ERROR;
                    request.setAttribute("FAIL", "Error happen!!!!");
                }
            } else if (status == 2) {
                boolean check = feedbackDAO.setFeedBackStatus(ID, status);
                if (check) {
                    url = SUCCESS;
                    request.setAttribute("SUCCESS", "Feedback " + ID + " accepted!");
                } else {
                    url = ERROR;
                    request.setAttribute("FAIL", "Error happen!!!");
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
