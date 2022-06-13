/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptproject.SWP391.manager.employee;

import com.fptproject.SWP391.dbutils.DBUtils;
import com.fptproject.SWP391.model.Appointment;
import com.fptproject.SWP391.model.AppointmentDetail;
import com.fptproject.SWP391.model.Customer;
import com.fptproject.SWP391.model.Dentist;
import com.fptproject.SWP391.model.Service;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author dangnguyen
 */
public class EmployeeAppointmentManager {

    private final static String APPOINTMENT_PENDING_LIST = "SELECT Appointments.id, dentist_id, customer_id, meeting_date, Appointments.[status], payment_confirm, dentist_confirm, Dentists.username AS DentistUsername, Dentists.role as DentistRole, Dentists.personal_name AS DentistPersonalName, speciality, Dentists.[image] AS DentistImage, Customers.username AS CustomerUserName, Customers.role AS CustomerRole, Customers.personal_name AS CustomerPersonalName, Customers.[image] AS CustomerImage, Customers.email AS CustomerEmail, phone_number FROM Appointments  \n"
            + "INNER JOIN Dentists ON Appointments.dentist_id = Dentists.id\n"
            + "INNER JOIN Customers ON Appointments.customer_id = Customers.id\n"
            + "WHERE  Appointments.[status] = 1 AND Customers.blacklist_status = 0 AND Customers.[status] = 1;";
    
    private final static String APPOINTMENT_CHECKOUT_LIST = "SELECT Appointments.id, dentist_id, customer_id, meeting_date, Appointments.[status], payment_confirm, dentist_confirm, Dentists.username AS DentistUsername, Dentists.role as DentistRole, Dentists.personal_name AS DentistPersonalName, speciality, Dentists.[image] AS DentistImage, Customers.username AS CustomerUserName, Customers.role AS CustomerRole, Customers.personal_name AS CustomerPersonalName, Customers.[image] AS CustomerImage, Customers.email AS CustomerEmail, phone_number FROM Appointments  \n"
            + "INNER JOIN Dentists ON Appointments.dentist_id = Dentists.id\n"
            + "INNER JOIN Customers ON Appointments.customer_id = Customers.id\n"
            + "WHERE  Appointments.[status] = 2 AND Appointments.dentist_confirm = 2 AND Customers.blacklist_status = 0 AND Customers.[status] = 1;";
    
    private final static String APPOINTMENT_CANCELLED_LIST = "SELECT Appointments.id, dentist_id, customer_id, meeting_date, Appointments.[status], payment_confirm, dentist_confirm, Dentists.username AS DentistUsername, Dentists.role as DentistRole, Dentists.personal_name AS DentistPersonalName, speciality, Dentists.[image] AS DentistImage, Customers.username AS CustomerUserName, Customers.role AS CustomerRole, Customers.personal_name AS CustomerPersonalName, Customers.[image] AS CustomerImage, Customers.email AS CustomerEmail, phone_number FROM Appointments  \n"
            + "INNER JOIN Dentists ON Appointments.dentist_id = Dentists.id\n"
            + "INNER JOIN Customers ON Appointments.customer_id = Customers.id\n"
            + "WHERE  Appointments.[status] = 0 AND Customers.[status] = 1;";
    
    private final static String SERVICES_APPLY = "SELECT AppointmentDetail.id, AppointmentDetail.slot as AppointmentSlot,  Services.id AS ServiceID,Services.service_name, Services.price AS ServicePrice, promotion_id, short_description, long_description, Services.[status] AS ServiceStatus, Services.[image]  AS ServiceImage FROM AppointmentDetail  \n"
            + "INNER JOIN Services ON AppointmentDetail.service_id = Services.id\n"
            + "WHERE AppointmentDetail.id = ?";

    public ArrayList<AppointmentDetail> listAppointmentDetailApplied(String appointmentID) throws SQLException {
        ArrayList<AppointmentDetail> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        Service service = new Service();
        try {
            con = DBUtils.getConnection();
            if (con == null) {
                throw new NullPointerException("there isn't any database server connection");
            }
            ps = con.prepareStatement(SERVICES_APPLY);
            ps.setString(1, appointmentID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int appointmentDetailSlot = rs.getInt("AppointmentDetailSlot");
                //=====service                    
                String serviceID = rs.getString("ServiceID");
                String serviceName = rs.getString("service_name");
                String promotionId = rs.getString("promotion_id");
                String shortDescription = rs.getString("short_description");
                String longDescription = rs.getString("long_description");
                int servicePrice = rs.getInt("ServicePrice");
                String serviceImage = rs.getString("ServiceImage");
                Byte serviceStatus = rs.getByte("ServiceStatus");
                service = new Service(serviceID, serviceName, promotionId, shortDescription, longDescription, servicePrice, serviceImage, serviceStatus);
                AppointmentDetail appointmentDetail = new AppointmentDetail(appointmentID, serviceID, appointmentDetailSlot, service);
                list.add(appointmentDetail);
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

    public List<Appointment> getListPendingAppointment() throws SQLException {
        Customer customer = new Customer();
        Dentist dentist = new Dentist();
        List<Appointment> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(APPOINTMENT_PENDING_LIST);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("id");
                    String customerID = rs.getString("customer_id");
                    String dentistId = rs.getString("dentist_id");
                    Date meetingDate = rs.getDate("meeting_date");

                    int status = rs.getInt("status");
                    byte paymentConfirm = rs.getByte("payment_confirm");
                    int dentistConfirm = rs.getInt("dentist_confirm");

                    String dentistUserName = rs.getString("DentistUsername");
                    String dentistRole = rs.getString("DentistRole");
                    String dentistPersonalName = rs.getString("DentistPersonalName");
                    String speciality = rs.getString("speciality");
                    String dentistImage = rs.getString("DentistImage");
                    dentist = new Dentist(dentistUserName, dentistRole, dentistPersonalName, speciality, dentistImage);

                    String customerUsername = rs.getString("CustomerUserName");
                    String customerRole = rs.getString("CustomerRole");
                    String customerPersonalName = rs.getString("CustomerPersonalName");
                    String customerImage = rs.getString("CustomerImage");
                    String customerEmail = rs.getString("CustomerEmail");
                    String phoneNumber = rs.getString("phone_number");

                    customer = new Customer(customerUsername, customerRole, customerPersonalName, phoneNumber, customerEmail, customerImage);

                    Appointment appointment = new Appointment(id, dentistId, customerID, meetingDate, customerImage, status, paymentConfirm, dentistConfirm, dentist, customer);
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

    public List<Appointment> getListCheckoutAppointment() throws SQLException {
        Customer customer = new Customer();
        Dentist dentist = new Dentist();
        List<Appointment> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(APPOINTMENT_CHECKOUT_LIST);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("id");
                    String customerID = rs.getString("customer_id");
                    String dentistId = rs.getString("dentist_id");
                    Date meetingDate = rs.getDate("meeting_date");

                    int status = rs.getInt("status");
                    byte paymentConfirm = rs.getByte("payment_confirm");
                    int dentistConfirm = rs.getInt("dentist_confirm");

                    String dentistUserName = rs.getString("DentistUsername");
                    String dentistRole = rs.getString("DentistRole");
                    String dentistPersonalName = rs.getString("DentistPersonalName");
                    String speciality = rs.getString("speciality");
                    String dentistImage = rs.getString("DentistImage");
                    dentist = new Dentist(dentistUserName, dentistRole, dentistPersonalName, speciality, dentistImage);

                    String customerUsername = rs.getString("CustomerUserName");
                    String customerRole = rs.getString("CustomerRole");
                    String customerPersonalName = rs.getString("CustomerPersonalName");
                    String customerImage = rs.getString("CustomerImage");
                    String customerEmail = rs.getString("CustomerEmail");
                    String phoneNumber = rs.getString("phone_number");

                    customer = new Customer(customerUsername, customerRole, customerPersonalName, phoneNumber, customerEmail, customerImage);

                    Appointment appointment = new Appointment(id, dentistId, customerID, meetingDate, customerImage, status, paymentConfirm, dentistConfirm, dentist, customer);
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

    public List<Appointment> getListCancelledAppointment() throws SQLException {
        Customer customer = new Customer();
        Dentist dentist = new Dentist();
        List<Appointment> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(APPOINTMENT_CANCELLED_LIST);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("id");
                    String customerID = rs.getString("customer_id");
                    String dentistId = rs.getString("dentist_id");
                    Date meetingDate = rs.getDate("meeting_date");

                    int status = rs.getInt("status");
                    byte paymentConfirm = rs.getByte("payment_confirm");
                    int dentistConfirm = rs.getInt("dentist_confirm");

                    String dentistUserName = rs.getString("DentistUsername");
                    String dentistRole = rs.getString("DentistRole");
                    String dentistPersonalName = rs.getString("DentistPersonalName");
                    String speciality = rs.getString("speciality");
                    String dentistImage = rs.getString("DentistImage");
                    dentist = new Dentist(dentistUserName, dentistRole, dentistPersonalName, speciality, dentistImage);

                    String customerUsername = rs.getString("CustomerUserName");
                    String customerRole = rs.getString("CustomerRole");
                    String customerPersonalName = rs.getString("CustomerPersonalName");
                    String customerImage = rs.getString("CustomerImage");
                    String customerEmail = rs.getString("CustomerEmail");
                    String phoneNumber = rs.getString("phone_number");

                    customer = new Customer(customerUsername, customerRole, customerPersonalName, phoneNumber, customerEmail, customerImage);

                    Appointment appointment = new Appointment(id, dentistId, customerID, meetingDate, customerImage, status, paymentConfirm, dentistConfirm, dentist, customer);
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
}
