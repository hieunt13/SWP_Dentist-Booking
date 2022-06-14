/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptproject.SWP391.manager.admin;

import com.fptproject.SWP391.dbutils.DBUtils;
import com.fptproject.SWP391.model.AppointmentDetail;
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
public class AdminAppointmentDetailManager {
    private static final String SELECT_WITH_SERVICE_ID = "SELECT * FROM AppointmentDetail WHERE service_id = ?";
    private static final String GET_LIST_APPOINTMENTDETAIL = "SELECT * FROM AppointmentDetail WHERE id=? ";
    public boolean checkDeleteCondition(String ID) throws SQLException {
        boolean check = true;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
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
    
    public List<AppointmentDetail> getListAppointment(String ID) throws SQLException {
        List<AppointmentDetail> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            AppointmentDetail appointmentDetail = null;
            if (conn != null) {
                ptm = conn.prepareStatement(GET_LIST_APPOINTMENTDETAIL);
                ptm.setString(1, ID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("id");
                    String serviceID = rs.getString("service_id");
                    int slot = rs.getInt("slot");
                    appointmentDetail = new AppointmentDetail(id, serviceID, slot);
                    list.add(appointmentDetail);
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
}
