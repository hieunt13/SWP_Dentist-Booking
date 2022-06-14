/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptproject.SWP391.manager.dentist;

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
 * @author hieunguyen
 */
public class DentistAppointmentManager {
    public static final String APPOINTMENT_LIST = "SELECT * FROM Appointments WHERE dentist_id=?";
    public static final String UPDATE_DENTISTCONFIRM = "UPDATE Dentist SET dentist_confirm WHERE dentist_id=?";
    public boolean setDentistConfirm(byte dentistConfirm, String dentistID) throws SQLException{
        Boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try{
            conn=DBUtils.getConnection();
            if(conn!=null) {
               ptm=conn.prepareStatement(UPDATE_DENTISTCONFIRM); 
               ptm.setByte(1, dentistConfirm);
               ptm.setString(2, dentistID);
               check= ptm.executeUpdate()>0?true:false;
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally{
            if(ptm!=null) ptm.close();
            if(conn!=null) conn.close();
        }
       return check;
    }
    public List<Appointment> getListAppointment(String dentistID) throws SQLException {
        List<Appointment> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(APPOINTMENT_LIST);
                ptm.setString(1, dentistID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("id");
                    String customerID = rs.getString("customer_id");
                    Date meetingDate = rs.getDate("meeting_date");
                    String dentistNote = rs.getString("dentist_note");
                    String customerSymptom = rs.getString("customer_symptom");
                    int status = rs.getInt("status");
                    byte paymentConfirm = rs.getByte("payment_confirm");
                    byte dentistConfirm = rs.getByte("dentist_confirm");
                    //String dentistPersonalName = rs.getString("personal_name");
                    //String dentistRole = rs.getString("role");
                    //String dentistImage = rs.getString("image");
                    Appointment appointment = new Appointment(id, dentistID, customerID, meetingDate, dentistNote, customerSymptom, status, paymentConfirm, dentistConfirm);
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
    public Appointment getAppointment(String dentistID) throws SQLException{
        Appointment appointment = new Appointment();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(APPOINTMENT_LIST);
                ptm.setString(1, dentistID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("id");
                    String customerID = rs.getString("customer_id");
                    Date meetingDate = rs.getDate("meeting_date");
                    String dentistNote = rs.getString("dentist_note");
                    String customerSymptom = rs.getString("customer_symptom");
                    int status = rs.getInt("status");
                    byte paymentConfirm = rs.getByte("payment_confirm");
                    byte dentistConfirm = rs.getByte("dentist_confirm");
                    //String dentistPersonalName = rs.getString("personal_name");
                    //String dentistRole = rs.getString("role");
                    //String dentistImage = rs.getString("image");
                    appointment = new Appointment(id, dentistID, customerID, meetingDate, dentistNote, customerSymptom, status, paymentConfirm, dentistConfirm);
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
        return appointment;
    }
}