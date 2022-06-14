/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptproject.SWP391.manager.dentist;

import com.fptproject.SWP391.dbutils.DBUtils;
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
public class FeedbackManager {

    private static final String LIST = "SELECT * FROM Feedbacks WHERE status = 1";

    public List<Feedback> list() throws SQLException {
        ArrayList<Feedback> list = new ArrayList();  
        Feedback feedback = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LIST);
                ResultSet rs = ptm.executeQuery();
                while(rs.next()){
                    feedback = new Feedback();
                    feedback.setId(rs.getString("id"));
                    feedback.setAppointmentId(rs.getString("appointmentId"));
                    feedback.setDentistRating(rs.getFloat("dentist_rating"));
                    feedback.setDentistMessage(rs.getString("dentist_message"));
                    feedback.setMeetingDate(rs.getDate("meeting_date"));
                    list.add(feedback);
                }
                
            }else throw new Exception("There is any connection that match!");
            if(list.isEmpty()){
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
