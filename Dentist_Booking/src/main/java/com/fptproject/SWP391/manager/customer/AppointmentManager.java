/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptproject.SWP391.manager.customer;

import com.fptproject.SWP391.dbutils.DBUtils;
import com.fptproject.SWP391.model.Appointment;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author dangnguyen
 */
public class AppointmentManager {

    private final static String APPOINTMENT_LIST = "SELECT * FROM Appointments  \n"
            + "INNER JOIN Dentists ON Appointments.dentist_id = Dentists.id\n"
            + "INNER JOIN Services ON Appointments.service_id = Services.id\n"
            + "WHERE Appointments.customer_id = ? AND Appointments.[status] = 1;";

    public List<Appointment> getListAppointment(String customerID) throws SQLException {
        List<Appointment> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(APPOINTMENT_LIST);
                rs = ptm.executeQuery();
                ptm.setString(1, customerID);
                while (rs.next()) {
                    String id = rs.getString("id");
                    String dentistId = rs.getString("dentist_id");
                    String serviceId = rs.getString("service_id");
                    Date meetingDate = rs.getDate("meeting_date");
                    String dentistNote = rs.getString("dentist_note");
                    String customerSymptom = rs.getString("customer_symptom");
                    int slot = rs.getInt("slot");
                    int status = rs.getInt("status");
                    byte paymentConfirm = rs.getByte("payment_confirm");
                    byte dentistConfirm = rs.getByte("dentist_confirm");
                    String dentistPersonalName = rs.getString("personal_name");
                    String dentistRole = rs.getString("role");
                    String dentistImage = rs.getString("image");
                    int servicePrice = rs.getInt("price");
                    String serviceName = rs.getString("service_name");
                    Appointment appointment = new Appointment(id, dentistId, customerID, serviceId, meetingDate, dentistNote, customerSymptom, slot, status, paymentConfirm, dentistConfirm, dentistPersonalName, dentistRole, dentistImage, servicePrice, serviceName);
                    list.add(appointment);
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

    public static final String INSERT = "INSERT INTO Appointments VALUES (?,?,?,?,?,?,?,?,?)";

    public boolean makeAppointment(Appointment appointment) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        boolean flag = false;
        try {
            conn = DBUtils.getConnection();
            if (conn == null) {
                throw new NullPointerException("there isn't any database server connection");
            }
            ptm = conn.prepareStatement(INSERT);
            ptm.setString(1, appointment.getId());
            ptm.setString(2, appointment.getDentistId());
            ptm.setString(3, appointment.getCustomerId());
            ptm.setString(4, appointment.getServiceId());
            ptm.setDate(5, appointment.getMeetingDate());
            ptm.setString(6, appointment.getDentistNote());
            ptm.setString(7, appointment.getCustomerSymptom());
            ptm.setInt(8, appointment.getSlot());
            ptm.setInt(9, appointment.getStatus());

            ptm.executeUpdate();
            flag = true;
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
        return flag;
    }

}
