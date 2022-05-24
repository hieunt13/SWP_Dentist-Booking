/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptproject.SWP391.controller.customer.promotion;

import com.fptproject.SWP391.manager.customer.PromotionManager;
import com.fptproject.SWP391.model.Promotion;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
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

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        ArrayList<Promotion> list;
        PromotionManager manager;
        String path = request.getPathInfo();
        switch (path) {
            case "/list":
                list = new ArrayList<Promotion>();
                manager = new PromotionManager();
                list = manager.list();
                request.setAttribute("list", list);
                request.getRequestDispatcher("/customer/promotion.jsp").forward(request, response);
                break;
            case "/search":
                list = new ArrayList<Promotion>();
                manager = new PromotionManager();
                String searchString = request.getParameter("searchRequest");
                if(searchString == null || searchString.equals("")){
                    response.sendRedirect(request.getContextPath()+"/promotion/list");
                    break;
                }
                list = manager.search(searchString);
                if (list == null || list.size() < 1) {
                    request.setAttribute("searchMsg", "No promotions were found to match your search!!");
                }
                request.setAttribute("searchRequest", searchString);
                request.setAttribute("list", list);
                request.getRequestDispatcher("/customer/promotion.jsp").forward(request, response);
                break;
            case "/sort":
                list = new ArrayList<Promotion>();
                manager = new PromotionManager();
                String sortRequest = request.getParameter("column");
                if (sortRequest == null || sortRequest.equals("")) {
                    response.sendRedirect(request.getContextPath() + "/promotion/list");
                    break;
                }
                String[] part = sortRequest.split("-");
                String column = part[0];
                String type = part[1];  
                list = manager.sort(column, type);
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
