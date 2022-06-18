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

    Dentist dentist = null;
    Connection con = null;
    PreparedStatement ps = null;
    private final static String DENTIST_LIST = "SELECT * FROM Dentists WHERE status = 1;";
    private final static String DENTIST_DETAIL = "SELECT * FROM Dentists WHERE status = 1 AND id = ?;";
    private final static String SEARCH_BY_NAME = "SELECT * FROM Dentists WHERE status = 1 AND personal_name LIKE ? ;";
    private final static String FILTER_BY_SPECIALITY = "SELECT * FROM Dentists WHERE status = 1 AND personal_name LIKE ? ";
    private final static String SORT = "SELECT * FROM Dentists WHERE status = 1 ORDER BY ";
    private final static String GET_DENTIST = "SELECT * FROM Dentists WHERE id=?";
    
    public Dentist getDentistForPayment(String id) throws SQLException{
        Dentist dentist = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_DENTIST);
                ptm.setString(1, id);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String personalName = rs.getString("personal_name");
                    float rate = rs.getFloat("rate");
                    int workingExperience = rs.getInt("working_experience");
                    String image = rs.getString("image");
                    dentist = new Dentist(id, personalName, rate, workingExperience, image);
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
        return dentist;
        
    }
    
    public ArrayList<Dentist> list() throws SQLException {
        ArrayList<Dentist> list = new ArrayList<>();
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
                dentist.setImage(rs.getString("image"));
                dentist.setWorkingExperience(rs.getInt("working_experience"));
                list.add(dentist);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                con.close();
            }
            if (ps != null) {
                ps.close();
            }
        }
        if (list.size() == 0) {
            return null;
        }
        return list;
    }

    public Dentist showDetail(String id) throws SQLException {
        Dentist dentist = null;
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
            if (con != null) {
                con.close();
            }
            if (ps != null) {
                ps.close();
            }
        }
        return dentist;
    }

    public ArrayList<Dentist> search(String name) throws SQLException {
        ArrayList<Dentist> list = null;
        Dentist dentist = null;
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
            if (con != null) {
                con.close();
            }
            if (ps != null) {
                ps.close();
            }
        }
        return list;
    }

    public ArrayList<Dentist> filterSpeciality(String... speciality) throws SQLException {
        String sql = FILTER_BY_SPECIALITY;
        int i = 1;
        //create sql query search dentist by multiple specialities
        for (String object : speciality) {
            sql += "OR personal_name LIKE ?";
        }
        sql += ");";

        ArrayList<Dentist> list = new ArrayList<>();
        try {
            con = DBUtils.getConnection();
            if (con == null) {
                throw new NullPointerException("there isn't any database server connection");
            }
            ps = con.prepareStatement(sql);

            //apply speciality to query sentence
            for (String sp : speciality) {
                ps.setString(i, "%" + speciality + "%");
                i++;
            }

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
            if (con != null) {
                con.close();
            }
            if (ps != null) {
                ps.close();
            }
        }
        return list;

    }

    public ArrayList<Dentist> sort(String column, String type) throws SQLException {
        ArrayList<Dentist> list = null;
        Dentist dentist = null;
        try {
            con = DBUtils.getConnection();
            if (con == null) {
                throw new NullPointerException("there isn't any database server connection");
            }
            ps = con.prepareStatement(SORT + " " + column + " " + type);
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
            if (list == null || list.size() < 0) {
                throw new Exception();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                con.close();
            }
            if (ps != null) {
                ps.close();
            }
        }
        return list;

    }
}
