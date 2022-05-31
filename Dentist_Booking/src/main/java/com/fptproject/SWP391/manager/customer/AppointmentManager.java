/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptproject.SWP391.manager.customer;

import com.fptproject.SWP391.dbutils.DBUtils;
import com.fptproject.SWP391.model.Appointment;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author hieunguyen
 */
public class AppointmentManager {
     Connection con = null;
    PreparedStatement ps = null;
    public static final String INSERT = "INSERT INTO Appointments VALUES (?,?,?,?,?,?,?,?,?)";
    public boolean makeAppointment(Appointment appointment) throws SQLException{
        try {
            con = DBUtils.getConnection();
            if (con == null) {
                throw new NullPointerException("there isn't any database server connection");
            }
            ps = con.prepareStatement(INSERT);
            ps.setString(1, appointment.getId());
            ps.setString(2, appointment.getDentistId());
            ps.setString(3, appointment.getCustomerId());
            ps.setString(4, appointment.getServiceId());
            ps.setDate(5, appointment.getMeetingDate());
            ps.setString(6, appointment.getDentistNote());
            ps.setString(7, appointment.getCustomerSymptom());
            ps.setInt(8, appointment.getSlot());
            ps.setInt(9,appointment.getStatus());
            
            ResultSet rs = ps.executeQuery();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                con.close();
            }
        }
        return true;
    }
}

