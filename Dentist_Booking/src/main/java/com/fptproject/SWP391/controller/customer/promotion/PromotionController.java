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
        ArrayList<Promotion> list; 
        ArrayList<Service> listServiceApplied;
        HashMap<Promotion,ArrayList<Service>> servicesApplied;
        PromotionManager promotionManager;
        String path = request.getPathInfo();
        switch (path) {
            case "/list":
                list = new ArrayList<Promotion>();
                listServiceApplied = new ArrayList<>();
                promotionManager = new PromotionManager();                
                servicesApplied = new HashMap<>();
                for (Promotion promotion : promotionManager.list()) {
                    listServiceApplied = promotionManager.listServiceApplied(promotion.getId());
                    if(listServiceApplied != null){
                        list.add(promotion);
                        servicesApplied.put(promotion, listServiceApplied);
                    }  
                }
                request.setAttribute("servicesApplied", servicesApplied);
                request.setAttribute("list", list);
                request.getRequestDispatcher("/customer/promotion.jsp").forward(request, response);
                break;
            case "/search":
                list = new ArrayList<Promotion>();
                listServiceApplied = new ArrayList<>();
                promotionManager = new PromotionManager();
                servicesApplied = new HashMap<>();
                String searchString = request.getParameter("searchRequest");
                if(searchString == null || searchString.equals("")){
                    response.sendRedirect(request.getContextPath()+"/promotion/list");
                    break;
                }
                for (Promotion promotion : promotionManager.search(searchString)) {
                    listServiceApplied = promotionManager.listServiceApplied(promotion.getId());
                    if(listServiceApplied != null){
                        list.add(promotion);
                        servicesApplied.put(promotion, listServiceApplied);
                    }  
                }
                if (list == null || list.size() < 1) {
                    request.setAttribute("searchMsg", "No promotions were found to match your search!!");
                }
                request.setAttribute("servicesApplied", servicesApplied);
                request.setAttribute("searchRequest", searchString);
                request.setAttribute("list", list);
                request.getRequestDispatcher("/customer/promotion.jsp").forward(request, response);
                break;
            case "/sort":
                list = new ArrayList<Promotion>();
                listServiceApplied = new ArrayList<>();
                promotionManager = new PromotionManager();
                servicesApplied = new HashMap<>();
                String sortRequest = request.getParameter("column");
                if (sortRequest == null || sortRequest.equals("")) {
                    response.sendRedirect(request.getContextPath() + "/promotion/list");
                    break;
                }
                String[] part = sortRequest.split("-");
                String column = part[0];
                String type = part[1];  
                for (Promotion promotion : promotionManager.sort(column, type)) {
                    listServiceApplied = promotionManager.listServiceApplied(promotion.getId());
                    if(listServiceApplied != null){
                        list.add(promotion);
                        servicesApplied.put(promotion, listServiceApplied);
                    }  
                }
                request.setAttribute("servicesApplied", servicesApplied);
                request.setAttribute("sortRequest", sortRequest);
                request.setAttribute("list", list);
                request.getRequestDispatcher("/customer/promotion.jsp").forward(request, response);
                break;
            default:
                throw new AssertionError();
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
