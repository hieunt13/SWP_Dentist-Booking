/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptproject.SWP391.manager.admin;

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
 * @author admin
 */
public class AdminFeedbackManager {
    private static final String SEARCH = "SELECT * FROM Feedbacks WHERE dentist_rating BETWEEN ? AND ? ";
    private static final String DELETE = "DELETE FROM Feedbacks WHERE id=?";
    private static final String RESTORE = "UPDATE Feedbacks SET status = 1 WHERE id = ?";
    public List<Feedback> searchListFeedback(String fromRate, String toRate) throws SQLException{
        List feedbackList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try{        
            conn= DBUtils.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(SEARCH);
                ptm.setString(1, fromRate);
                ptm.setString(2, toRate);
                rs = ptm.executeQuery();
                while(rs.next()){
                    String id = rs.getString("id");
                    String appointmentID = rs.getString("appointment_id");
                    float dentistRate = rs.getFloat("dentist_rating");
                    String dentistMessage = rs.getString("dentist_message");
                    byte status = rs.getByte("status");
                    feedbackList.add(new Feedback(id, appointmentID, dentistRate, dentistMessage, status));
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(rs!=null) rs.close();
            if(ptm!=null) ptm.close();
            if(conn!=null) conn.close();
        }
        return feedbackList;
    }
    
    public boolean deleteFeedback(String ID) throws SQLException{
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
    
    public boolean restoreFeedback(String ID) throws SQLException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try{        
            conn= DBUtils.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(RESTORE);
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
