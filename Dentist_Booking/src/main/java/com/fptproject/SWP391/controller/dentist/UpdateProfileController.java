/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptproject.SWP391.controller.dentist;

import com.fptproject.SWP391.controller.authentication.LoginDAO;
import com.fptproject.SWP391.error.DentistError;
import com.fptproject.SWP391.manager.dentist.DentistManager;
import com.fptproject.SWP391.model.Dentist;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author minha
 */
@WebServlet(name = "UpdateProfileController", urlPatterns = {"/dentist/UpdateProfile"})
public class UpdateProfileController extends HttpServlet {
    private static final String ERROR = "../dentist/dentist-profile-settings.jsp";
    private static final String SUCCESS = "../dentist/dentist-profile-settings.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url= ERROR;
        try{
            HttpSession session= request.getSession();
            Dentist dentist= (Dentist) session.getAttribute("Login_Dentist");
            DentistManager dao = new DentistManager();
            DentistError dentistError = new DentistError();
            String personalName = request.getParameter("personalName");
            Byte gender;
            if (request.getParameter("gender").equals("Male")) gender=0; else gender=1;
            String speciality = request.getParameter("speciality");
            String education = request.getParameter("education");
            int workingExperience = Integer.parseInt(request.getParameter("workingExperience"));
            String award = request.getParameter("award");
            String description = request.getParameter("description");
            //if(personalName==)
            String image = request.getParameter("image");; //request.getParameter("image"); 
            if(dao.updateProfile(personalName, gender, speciality, description, education, workingExperience, award, "/assets/img/doctors/doctor-thumb-02.jpg", dentist.getUsername())){
                request.setAttribute("SUCCESS", "Updated successfully");
                LoginDAO login = new LoginDAO();
                Dentist loginDentist = login.checkLoginDentist(dentist.getUsername(), dentist.getPassword());
                session.setAttribute("Login_Dentist", loginDentist);
                url= SUCCESS;
            }else{
                request.setAttribute("DENTIST_ERROR", dentistError);
            }
        }catch (Exception e){
            log("Error at Update Profile Controller"+e.toString());
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
