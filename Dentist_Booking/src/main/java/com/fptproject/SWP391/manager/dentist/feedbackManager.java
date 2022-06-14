/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptproject.SWP391.manager.dentist;

import com.fptproject.SWP391.dbutils.DBUtils;
import com.fptproject.SWP391.model.Customer;
import com.fptproject.SWP391.model.Feedback;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author hieunguyen
 */
public class FeedbackManager {

    private static final String LIST = "SELECT Feedbacks.*,Customers.personal_name as customer_name FROM Feedbacks,Customers,(SELECT * FROM Appointments) as AP\n"
            + "WHERE Feedbacks.status = 1 and Ap.id = Feedbacks.appointment_id AND Customers.id = AP.customer_id";

    public Map<Customer,Feedback> list() throws SQLException {
        Map<Customer,Feedback> map = new HashMap<>();
        Customer customer = null;
        Feedback feedback = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LIST);
                ResultSet rs = ptm.executeQuery();
                while (rs.next()) {
                    customer = new Customer();
                    customer.setPersonalName(rs.getString("customer_name"));
                    feedback = new Feedback();
                    feedback.setId(rs.getString("id"));
                    feedback.setAppointmentId(rs.getString("appointment_id"));
                    feedback.setDentistRating(rs.getFloat("dentist_rating"));
                    feedback.setDentistMessage(rs.getString("dentist_message"));
                    map.put(customer, feedback);
                }

            } else {
                throw new Exception("There is any connection that match!");
            }
            if (map.isEmpty()) {
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
        return map;
    }
}
