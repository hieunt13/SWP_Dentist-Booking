/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptproject.SWP391.manager.dentist;

import com.fptproject.SWP391.dbutils.DBUtils;
import com.fptproject.SWP391.model.DentistAvailiableTime;
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
public class ScheduleManager {

    DentistAvailiableTime availiableTime = null;
    Connection con = null;
    PreparedStatement ps = null;
    private static final String INSERT_SLOT = "INSERT INTO DentistAvailiableTime VALUES ( ? , ? , ? ) ;";
    private static final String SHOW_SCHEDULE = "SELECT * FROM DentistAvailiableTime WHERE dentist_id = ? ;";
    private static final String DELETE_SLOT = "DELETE FROM DentistAvailiableTime WHERE dentist_id = ? AND slot = ? AND day_of_week = ? ;";
    
    public List<DentistAvailiableTime> show(String dentistId) throws SQLException {
        List<DentistAvailiableTime> list = new ArrayList<>();
        try {
            con = DBUtils.getConnection();
            if (con == null) {
                throw new NullPointerException("there isn't any database server connection");
            }
            ps = con.prepareStatement(SHOW_SCHEDULE);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                availiableTime = new DentistAvailiableTime();
                availiableTime.setDentistId(rs.getString("dentist_id"));
                availiableTime.setSlot(rs.getInt("slot"));
                availiableTime.setDay(rs.getString("day_of_week"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                con.close();
            }
        }
        return null;
    }

    public DentistAvailiableTime UpdateSchedule(DentistAvailiableTime availiableTime) throws SQLException {
        int row = 0;
        try {
            con = DBUtils.getConnection();
            if (con == null) {
                throw new NullPointerException("there isn't any database server connection");
            }
            ps = con.prepareStatement(INSERT_SLOT);
            ps.setString(1, availiableTime.getDentistId());
            ps.setInt(2, availiableTime.getSlot());
            ps.setString(3, availiableTime.getDay());
            row = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                con.close();
            }
        }
        return availiableTime;
    }

    public DentistAvailiableTime delete(DentistAvailiableTime availiableTime) throws SQLException {
        int row = 0;
        try {
            con = DBUtils.getConnection();
            if (con == null) {
                throw new NullPointerException("there isn't any database server connection");
            }
            ps = con.prepareStatement(DELETE_SLOT);
            ps.setString(1, availiableTime.getDentistId());
            ps.setInt(2, availiableTime.getSlot());
            ps.setString(3, availiableTime.getDay());
            row = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                con.close();
            }
        }
        return availiableTime;
    }
}
