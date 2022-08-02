/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptproject.SWP391.manager.customer;

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

    private static final String LIST_FEEDBACK = "SELECT * FROM Feedbacks";
    private static final String CREATE = "INSERT INTO Feedbacks (id, appointment_id, dentist_rating, dentist_message, status) VALUES (?, ?, ?, ?, ?)";
    private static final String SELECT_MAX_FEEDBACK_ID = "SELECT MAX(id) AS maxFeedbackId FROM Feedbacks WHERE LEN(id) = (SELECT MAX(LEN(id)) FROM Feedbacks)";
    private static final String UPDATE_AVG_RATE = "UPDATE Dentists SET rate = ? WHERE id = ?";
    private static final String AVG_RATE = "SELECT AVG(dentist_rating) AS averageRate FROM Feedbacks\n"
            + "INNER JOIN Appointments ON Appointments.id = appointment_id\n"
            + "WHERE Appointments.dentist_id = ? and Feedbacks.status = 2";
    private static final String GET_DENTIST_ID = "SELECT dentist_id FROM Feedbacks\n"
            + "INNER JOIN Appointments ON Appointments.id = appointment_id\n"
            + "WHERE Feedbacks.appointment_id = ?";
    private static final String GET_APP_ID = "SELECT appointment_id FROM Feedbacks WHERE id = ?";
    public String getDentistID(String feedbackID) throws SQLException {
        String id = null;
        String appointmentID = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_APP_ID);
                ptm.setString(1, feedbackID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    appointmentID = rs.getString("appointment_id");
                }
                ptm = conn.prepareStatement(GET_DENTIST_ID);
                ptm.setString(1, appointmentID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    id = rs.getString("dentist_id");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return id;
    }

    public boolean updateRate(float avg, String id) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_AVG_RATE);
                avg = (float) (Math.round(avg * 10.0) / 10.0);
                ptm.setFloat(1, avg);
                ptm.setString(2, id);
                check = ptm.executeUpdate() > 0 ? true : false;
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
        return check;
    }

    public float getAvgRate(String dentistID) throws SQLException {
        float avg = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(AVG_RATE);
                ptm.setString(1, dentistID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    avg = rs.getFloat("averageRate");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return avg;
    }

    public List<Feedback> getListFeedback() throws SQLException {
        List<Feedback> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LIST_FEEDBACK);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("id");
                    String appointmentID = rs.getString("appointment_id");
                    float rating = rs.getFloat("dentist_rating");
                    String message = rs.getString("dentist_message");
                    Byte status = rs.getByte("status");

                    Feedback feedback = new Feedback(id, appointmentID, rating, message, status);
                        list.add(feedback);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public boolean createFeedback(Feedback feedback) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE);
                ptm.setString(1, feedback.getId());
                ptm.setString(2, feedback.getAppointmentId());
                ptm.setFloat(3, feedback.getDentistRating());
                ptm.setString(4, feedback.getDentistMessage());
                ptm.setByte(5, feedback.getStatus());
                check = ptm.executeUpdate() > 0 ? true : false;
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
        return check;
    }

    public String getMaxFeedbackID() throws SQLException {
        String maxFeedbackId = "";
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SELECT_MAX_FEEDBACK_ID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    if (rs.getString("maxFeedbackId") == null) {
                        maxFeedbackId = "FB0";
                    } else {
                        maxFeedbackId = rs.getString("maxFeedbackId");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return maxFeedbackId;
    }
}
