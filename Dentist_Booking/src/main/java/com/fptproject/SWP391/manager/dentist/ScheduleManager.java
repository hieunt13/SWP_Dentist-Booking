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

    private static final String INSERT_SLOT = "INSERT INTO DentistAvailiableTime VALUES ( ? , ? , ? , ?) ;";
    private static final String SHOW_SCHEDULE = "SELECT * FROM DentistAvailiableTime WHERE dentist_id = ? AND day_of_week = ? ;";
    private static final String DELETE_SLOT = "DELETE FROM DentistAvailiableTime WHERE dentist_id = ? AND slot = ? AND day_of_week = ? ;";
    private static final String CHECK_SLOT_PICKED = "SELECT Appointments.dentist_id,DATENAME(WEEKDAY,Appointments.meeting_date) AS day_of_week ,AppDetail.slot \n"
            + "FROM Appointments,(SELECT slot,id FROM AppointmentDetail) as AppDetail\n"
            + "WHERE Appointments.id = AppDetail.id AND Appointments.dentist_id = ? AND AppDetail.slot = ? AND DATENAME(WEEKDAY,Appointments.meeting_date) = ?;";

    public List<DentistAvailiableTime> show(String dentistId, String day) throws SQLException {
        DentistAvailiableTime availiableTime = null;
        Connection con = null;
        PreparedStatement ps = null;
        List<DentistAvailiableTime> list = null;
        try {
            con = DBUtils.getConnection();
            if (con == null) {
                throw new NullPointerException("there isn't any database server connection");
            }
            ps = con.prepareStatement(SHOW_SCHEDULE);
            ps.setString(1, dentistId);
            ps.setString(2, day);
            ResultSet rs = ps.executeQuery();
            list = new ArrayList<>();
            while (rs.next()) {
                availiableTime = new DentistAvailiableTime();
                availiableTime.setDentistId(rs.getString("dentist_id"));
                availiableTime.setSlot(rs.getInt("slot"));
                availiableTime.setDay(rs.getString("day_of_week"));
                list.add(availiableTime);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                con.close();
            }
        }
        return list;
    }

    private void addSlot(String dentistId, String day, int slot, int status) throws SQLException {
        DentistAvailiableTime availiableTime = null;
        Connection con = null;
        PreparedStatement ps = null;
        int row = 0;
        try {
            con = DBUtils.getConnection();
            if (con == null) {
                throw new NullPointerException("there isn't any database server connection");
            }
            ps = con.prepareStatement(INSERT_SLOT);
            ps.setString(1, dentistId);
            ps.setInt(2, slot);
            ps.setString(3, day);
            ps.setInt(4, status);
            row = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }

    public void addSlots(String dentistId, String day, int[] slot, int status) throws SQLException {
        DentistAvailiableTime availiableTime = null;
        Connection con = null;
        PreparedStatement ps = null;
        for (int i : slot) {
            if (i != 0) {
                addSlot(dentistId, day, i, status);
            }
        }
    }

    public DentistAvailiableTime deleteSlot(DentistAvailiableTime availiableTime) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
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

    public boolean checkSlotBooked(String dentistID,int slot,String dayOfWeek) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        boolean check = false;
        try {
            con = DBUtils.getConnection();
            if (con == null) {
                throw new NullPointerException("there isn't any database server connection");
            }
            ps = con.prepareStatement(CHECK_SLOT_PICKED);
            ps.setString(1, dentistID);
            ps.setInt(2, slot);
            ps.setString(3, dayOfWeek);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                if(!rs.getString("slot").isEmpty() && rs.getString("slot") != null){
                    check = true;
                }                
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                con.close();
            }
        }
        return check;
    }
}
