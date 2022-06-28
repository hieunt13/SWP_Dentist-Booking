/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptproject.SWP391.manager.employee;

import com.fptproject.SWP391.dbutils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author dangnguyen
 */
public class EmployeeFeedbackManager {

    private static final String SET_STATUS_FEEDBACK = "UPDATE Feedbacks SET status = CASE WHEN status = 1 THEN 0 ELSE 1 END WHERE Feedbacks.appointment_id = ?";
    private static final String GET_APPOINTMENT_STATUS = "SELECT Appointments.[status] from Appointments WHERE Appointments.id = ?";

    public boolean setFeedBackStatus(String ID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SET_STATUS_FEEDBACK);
                ptm.setString(1, ID);
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

    public int checkAppointmentStatus(String appointmentID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        int appointmentStatus = 0;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_APPOINTMENT_STATUS);
                ptm.setString(1, appointmentID);
                rs = ptm.executeQuery();
                if(rs.next()){
                   appointmentStatus = rs.getInt("status");
                }

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
        return appointmentStatus;
    }

}
