/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptproject.SWP391.controller.admin.service;

import com.fptproject.SWP391.error.ServiceError;
import com.fptproject.SWP391.manager.admin.AdminServiceManager;
import com.fptproject.SWP391.model.Service;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author admin
 */
@WebServlet(name = "AdminCreateServiceController", urlPatterns = {"/AdminCreateServiceController"})
public class AdminCreateServiceController extends HttpServlet {
    private static final String ERROR = "admincreateservice.jsp";
    private static final String SUCCESS = "admincreateservice.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        ServiceError serviceError = new ServiceError();
        //id, service_name, promotion_id, short_description, long_description, price, image, status
        try {
            boolean checkError = false;
            Service service = new Service();
            AdminServiceManager dao = new AdminServiceManager();
            String serviceName = request.getParameter("serviceName");
            String promotionId = request.getParameter("promotionId");
            String shortDescription = request.getParameter("shortDescription");
            String longDescription = request.getParameter("longDescription");
            int price = Integer.parseInt(request.getParameter("price"));
            String imageName = request.getParameter("image");
            byte status = 1;
            if(serviceName.trim().length() < 2 || serviceName.trim().length() > 30){
                serviceError.setServiceNameError("So kí tu phai >= 2 va <=30");
                checkError = true;
            }
            
            if(shortDescription.trim().length() < 20 || shortDescription.trim().length() > 600){
                serviceError.setShortDescriptionError("So kí tu phai >= 20 va <=600");
                checkError = true;
            }
            
            if(longDescription.trim().length() < 40 || longDescription.trim().length() > 1000){
                serviceError.setLongDescriptionError("So kí tu phai >= 40 va <=1000");
                checkError = true;
            }
            
            if(checkError == false){
                String id = service.getServiceNextID(dao.getMaxServiceID());
                String image = "assets/img/specialities/"+imageName;
                if(promotionId.isEmpty())
                    promotionId = null;
                service = new Service(id, serviceName, promotionId, shortDescription, longDescription, price, image, status);
                request.setAttribute("SUCCESS", "Create service success");
                if(dao.createService(service))
                    url=SUCCESS;
            }
            else{
                request.setAttribute("SERVICE_ERROR", serviceError);
            }
            
            
            
        } catch (Exception e) {
            log("Error at AdminCreateService Controller: " + e.toString());
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