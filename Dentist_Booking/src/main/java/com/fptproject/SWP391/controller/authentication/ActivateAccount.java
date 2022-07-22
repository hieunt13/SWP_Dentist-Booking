/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptproject.SWP391.controller.authentication;

import com.fptproject.SWP391.manager.customer.CustomerManager;
import com.fptproject.SWP391.model.Customer;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import javax.persistence.metamodel.SetAttribute;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author admin
 */
@WebServlet(name = "ActivateAccount", urlPatterns = {"/ActivateAccount"})
public class ActivateAccount extends HttpServlet {
    private static final String ERROR = "verify.jsp";
    private static final String SUCCESS = "verify.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url= ERROR;
        try{
            String idHash = request.getParameter("idHash");
            CustomerManager customerDAO = new CustomerManager();
            Customer customer = customerDAO.getCustomerForActivation(idHash);
            if(customer != null){
                //create expired date
                Calendar cal = Calendar.getInstance();
                cal.setTime(customer.getCreateDate());
                cal.add(Calendar.DAY_OF_MONTH, 1);
                Date expiredDatetime = new Date(cal.getTime().getTime());
                Date currenetDatetime = new Date(System.currentTimeMillis());
                if(currenetDatetime.compareTo(expiredDatetime) <= 0){
                    switch (customer.getStatus()) {
                        case 2:
                            if(customerDAO.activateAccount(idHash)){
                                request.setAttribute("SUCCESS", "Your account is activated successfully");
                                url = SUCCESS;
                            }
                            break;
                        default:
                            request.setAttribute("ERROR","Your account has already been activated");
                    }
                }else{
                    request.setAttribute("ERROR", "This link was expired. (Note: Your account will be deleted after 1 hour when the link is expired\\)");
                }
            }else{
                request.setAttribute("ERROR", "Invalid id found");
            }
            
        }catch(Exception e){
            log("Error at ActivateAccount Controller: "+e.toString());
        }finally{
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
