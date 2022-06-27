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
    private static final String SELECT_MAX_FEEDBACK_ID= "SELECT MAX(id) AS maxFeedbackId FROM Feedbacks WHERE LEN(id) = (SELECT MAX(LEN(id)) FROM Feedbacks)";
    public List<Feedback> getListFeedback() throws SQLException{
        List<Feedback> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try{
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LIST_FEEDBACK);
                rs = ptm.executeQuery();
                while (rs.next()){
                    String id = rs.getString("id");
                    String appointmentID = rs.getString("appointment_id");
                    float rating = rs.getFloat("dentist_rating");
                    String message = rs.getString("dentist_message");
                    Byte status = rs.getByte("status");    
                    
                    Feedback feedback = new Feedback(id, appointmentID, rating, message, status);
                    if (feedback.getStatus()==1){
                        list.add(feedback);
                    }
                }
            }
        }catch( Exception e){
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
    public boolean createFeedback(Feedback feedback) throws SQLException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try{
            conn= DBUtils.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(CREATE);
                ptm.setString(1, feedback.getId());
                ptm.setString(2, feedback.getAppointmentId());
                ptm.setFloat(3, feedback.getDentistRating());
                ptm.setString(4, feedback.getDentistMessage());
                ptm.setByte(5, feedback.getStatus());
                check= ptm.executeUpdate()>0?true:false;
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(ptm!=null) ptm.close();
            if(conn!=null) conn.close();
        }
        return check;
    }
    public String getMaxFeedbackID() throws SQLException{
        String maxFeedbackId="";
        Connection conn=null;
        PreparedStatement ptm=null;
        ResultSet rs=null;
        try{
            conn= DBUtils.getConnection();
            if(conn!=null){
                ptm= conn.prepareStatement(SELECT_MAX_FEEDBACK_ID);
                rs= ptm.executeQuery();
                if(rs.next()){
                    if(rs.getString("maxFeedbackId") == null){
                        maxFeedbackId="FB0";
                    }
                    else{
                        maxFeedbackId= rs.getString("maxFeedbackId");
                    }
                }          
            }           
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(rs!=null) rs.close();
            if(ptm!=null) ptm.close();
            if(conn!=null) conn.close();           
        }
        return maxFeedbackId;
    }
}
