/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptproject.SWP391.manager.admin;

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
 * @author admin
 */
public class AdminAppointmentManager {
    private static final String SELECT_WITH_CUSTOMER_ID = "SELECT * FROM Appointments WHERE customer_id = ? ";
    private static final String SELECT_WITH_DENTIST_ID = "SELECT * FROM Appointments WHERE dentist_id = ?";
    private static final String SELECT_WITH_DATE = "SELECT * FROM Appointments WHERE meeting_date BETWEEN ? AND ?";
    private static final String DELETE = "DELETE Appointments WHERE id=?";
    public boolean checkDeleteCondition(String ID) throws SQLException {
        boolean check = true;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                if(ID.contains("US"))
                    ptm = conn.prepareStatement(SELECT_WITH_CUSTOMER_ID);
                else if(ID.contains("DT"))
                    ptm = conn.prepareStatement(SELECT_WITH_DENTIST_ID);
                ptm.setString(1, ID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = false;
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
        return check;
    }
    
    public List<Appointment> searchListAppointment(String fromDate, String toDate) throws SQLException{
        List appointmentList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try{        
            conn= DBUtils.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(SELECT_WITH_DATE);
                ptm.setString(1, fromDate);
                ptm.setString(2, toDate);
                rs = ptm.executeQuery();
                while(rs.next()){
                    String id = rs.getString("id");
                    String dentistId = rs.getString("dentist_id");
                    String customerId = rs.getString("customer_id");
                    Date meetingDate = rs.getDate("meeting_date");
                    String dentistNote = rs.getString("dentist_note");
                    String customerSymptom = rs.getString("customer_symptom");
                    int status = rs.getInt("status");
                    byte paymentConfirm = rs.getByte("payment_confirm");
                    byte dentistConfirm = rs.getByte("dentist_confirm");
                    appointmentList.add(new Appointment(id, dentistId, customerId, meetingDate, dentistNote, customerSymptom, status, paymentConfirm, dentistConfirm));
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(rs!=null) rs.close();
            if(ptm!=null) ptm.close();
            if(conn!=null) conn.close();
        }
        return appointmentList;
    }
    
    public boolean deleteAppointment(String ID) throws SQLException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try{        
            conn= DBUtils.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(DELETE);
                ptm.setString(1,ID);
                check = ptm.executeUpdate()>0?true:false;
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(ptm!=null) ptm.close();
            if(conn!=null) conn.close();
        }
        return check;
    }
}
