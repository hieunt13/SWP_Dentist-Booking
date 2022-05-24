/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptproject.SWP391.controller.customer.dentist;

import com.fptproject.SWP391.manager.customer.DentistManager;
import com.fptproject.SWP391.model.Dentist;
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
@WebServlet(name = "DentistController", urlPatterns = {"/dentists/*"})
public class DentistController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String path = request.getPathInfo();
        DentistManager manager;

        switch (path) {
            case "/list":
                ArrayList<Dentist> list = new ArrayList<>();
                manager = new DentistManager();
                list = manager.list();
                request.setAttribute("list", list);
                request.getRequestDispatcher("/customer/dentist.jsp").forward(request, response);
                break;
            case "/detail":
                String id = request.getParameter("id");
                manager = new DentistManager();
                Dentist dentist = new Dentist();
                dentist = manager.showDetail(id);
                request.setAttribute("dentist", dentist);
                request.getRequestDispatcher("/customer/dentist-detail.jsp").forward(request, response);
                break;
            case "/search":
                String nameSearch = request.getParameter("nameSearch");
                if (nameSearch == null || nameSearch.equals("")) {
                    response.sendRedirect(request.getContextPath() + "/dentists/list");
                    break;
                }
                list = new ArrayList<>();
                manager = new DentistManager();
                list = manager.search(nameSearch);
                if (list == null || list.size() < 1) {
                    request.setAttribute("searchMsg", "No dentists were found to match your search!!");
                }
                request.setAttribute("nameSearch", nameSearch);
                request.setAttribute("list", list);
                request.getRequestDispatcher("/customer/dentist.jsp").forward(request, response);
                break;
            case "/sort":
                String sortRequest = request.getParameter("column");
                if (sortRequest == null || sortRequest.equals("")) {
                    response.sendRedirect(request.getContextPath() + "/dentists/list");
                    break;
                }
                String[] part = sortRequest.split("-");
                String column = part[0];
                String type = part[1];
                list = new ArrayList<>();
                manager = new DentistManager();
                list = manager.sort(column, type);
                request.setAttribute("sortRequest", sortRequest);
                request.setAttribute("list", list);
                request.getRequestDispatcher("/customer/dentist.jsp").forward(request, response);
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
