/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptproject.SWP391.manager.admin;

import com.fptproject.SWP391.dbutils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author admin
 */
public class AdminAppointmentManager {
    private static final String SELECT_WITH_CUSTOMER_ID = "SELECT * FROM Appointment WHERE customer_id = ? ";
    private static final String SELECT_WITH_DENTIST_ID = "SELECT * FROM Appointment WHERE dentist_id = ?";
    private static final String SELECT_WITH_SERVICE_ID = "SELECT * FROM Appointment WHERE service_id = ?";
    
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
                else
                    ptm = conn.prepareStatement(SELECT_WITH_SERVICE_ID);
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
}
