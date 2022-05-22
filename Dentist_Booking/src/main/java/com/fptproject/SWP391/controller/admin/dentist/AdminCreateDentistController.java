/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptproject.SWP391.controller.admin.dentist;

import com.fptproject.SWP391.error.DentistError;
import com.fptproject.SWP391.manager.admin.AdminDentistManager;
import com.fptproject.SWP391.model.Dentist;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author admin
 */
@WebServlet(name = "AdminCreateDentistController", urlPatterns = {"/AdminCreateDentistController"})
public class AdminCreateDentistController extends HttpServlet {
    private static final String ERROR = "admincreatedentist.jsp";
    private static final String SUCCESS = "admincreatedentist.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        DentistError dentistError = new DentistError();
        try {
            boolean checkError = false;
            Dentist dentist = new Dentist();
            AdminDentistManager dao = new AdminDentistManager();
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String role = "DENTIST";
            String personalName = request.getParameter("personalName");
            float rate = 5;
            byte gender = Byte.parseByte(request.getParameter("gender"));
            byte status = 1;
            String speciality = request.getParameter("speciality");
            String description = request.getParameter("description");
            String education = request.getParameter("education");
            int workingExperience = Integer.parseInt(request.getParameter("workingExperience"));
            String award = request.getParameter("award");
            String imageName = request.getParameter("image");
            if(username.trim().length() < 5 || username.trim().length() > 30){
                dentistError.setUsernameError("So kí tu phai >= 5 va <=30");
                checkError = true;
            }
            
            if(personalName.trim().length() < 5 || personalName.trim().length() > 30){
                dentistError.setPersonalNameError("So kí tu phai >= 5 va <=30");
                checkError = true;
            }
            
            
            if(password.length() < 8 || password.length() > 30){
                dentistError.setPasswordError("So ki tu phai >=8 và <=30");
                checkError = true;
            }
            else{
                Pattern pattern = Pattern.compile("[0-9]");
                Matcher m = pattern.matcher(password);
                boolean checknum = m.find();

                pattern = Pattern.compile("[a-z]");
                m = pattern.matcher(password);
                boolean checkWordDowncase = m.find();

                pattern = pattern.compile("[A-Z]");
                m = pattern.matcher(password);
                boolean checkWordUpcase = m.find();
                
                if((checknum & checkWordUpcase & checkWordDowncase) == false){
                    dentistError.setPasswordError("Mat khau phai bao gom chu cai thuong va hoa va so");
                    checkError=true;
                }
            }
            
            if(dao.checkDuplicate(username)){
                dentistError.setUsernameError("username nay da ton tai");
                checkError= true; 
            }
            
            if(description.trim().length() < 10 || description.trim().length() > 500){
                dentistError.setDescriptionError("So kí tu phai >= 10 va <=500");
                checkError = true;
            }
            
            if(education.trim().length() < 10 || education.trim().length() > 300){
                dentistError.setEducationError("So kí tu phai >= 10 va <=300");
                checkError = true;
            }
            
            if(award.trim().length() < 5 || award.trim().length() > 300){
                dentistError.setAwardError("So kí tu phai >= 5 va <=300");
                checkError = true;
            }
            
            if(checkError == false){
                String id = dentist.getDentistNextID(dao.getMaxDentistID());
                String image = "assets/img/doctors/"+imageName;
                dentist = new Dentist(id, username, password, role, personalName, rate, gender, status, speciality, description, education, workingExperience, award, image);
                request.setAttribute("SUCCESS", "Create account success");
                if(dao.createDentist(dentist))
                    url=SUCCESS;
            }
            else{
                request.setAttribute("DENTIST_ERROR", dentistError);
            }
            
            
            
        } catch (Exception e) {
            log("Error at AdminCreateDentist Controller: " + e.toString());
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
