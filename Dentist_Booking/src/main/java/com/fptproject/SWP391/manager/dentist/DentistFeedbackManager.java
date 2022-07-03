/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptproject.SWP391.manager.dentist;

import com.fptproject.SWP391.dbutils.DBUtils;
import com.fptproject.SWP391.model.Appointment;
import com.fptproject.SWP391.model.Customer;
import com.fptproject.SWP391.model.Feedback;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author hieunguyen
 */
public class DentistFeedbackManager {

    private static final String LIST_DENTIST_FEEDBACK = "SELECT Feedbacks.*,Customers.personal_name as customer_name,Customers.[image]  \n"
            + "FROM Feedbacks,Customers,(SELECT * FROM Appointments) as AP \n"
            + "WHERE Feedbacks.status = 2 and Ap.id = Feedbacks.appointment_id \n"
            + "AND Customers.id = AP.customer_id \n"
            + "AND AP.dentist_id = ? ";
    private static final String LIST_FEEDBACK = "SELECT * FROM Feedbacks";

    public List<Feedback> list(String dentistId) throws SQLException {
        List<Feedback> list = new ArrayList<>();
        Customer customer = null;
        Feedback feedback = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LIST_DENTIST_FEEDBACK);
                ptm.setString(1, dentistId);
                ResultSet rs = ptm.executeQuery();
                while (rs.next()) {
                    //set customer info
                    customer = new Customer();
                    customer.setPersonalName(rs.getString("customer_name"));
                    customer.setImage(rs.getString("image"));
                    
                    //init to appointment in Feedback
                    Appointment appointment = new Appointment();
                    appointment.setCustomer(customer);
                    
                    //set feedback info
                    feedback = new Feedback();
                    feedback.setId(rs.getString("id"));
                    feedback.setAppointmentId(rs.getString("appointment_id"));
                    feedback.setDentistRating(rs.getFloat("dentist_rating"));
                    feedback.setDentistMessage(rs.getString("dentist_message"));
                    feedback.setAppointment(appointment);
                    list.add(feedback);
                }

            } else {
                throw new Exception("There is any connection that match!");
            }
            if (list.isEmpty()) {
                throw new Exception("List doesn't contain any element!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public List<Feedback> listFeedback() throws SQLException {
        ArrayList<Feedback> list = new ArrayList();
        Feedback feedback = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LIST_FEEDBACK);
                ResultSet rs = ptm.executeQuery();
                while (rs.next()) {
                    feedback = new Feedback();
                    feedback.setId(rs.getString("id"));
                    feedback.setAppointmentId(rs.getString("appointment_id"));
                    feedback.setDentistRating(rs.getFloat("dentist_rating"));
                    feedback.setDentistMessage(rs.getString("dentist_message"));
                    feedback.setStatus(rs.getByte("status"));
                    list.add(feedback);
                }

            } else {
                throw new Exception("There is any connection that match!");
            }
            if (list.isEmpty()) {
                throw new Exception("List doesn't contain any element!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }
}
