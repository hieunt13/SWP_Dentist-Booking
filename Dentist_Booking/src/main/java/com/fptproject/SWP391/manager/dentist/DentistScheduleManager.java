/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptproject.SWP391.manager.dentist;

import com.fptproject.SWP391.dbutils.DBUtils;
import com.fptproject.SWP391.model.DentistAvailableTime;
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
public class DentistScheduleManager {

    private static final String INSERT_SLOT = "INSERT INTO DentistAvailiableTime VALUES ( ? , ? , ? , ?) ;";
    private static final String SHOW_SCHEDULE = "SELECT * FROM DentistAvailiableTime WHERE dentist_id = ? AND day_of_week = ? ;";
    private static final String DELETE_SLOT = "DELETE FROM DentistAvailiableTime WHERE dentist_id = ? AND slot = ? AND day_of_week = ? ;";
    
    //SQL String for selecting every slots of appointments that from the current date to further which aren't completed by dentist(dentist_confirm = 0) and status = 1 
    private static final String CHECK_SLOT_PICKED = "  SELECT Appointments.dentist_id,DATENAME(WEEKDAY,Appointments.meeting_date) AS day_of_week ,AppDetail.slot \n"
            + "            FROM Appointments,(SELECT slot,id FROM AppointmentDetail) as AppDetail\n"
            + "           WHERE Appointments.id = AppDetail.id \n"
            + "           AND Appointments.meeting_date >= GETDATE()\n"
            + "           AND Appointments.dentist_id = ? \n"
            + "           AND AppDetail.slot = ? \n"
            + "           AND DATENAME(WEEKDAY,Appointments.meeting_date) = ? \n"
            + "           AND Appointments.status = 1 \n"
            + "           AND Appointments.dentist_confirm = 0;";

    public List<DentistAvailableTime> show(String dentistId, String day) throws SQLException {
        DentistAvailableTime availiableTime = null;
        Connection con = null;
        PreparedStatement ps = null;
        List<DentistAvailableTime> list = null;
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
                availiableTime = new DentistAvailableTime();
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
        DentistAvailableTime availiableTime = null;
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
        for (int i : slot) {
            //if value of array slot !=0 then add slot available to dtb
            if (i != 0) {
                addSlot(dentistId, day, i, status);
            }
        }
    }

    public DentistAvailableTime deleteSlot(DentistAvailableTime availiableTime) throws SQLException {
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

    public boolean checkSlotBooked(String dentistID, int slot, String dayOfWeek) throws SQLException {
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
            while (rs.next()) {
                if (!rs.getString("slot").isEmpty() && rs.getString("slot") != null) {
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
