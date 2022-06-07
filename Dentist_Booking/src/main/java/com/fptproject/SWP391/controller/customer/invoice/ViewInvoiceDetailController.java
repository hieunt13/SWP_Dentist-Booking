/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptproject.SWP391.controller.customer.invoice;

import com.fptproject.SWP391.manager.customer.AppointmentDetailManager;
import com.fptproject.SWP391.manager.customer.EmployeeManager;
import com.fptproject.SWP391.manager.customer.InvoiceManager;
import com.fptproject.SWP391.manager.customer.PromotionManager;
import com.fptproject.SWP391.manager.customer.ServiceManager;
import com.fptproject.SWP391.model.AppointmentDetail;
import com.fptproject.SWP391.model.Invoice;
import com.fptproject.SWP391.model.Service;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author admin
 */
@WebServlet(name = "ViewInvoiceDetailController", urlPatterns = {"/ViewInvoiceDetailController"})
public class ViewInvoiceDetailController extends HttpServlet {
    private static final String ERROR = "customer/invoice-detail.jsp";
    private static final String SUCCESS = "customer/invoice-detail.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url=ERROR;
        try{
            String invoiceID = request.getParameter("invoiceID");
            String appointmentID = request.getParameter("appointmentID");
            InvoiceManager invoiceDAO = new InvoiceManager();
            AppointmentDetailManager appointmentDetailDAO = new AppointmentDetailManager();
            ServiceManager serviceDAO = new ServiceManager();
            PromotionManager promotionDAO = new PromotionManager();
            EmployeeManager employeeDAO = new EmployeeManager();
            Invoice invoice = invoiceDAO.getInvoiceByID(invoiceID);
            List<AppointmentDetail> listAppointmentDetail = appointmentDetailDAO.getListAppointment(invoice.getAppointmentId());
            List<Service> listService = new ArrayList<>();
            HashMap<String,Float> promotionDiscountMap = new HashMap<>();
            String employeePersonalName = employeeDAO.getPersonalNameByID(invoice.getEmployeeId());
            for( AppointmentDetail appointmentDetail : listAppointmentDetail){
                String serviceID = appointmentDetail.getServiceId();
                Service service = serviceDAO.getServiceForPurchase(serviceID);
                promotionDiscountMap.put(service.getPromotionId(), promotionDAO.getDiscountPercentage(service.getPromotionId()));
                listService.add(service);
            }
            request.setAttribute("EMPLOYEE_PERSONAL_NAME", employeePersonalName);
            request.setAttribute("INVOICE", invoice);
            request.setAttribute("LIST_SERVICE", listService);
            request.setAttribute("HASHMAP_DISCOUNT_PROMOTION", promotionDiscountMap);
        }catch(Exception e){
            log("Error at ViewInvoiceDetailController: " + e.toString());
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
