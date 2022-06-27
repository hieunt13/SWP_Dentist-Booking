/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptproject.SWP391.controller.customer.promotion;

import com.fptproject.SWP391.manager.customer.PromotionManager;
import com.fptproject.SWP391.model.Promotion;
import com.fptproject.SWP391.model.Service;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
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
@WebServlet(name = "PromotionController", urlPatterns = {"/promotion/*"})
public class PromotionController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String path = request.getPathInfo();
        switch (path) {
            case "/list":
                list(request, response);
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

    protected void list(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        //list for showing promotion to clients
        ArrayList<Promotion> list = new ArrayList<Promotion>();

        //list services apply promotion
        ArrayList<Service> listServiceApplied = new ArrayList<>();

        //map for linking promotion and list of services apply promotion
        HashMap<Promotion, ArrayList<Service>> servicesApplied = new HashMap<>();
        PromotionManager promotionManager = new PromotionManager();

        //add value to list 
        for (Promotion promotion : promotionManager.list()) {
            listServiceApplied = promotionManager.listServiceApplied(promotion.getId());
            //check if promotion is applied by any service or not then add promotion to list and map
            if (listServiceApplied != null) {
                list.add(promotion);
                servicesApplied.put(promotion, listServiceApplied);
            }
        }

        request.setAttribute("servicesApplied", servicesApplied);
        request.setAttribute("list", list);
        request.getRequestDispatcher("/customer/promotion.jsp").forward(request, response);
    }

    protected void search(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        //list for showing promotion to clients
        ArrayList<Promotion> list = new ArrayList<Promotion>();

        //list services apply promotion
        ArrayList<Service> listServiceApplied = new ArrayList<>();

        //map for linking promotion and list of services apply promotion
        HashMap<Promotion, ArrayList<Service>> servicesApplied = new HashMap<>();

        PromotionManager promotionManager = new PromotionManager();
        
        //check if client dont search anything but click on search button then redirect to show list
        String searchString = request.getParameter("searchRequest");
        if (searchString == null || searchString.equals("")) {
            response.sendRedirect(request.getContextPath() + "/promotion/list");
            return;
        }

        //add value to list 
        for (Promotion promotion : promotionManager.search(searchString)) {
            listServiceApplied = promotionManager.listServiceApplied(promotion.getId());
            //check if promotion is applied by any service or not then add promotion to list and map
            if (listServiceApplied != null) {
                list.add(promotion);
                servicesApplied.put(promotion, listServiceApplied);
            }
        }

        //if search don't find any element then show error
        if (list == null || list.size() < 1) {
            request.setAttribute("searchMsg", "No promotions were found to match your search!!");
        }

        request.setAttribute("servicesApplied", servicesApplied);
        request.setAttribute("searchRequest", searchString);
        request.setAttribute("list", list);
        request.getRequestDispatcher("/customer/promotion.jsp").forward(request, response);

    }

    protected void sort(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        //list for showing promotion to clients
        ArrayList<Promotion> list = new ArrayList<Promotion>();

        //list services apply promotion
        ArrayList<Service> listServiceApplied = new ArrayList<>();

        //map for linking promotion and list of services apply promotion
        HashMap<Promotion, ArrayList<Service>> servicesApplied = new HashMap<>();

        PromotionManager promotionManager = new PromotionManager();

        //check if clients click on button sort but don't check any type of sorting then redirect to show list
        String sortRequest = request.getParameter("column");
        if (sortRequest == null || sortRequest.equals("")) {
            response.sendRedirect(request.getContextPath() + "/promotion/list");
            return;
        }
        
        //split sortRequest(column-type) 
        String[] part = sortRequest.split("-");
        String column = part[0];
        String type = part[1];
        
        //add value to list 
        for (Promotion promotion : promotionManager.sort(column, type)) {
            listServiceApplied = promotionManager.listServiceApplied(promotion.getId());
            //check if promotion is applied by any service or not then add promotion to list and map
            if (listServiceApplied != null) {
                list.add(promotion);
                servicesApplied.put(promotion, listServiceApplied);
            }
        }
        
        request.setAttribute("servicesApplied", servicesApplied);
        request.setAttribute("sortRequest", sortRequest);
        request.setAttribute("list", list);
        request.getRequestDispatcher("/customer/promotion.jsp").forward(request, response);
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
            Logger.getLogger(PromotionController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(PromotionController.class.getName()).log(Level.SEVERE, null, ex);
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
