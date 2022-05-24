  /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptproject.SWP391.controller.authentication;

import com.fptproject.SWP391.model.Customer;
import com.fptproject.SWP391.model.Dentist;
import com.fptproject.SWP391.model.Employee;
import java.io.IOException;
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
@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

    private static final String ERROR = "login.jsp";
    private static final String ADMIN = "ADMIN";
    private static final String ADMIN_PAGE = "admin/index.jsp";
    private static final String CUSTOMER = "USER";
    private static final String CUSTOMER_PAGE = "home/mainpage";
    private static final String EMPLOYEE = "STAFF";
    private static final String EMPLOYEE_PAGE = "employee/employee-dashboard.jsp";
    private static final String DENTIST = "DENTIST";
    private static final String DENTIST_PAGE = "dentist/dentist-appointment.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            LoginDAO dao = new LoginDAO();
            Customer loginCustomer = dao.checkLoginCustomer(username, password);
            Dentist loginDentist = dao.checkLoginDentist(username, password);
            Employee loginEmployee = dao.checkLoginEmployee(username, password);

            if (loginCustomer != null) {
                String role = loginCustomer.getRole();
                HttpSession session = request.getSession();
                session.setAttribute("Login_Customer", loginCustomer);
                if (CUSTOMER.equals(role)) {
                    url = CUSTOMER_PAGE;
                } else {
                    request.setAttribute("ERROR", "Your role is not support");
                }
            } else if (loginDentist != null) {
                String role = loginDentist.getRole();
                HttpSession session = request.getSession();
                session.setAttribute("Login_Dentist", loginDentist);
                if (DENTIST.equals(role)) {
                    url = DENTIST_PAGE;
                }
            } else if (loginEmployee != null) {
                String role = loginEmployee.getRole();
                HttpSession session = request.getSession();
                session.setAttribute("Login_Employee", loginEmployee);
                if (EMPLOYEE.equals(role)) {
                    url = EMPLOYEE_PAGE;
                }else if (ADMIN.equals(role)) {
                    url = ADMIN_PAGE;
                } 
            } else {
                request.setAttribute("ERROR", "Your role is not support");
            }

        } catch (Exception e) {
            log("Error at LoginController " + e.toString());
        } finally {
            response.sendRedirect(url);
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
