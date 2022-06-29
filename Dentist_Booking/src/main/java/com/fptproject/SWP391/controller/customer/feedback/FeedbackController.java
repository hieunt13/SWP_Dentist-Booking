/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptproject.SWP391.controller.customer.feedback;

import com.fptproject.SWP391.manager.customer.FeedbackManager;
import com.fptproject.SWP391.model.Feedback;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hieunguyen
 */
@WebServlet(name = "FeedbackController", urlPatterns = {"/customer/Feedback"})
public class FeedbackController extends HttpServlet {

    private static final String ERROR = "../customer/customer-dashboard.jsp";
    private static final String SUCCESS = "../ViewAppointmentController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String appointmentId = request.getParameter("appointment_id");
            String dentistMessage = request.getParameter("feedbackText");
            if (dentistMessage == null) {
                dentistMessage = "none";
            }
            String rating = request.getParameter("star");
            if (rating == null) {
                rating = "0";
            }
            FeedbackManager dao = new FeedbackManager();
            //List<Feedback> list = dao.getListFeedback();
            Feedback feedback = new Feedback();
            String id = feedback.getFeedbackNextID(dao.getMaxFeedbackID());
            feedback = new Feedback(id, appointmentId, Integer.parseInt(rating), dentistMessage, (byte) 1);
            if (dao.createFeedback(feedback)) {
                url = SUCCESS;
            }
        } catch (Exception e) {
            log("Error at Feedback Controller" + e.toString());
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
