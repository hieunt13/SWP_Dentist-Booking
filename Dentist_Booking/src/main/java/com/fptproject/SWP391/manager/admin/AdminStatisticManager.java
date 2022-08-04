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
 * @author minha
 */
public class AdminStatisticManager {

    private static final String COUNT_APPOINTMENT = "SELECT COUNT (id) AS count FROM Appointments WHERE status = 3";
    private static final String COUNT_DENTIST = "SELECT COUNT (id) AS count FROM Dentists";
    private static final String COUNT_CUSTOMER = "SELECT COUNT (id) AS count FROM Customers";
    private static final String SUM_REVENUE = "SELECT SUM (price) AS sum FROM Invoices WHERE status = 1";
    public int sumRevenue() throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        int sum = 0;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SUM_REVENUE);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    sum = rs.getInt("sum");
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
        return sum;
    }
    public int countAppointment() throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        int count = 0;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(COUNT_APPOINTMENT);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    count = rs.getInt("count");
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
        return count;
    }

    public int countDentist() throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        int count = 0;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(COUNT_DENTIST);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    count = rs.getInt("count");
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
        return count;
    }

    public int countCustomer() throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        int count = 0;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(COUNT_CUSTOMER);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    count = rs.getInt("count");
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
        return count;
    }
}
