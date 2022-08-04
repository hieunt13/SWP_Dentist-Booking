/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptproject.SWP391.manager.admin;

import com.fptproject.SWP391.dbutils.DBUtils;
import com.fptproject.SWP391.model.Dentist;
import com.fptproject.SWP391.model.Invoice;
import java.sql.Array;
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
public class AdminDentistManager {

    private static final String CREATE = "INSERT INTO Dentists (id, username, password, role, personal_name, rate, gender, status, speciality, description, education, working_experience, award, image) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    private static final String SELECT = "SELECT * FROM Dentists WHERE username=?";
    private static final String SELECT_EMAIL = "SELECT * FROM Customers WHERE email=?";
    private static final String SELECT_MAX_DENTIST_ID = "SELECT MAX(id) AS maxDentistID FROM Dentists WHERE LEN(id) = (SELECT MAX(LEN(id)) FROM Dentists)";
    private static final String SEARCH = "SELECT * FROM Dentists WHERE personal_name LIKE ? ";
    private static final String UPDATE = "UPDATE Dentists SET personal_name = ?, gender = ?, speciality = ?, description = ?, education = ?, working_experience = ?, award = ?, image = ? WHERE id= ? ";
    private static final String DELETE = "UPDATE Dentists SET status = 0 WHERE id=?";
    private static final String RESTORE = "UPDATE Dentists SET status = 1 WHERE id=?";
    private static final String GET_DENTIST = "SELECT * FROM Dentists WHERE id=?";
    private static final String GET_ALL_DENTIST = "SELECT * FROM Dentists";
    private static final String GET_EARN_DENTIST = "SELECT Invoices.appointment_id, Invoices.price, Dentists.id, Invoices.status\n"
            + "FROM ((Invoices\n"
            + "INNER JOIN Appointments ON Appointments.id = Invoices.appointment_id)\n"
            + "INNER JOIN Dentists ON Dentists.id = Appointments.dentist_id)";

    public List<Invoice> getInvoice () throws SQLException {
        List invoiceList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_EARN_DENTIST);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("id");
                    String appointmentId = rs.getString("appointment_id");
                    int price = rs.getInt("price");
                    byte status = rs.getByte("status");
                    invoiceList.add(new Invoice(id, appointmentId, price, status));
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
        return invoiceList;
    }

    public String getMaxDentistID() throws SQLException {
        String maxDentistID = "";
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SELECT_MAX_DENTIST_ID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    if (rs.getString("maxDentistID") == null) {
                        maxDentistID = "DT0";
                    } else {
                        maxDentistID = rs.getString("maxDentistID");
                    }
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
        return maxDentistID;
    }

    public boolean checkDuplicateEmail(String email) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SELECT_EMAIL);
                ptm.setString(1, email);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = true;
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

    public boolean checkDuplicate(String username) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SELECT);
                ptm.setString(1, username);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = true;
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

    public boolean deleteDentist(String ID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE);
                ptm.setString(1, ID);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean restoreDentist(String ID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(RESTORE);
                ptm.setString(1, ID);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean createDentist(Dentist dentist) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE);
                ptm.setString(1, dentist.getId());
                ptm.setString(2, dentist.getUsername());
                ptm.setString(3, dentist.getPassword());
                ptm.setString(4, dentist.getRole());
                ptm.setString(5, dentist.getPersonalName());
                ptm.setFloat(6, dentist.getRate());
                ptm.setByte(7, dentist.getGender());
                ptm.setByte(8, dentist.getStatus());
                ptm.setString(9, dentist.getSpeciality());
                ptm.setString(10, dentist.getDescription());
                ptm.setString(11, dentist.getEducation());
                ptm.setInt(12, dentist.getWorkingExperience());
                ptm.setString(13, dentist.getAward());
                ptm.setString(14, dentist.getImage());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public List<Dentist> searchListDentist(String search) throws SQLException {
        List dentistList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("id");
                    String personalName = rs.getString("personal_name");
                    float rate = rs.getFloat("rate");
                    String description = rs.getString("description");
                    String education = rs.getString("education");
                    int workingExperience = rs.getInt("working_experience");
                    String award = rs.getString("award");
                    String speciality = rs.getString("speciality");
                    String image = rs.getString("image");
                    byte gender = rs.getByte("gender");
                    byte status = rs.getByte("status");
                    dentistList.add(new Dentist(id, personalName, rate, gender, status, speciality, description, education, workingExperience, award, image));
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
        return dentistList;
    }

    public boolean updateDentist(Dentist dentist) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE);
                ptm.setString(1, dentist.getPersonalName());
                ptm.setByte(2, dentist.getGender());
                ptm.setString(3, dentist.getSpeciality());
                ptm.setString(4, dentist.getDescription());
                ptm.setString(5, dentist.getEducation());
                ptm.setInt(6, dentist.getWorkingExperience());
                ptm.setString(7, dentist.getAward());
                ptm.setString(8, dentist.getImage());
                ptm.setString(9, dentist.getId());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public Dentist getDentistForAppointment(String id) throws SQLException {
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

    public List<Dentist> getAllListDentist() throws SQLException {
        List dentistList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL_DENTIST);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("id");
                    String personalName = rs.getString("personal_name");
                    float rate = rs.getFloat("rate");
                    String description = rs.getString("description");
                    String education = rs.getString("education");
                    int workingExperience = rs.getInt("working_experience");
                    String award = rs.getString("award");
                    String speciality = rs.getString("speciality");
                    String image = rs.getString("image");
                    byte gender = rs.getByte("gender");
                    byte status = rs.getByte("status");
                    dentistList.add(new Dentist(id, personalName, rate, gender, status, speciality, description, education, workingExperience, award, image));
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
        return dentistList;
    }
}
