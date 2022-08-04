/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptproject.SWP391.manager.dentist;

import com.fptproject.SWP391.dbutils.DBUtils;
import com.fptproject.SWP391.model.Appointment;
import com.fptproject.SWP391.model.Customer;
import com.fptproject.SWP391.model.Dentist;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author hieunguyen
 */
public class DentistAppointmentManager {

    private static final String APPOINTMENT_LIST = "SELECT * FROM Appointments WHERE dentist_id=?";
    private static final String UPDATE_DENTISTCONFIRM = "UPDATE Appointments SET dentist_confirm=? WHERE id=?";
    private static final String UPDATE_DENTISTNOTE = "UPDATE Appointments SET dentist_note=? WHERE id=?";
    private static final String CUSTOMER_LIST = "SELECT * FROM Customers WHERE customer_id=?";
    private static final String DELETE = "DELETE Appointments WHERE id=?";
    private static final String APPOINTMENT_LIST_DASHBOARD = "SELECT Appointments.id AS Appointment_id,Appointments.book_date,Appointments.book_time, dentist_id, customer_id, meeting_date, Appointments.[status], Appointments.customer_symptom, dentist_note, payment_confirm, dentist_confirm, Customers.id, Customers.personal_name,Customers.gender ,Customers.image FROM Appointments\n"
            + "INNER JOIN Customers ON Appointments.customer_id = Customers.id\n"
            + "WHERE dentist_id=?";
//    private final static String APPOINTMENT_LIST_DENTIST = "SELECT Appointments.book_date,Appointments.book_time,Appointments.id, dentist_id, customer_id, meeting_date, Appointments.[status], Appointments.customer_symptom, dentist_note, payment_confirm, dentist_confirm, Dentists.username AS DentistUsername, Dentists.role as DentistRole, Dentists.personal_name AS DentistPersonalName, speciality, Dentists.[image] AS DentistImage FROM Appointments \n"
//            + "            INNER JOIN Dentists ON Appointments.dentist_id = Dentists.id\n"
//            + "            WHERE Appointments.dentist_id = ? ";
//    
//    public List<Appointment> getListAppointmentDentist(String dentistID) throws SQLException {
//        Dentist dentist = new Dentist();
//        List<Appointment> list = new ArrayList<>();
//        Connection conn = null;
//        PreparedStatement ptm = null;
//        ResultSet rs = null;
//        try {
//            conn = DBUtils.getConnection();
//            if (conn != null) {
//                ptm = conn.prepareStatement(APPOINTMENT_LIST_DENTIST);
//                ptm.setString(1, dentistID);
//                rs = ptm.executeQuery();
//                while (rs.next()) {
//                    String id = rs.getString("id");
//                    String dentistId = rs.getString("dentist_id");
//                    Date meetingDate = rs.getDate("meeting_date");
//                    String dentistNote = rs.getString("dentist_note");
//                    String customerSymptom = rs.getString("customer_symptom");
//                    int status = rs.getInt("status");
//                    byte paymentConfirm = rs.getByte("payment_confirm");
//                    int dentistConfirm = rs.getInt("dentist_confirm");
//                    String dentistUserName = rs.getString("DentistUsername");
//                    String dentistRole = rs.getString("DentistRole");
//                    String dentistPersonalName = rs.getString("DentistPersonalName");
//                    String speciality = rs.getString("speciality");
//                    String dentistImage = rs.getString("DentistImage");
//                    Date bookDate = rs.getDate("book_date");
//                    dentist = new Dentist(dentistId, dentistUserName, dentistRole, dentistPersonalName, speciality, dentistImage);
//
//                    Appointment appointment = new Appointment(id, dentistId, customerID, meetingDate, dentistNote, customerSymptom, status, paymentConfirm, dentistConfirm, dentist);
//                    appointment.setBookTime(rs.getTime("book_time"));
//                    appointment.setBookDate(bookDate);
//                    list.add(appointment);
//                }
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            if (rs != null) {
//                rs.close();
//            }
//            if (ptm != null) {
//                ptm.close();
//            }
//            if (conn != null) {
//                conn.close();
//            }
//        }
//        return list;
//    }
    
    public List<Appointment> getListAppointmentDashboad(String dentistID) throws SQLException {
        List<Appointment> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(APPOINTMENT_LIST_DASHBOARD);
                ptm.setString(1, dentistID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("Appointment_id");
                    String customerID = rs.getString("customer_id");
                    Date meeetingDate = rs.getDate("meeting_date");
                    String dentistNote = rs.getString("dentist_note");
                    String customerSymptom = rs.getString("customer_symptom");
                    int status = rs.getInt("status");
                    byte paymentConfirm = rs.getByte("payment_confirm");
                    int dentistConfirm = rs.getInt("dentist_confirm");
                    String customerPersonalName = rs.getString("personal_name");
                    Byte gender = rs.getByte("gender");
                    String image = rs.getString("image");
                    Customer customer = new Customer(customerID, customerPersonalName, gender, image);
                    Appointment appointment = new Appointment(id, dentistID, customerID, meeetingDate, dentistNote, customerSymptom, status, paymentConfirm, dentistConfirm, customer);
                    list.add(appointment);
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

    public List<Customer> getListCustomer(String customer_id) throws SQLException {
        List<Customer> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CUSTOMER_LIST);
                ptm.setString(1, customer_id);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String userName = rs.getString("user_name");
                    String role = rs.getString("role");
                    String personalName = rs.getString("personal_name");
                    String phoneNumber = rs.getString("phone_number");
                    String email = rs.getString("email");
                    String iamge = rs.getString("image");
                    String address = rs.getString("address");
                    Customer customer = new Customer(userName, role, personalName, phoneNumber, email, iamge, address);
                    list.add(customer);
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

    public boolean setDentistNote(String note, String id) throws SQLException {
        Boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_DENTISTNOTE);
                ptm.setString(1, note);
                ptm.setString(2, id);
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

    public boolean setDentistConfirm(int dentistConfirm, String id) throws SQLException {
        Boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_DENTISTCONFIRM);
                ptm.setInt(1, dentistConfirm);
                ptm.setString(2, id);
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

    public List<Appointment> getListAppointment(String dentistID) throws SQLException {
        List<Appointment> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(APPOINTMENT_LIST);
                ptm.setString(1, dentistID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("id");
                    String customerID = rs.getString("customer_id");
                    Date meetingDate = rs.getDate("meeting_date");
                    String dentistNote = rs.getString("dentist_note");
                    String customerSymptom = rs.getString("customer_symptom");
                    int status = rs.getInt("status");
                    byte paymentConfirm = rs.getByte("payment_confirm");
                    int dentistConfirm = rs.getInt("dentist_confirm");
                    Appointment appointment = new Appointment(id, dentistID, customerID, meetingDate, dentistNote, customerSymptom, status, paymentConfirm, dentistConfirm);
                    list.add(appointment);
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

    public Appointment getAppointment(String dentistID) throws SQLException {
        Appointment appointment = new Appointment();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(APPOINTMENT_LIST);
                ptm.setString(1, dentistID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("id");
                    String customerID = rs.getString("customer_id");
                    Date meetingDate = rs.getDate("meeting_date");
                    String dentistNote = rs.getString("dentist_note");
                    String customerSymptom = rs.getString("customer_symptom");
                    int status = rs.getInt("status");
                    byte paymentConfirm = rs.getByte("payment_confirm");
                    int dentistConfirm = rs.getInt("dentist_confirm");
                    appointment = new Appointment(id, dentistID, customerID, meetingDate, dentistNote, customerSymptom, status, paymentConfirm, dentistConfirm);
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
        return appointment;
    }

    public boolean deleteAppointment(String ID) throws SQLException {
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
}
