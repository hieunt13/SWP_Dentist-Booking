/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptproject.SWP391.manager.customer;

import com.fptproject.SWP391.dbutils.DBUtils;
import com.fptproject.SWP391.model.Dentist;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author hieunguyen
 */
public class DentistManager {

    private final static String DENTIST_LIST = "SELECT * FROM Dentists WHERE status = 1;";
    private final static String DENTIST_DETAIL = "SELECT * FROM Dentists WHERE status = 1 AND id = ?;";
    private final static String SEARCH_BY_NAME = "SELECT * FROM Dentists WHERE status = 1 AND personal_name LIKE ? ;";

    public ArrayList<Dentist> list() throws SQLException {
        ArrayList<Dentist> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = DBUtils.getConnection();
            if (con == null) {
                throw new NullPointerException("there isn't any database server connection");
            }
            ps = con.prepareStatement(DENTIST_LIST);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Dentist dentist = new Dentist();
                dentist.setId(rs.getString("id"));
                dentist.setPersonalName(rs.getString("personal_name"));
                dentist.setRate(rs.getFloat("rate"));
                dentist.setGender(rs.getByte("gender"));
                dentist.setSpeciality(rs.getString("speciality"));
                dentist.setAward(rs.getString("award"));
                dentist.setDescription(rs.getString("description"));
                dentist.setEducation(rs.getString("education"));
                dentist.setWorkingExperience(rs.getInt("working_experience"));
                list.add(dentist);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            con.close();
            ps.close();
        }
        if (list.size() == 0) {
            return null;
        }
        return list;
    }

    public Dentist showDetail(String id) throws SQLException {
        Dentist dentist = null;
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = DBUtils.getConnection();
            if (con == null) {
                throw new NullPointerException("there isn't any database server connection");
            }
            ps = con.prepareStatement(DENTIST_DETAIL);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                dentist = new Dentist();
                dentist.setId(rs.getString("id"));
                dentist.setPersonalName(rs.getString("personal_name"));
                dentist.setRate(rs.getFloat("rate"));
                dentist.setGender(rs.getByte("gender"));
                dentist.setSpeciality(rs.getString("speciality"));
                dentist.setAward(rs.getString("award"));
                dentist.setDescription(rs.getString("description"));
                dentist.setEducation(rs.getString("education"));
                dentist.setWorkingExperience(rs.getInt("working_experience"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            con.close();
            ps.close();
        }
        return dentist;
    }

    public ArrayList<Dentist> search(String name) throws SQLException {
        ArrayList<Dentist> list = null;
        Dentist dentist = null;
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = DBUtils.getConnection();
            if (con == null) {
                throw new NullPointerException("there isn't any database server connection");
            }
            ps = con.prepareStatement(SEARCH_BY_NAME);
            ps.setString(1, "%" + name + "%");
            ResultSet rs = ps.executeQuery();
            list = new ArrayList<>();
            while (rs.next()) {
                dentist = new Dentist();
                dentist.setId(rs.getString("id"));
                dentist.setPersonalName(rs.getString("personal_name"));
                dentist.setRate(rs.getFloat("rate"));
                dentist.setGender(rs.getByte("gender"));
                dentist.setSpeciality(rs.getString("speciality"));
                dentist.setAward(rs.getString("award"));
                dentist.setDescription(rs.getString("description"));
                dentist.setEducation(rs.getString("education"));
                dentist.setWorkingExperience(rs.getInt("working_experience"));
                list.add(dentist);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            con.close();
            ps.close();
        }
        return list;
    }
}
