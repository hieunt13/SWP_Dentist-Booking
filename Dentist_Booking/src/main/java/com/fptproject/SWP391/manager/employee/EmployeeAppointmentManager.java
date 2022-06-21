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
import com.fptproject.SWP391.model.Promotion;
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

    private final static String APPOINTMENT_PENDING_LIST = "SELECT Appointments.id, dentist_id, customer_id, meeting_date, dentist_note, customer_symptom, Appointments.[status], payment_confirm, dentist_confirm, Dentists.username AS DentistUsername, Dentists.role as DentistRole, Dentists.personal_name AS DentistPersonalName, speciality, Dentists.[image] AS DentistImage, Customers.username AS CustomerUserName, Customers.role AS CustomerRole,address, Customers.personal_name AS CustomerPersonalName, Customers.[image] AS CustomerImage, Customers.email AS CustomerEmail, phone_number FROM Appointments  \n"
            + "INNER JOIN Dentists ON Appointments.dentist_id = Dentists.id\n"
            + "INNER JOIN Customers ON Appointments.customer_id = Customers.id\n"
            + "WHERE  Appointments.[status] = 1 AND Customers.blacklist_status = 0 AND Customers.[status] = 1;";

    private final static String APPOINTMENT_CHECKOUT_LIST = "SELECT Appointments.id, dentist_id, customer_id, meeting_date,dentist_note, customer_symptom,  Appointments.[status], payment_confirm, dentist_confirm, Dentists.username AS DentistUsername, Dentists.role as DentistRole, Dentists.personal_name AS DentistPersonalName, speciality, Dentists.[image] AS DentistImage, Customers.username AS CustomerUserName, Customers.role AS CustomerRole, address, Customers.personal_name AS CustomerPersonalName, Customers.[image] AS CustomerImage, Customers.email AS CustomerEmail, phone_number FROM Appointments  \n"
            + "INNER JOIN Dentists ON Appointments.dentist_id = Dentists.id\n"
            + "INNER JOIN Customers ON Appointments.customer_id = Customers.id\n"
            + "WHERE  Appointments.[status] = 2 AND Customers.blacklist_status = 0 AND Customers.[status] = 1;";

    private final static String GET_INVOICE_APPOINTMENT = "SELECT Appointments.id, dentist_id, customer_id, meeting_date,dentist_note, customer_symptom,  Appointments.[status], payment_confirm, dentist_confirm, Dentists.username AS DentistUsername, Dentists.role as DentistRole, Dentists.personal_name AS DentistPersonalName, speciality, Dentists.[image] AS DentistImage, Customers.username AS CustomerUserName, Customers.role AS CustomerRole, address, Customers.personal_name AS CustomerPersonalName, Customers.[image] AS CustomerImage, Customers.email AS CustomerEmail, phone_number FROM Appointments  \n" +
"            INNER JOIN Dentists ON Appointments.dentist_id = Dentists.id\n" +
"            INNER JOIN Customers ON Appointments.customer_id = Customers.id\n" +
"            WHERE Appointments.id = ? AND  Appointments.[status] = 2 AND Customers.blacklist_status = 0 AND Customers.[status] = 1;";

    private final static String APPOINTMENT_CANCELLED_LIST = "SELECT Appointments.id, dentist_id, customer_id, meeting_date, Appointments.[status], payment_confirm, dentist_confirm, Dentists.username AS DentistUsername, Dentists.role as DentistRole, Dentists.personal_name AS DentistPersonalName, speciality, Dentists.[image] AS DentistImage, Customers.username AS CustomerUserName, Customers.role AS CustomerRole, address, Customers.personal_name AS CustomerPersonalName, Customers.[image] AS CustomerImage, Customers.email AS CustomerEmail, phone_number FROM Appointments  \n"
            + "INNER JOIN Dentists ON Appointments.dentist_id = Dentists.id\n"
            + "INNER JOIN Customers ON Appointments.customer_id = Customers.id\n"
            + "WHERE  Appointments.[status] = 0 AND Customers.[status] = 1;";

    private final static String SERVICES_APPLY = "SELECT AppointmentDetail.id, AppointmentDetail.slot as AppointmentSlot,  Services.id AS ServiceID,Services.service_name, Services.price AS ServicePrice, promotion_id, short_description, long_description, Services.[status] AS ServiceStatus, Services.[image]  AS ServiceImage FROM AppointmentDetail  \n"
            + "INNER JOIN Services ON AppointmentDetail.service_id = Services.id\n"
            + "WHERE AppointmentDetail.id = ?";

    private final static String INVOICE_DETAIL_BEFORE_PAY = "SELECT AppointmentDetail.id, AppointmentDetail.slot as AppointmentSlot,  Services.id AS ServiceID,Services.service_name, Services.price AS ServicePrice, promotion_id, services.short_description, services.long_description, Services.[status] AS ServiceStatus, Services.[image]  AS ServiceImage, discount_percentage FROM AppointmentDetail  \n"
            + "            INNER JOIN Services ON AppointmentDetail.service_id = Services.id\n"
            + "            LEFT JOIN Promotions ON Services.promotion_id = Promotions.id\n"
            + "            WHERE AppointmentDetail.id = ?";

    private static final String UPDATE_PENDING_APPOINTMENT_STATUS = "UPDATE Appointments SET [status] = 2 WHERE Appointments.id = ?";
    private static final String UPDATE_FINISH_APPOINTMENT_STATUS = "UPDATE Appointments SET [status] = 3, payment_confirm = 1  WHERE Appointments.id = ?";
    private static final String GET_APPOINTMENT_STATUS = "SELECT [status], payment_confirm, dentist_confirm from Appointments WHERE Appointments.id = ?";

    public boolean checkAppointmentStatus(String appointmentID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_APPOINTMENT_STATUS);
                ptm.setString(1, appointmentID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    int appointmentStatus = rs.getInt("status");
                    int dentistConfirm = rs.getInt("dentist_confirm");
                    if (appointmentStatus == 2 && dentistConfirm == 2) {
                        check = true;
                    }
                }

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

    public boolean updatePendingAppointment(String appointmentID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_PENDING_APPOINTMENT_STATUS);
                ptm.setString(1, appointmentID);
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

    public boolean updateFinishAppointment(String appointmentID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_FINISH_APPOINTMENT_STATUS);
                ptm.setString(1, appointmentID);
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
                int appointmentDetailSlot = rs.getInt("AppointmentSlot");
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

    public ArrayList<AppointmentDetail> invoiceDetailBeforePay(String appointmentID) throws SQLException {
        ArrayList<AppointmentDetail> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        Service service = new Service();
        Promotion promotion = new Promotion();
        try {
            con = DBUtils.getConnection();
            if (con == null) {
                throw new NullPointerException("there isn't any database server connection");
            }
            ps = con.prepareStatement(INVOICE_DETAIL_BEFORE_PAY);
            ps.setString(1, appointmentID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int appointmentDetailSlot = rs.getInt("AppointmentSlot");
                //=====service                    
                String serviceID = rs.getString("ServiceID");
                String serviceName = rs.getString("service_name");
                String promotionId = rs.getString("promotion_id");
                if (promotionId == null ){
                    promotionId = "";
                }
                String shortDescription = rs.getString("short_description");
                String longDescription = rs.getString("long_description");
                int servicePrice = rs.getInt("ServicePrice");
                String serviceImage = rs.getString("ServiceImage");
                Byte serviceStatus = rs.getByte("ServiceStatus");
                //=====promotion
                Float discountPercentage = rs.getFloat("discount_percentage");
                if (discountPercentage == null ){
                    discountPercentage = 0f;
                }
                promotion = new Promotion(discountPercentage);

                service = new Service(serviceID, serviceName, promotionId, shortDescription, longDescription, servicePrice, serviceImage, serviceStatus, promotion);
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
                    String dentistNote = rs.getString("dentist_note");
                    String customerSymptom = rs.getString("customer_symptom");

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
                    String address = rs.getString("address");

                    customer = new Customer(customerUsername, customerRole, customerPersonalName, phoneNumber, customerEmail, customerImage, address);

                    Appointment appointment = new Appointment(id, dentistId, customerID, meetingDate, dentistNote, customerSymptom, status, paymentConfirm, dentistConfirm, dentist, customer);
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
                    String dentistNote = rs.getString("dentist_note");
                    String customerSymptom = rs.getString("customer_symptom");

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
                    String address = rs.getString("address");
                    customer = new Customer(customerUsername, customerRole, customerPersonalName, phoneNumber, customerEmail, customerImage, address);

                    Appointment appointment = new Appointment(id, dentistId, customerID, meetingDate, dentistNote, customerSymptom, status, paymentConfirm, dentistConfirm, dentist, customer);

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

    public List<Appointment> getInvoiceAppointment(String appointmentID) throws SQLException {
        Customer customer = new Customer();
        Dentist dentist = new Dentist();
        List<Appointment> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_INVOICE_APPOINTMENT);
                ptm.setString(1, appointmentID);
                rs = ptm.executeQuery();
                while (rs.next()) {

                    String id = rs.getString("id");
                    String customerID = rs.getString("customer_id");
                    String dentistId = rs.getString("dentist_id");
                    Date meetingDate = rs.getDate("meeting_date");
                    String dentistNote = rs.getString("dentist_note");
                    String customerSymptom = rs.getString("customer_symptom");

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
                    String address = rs.getString("address");
                    customer = new Customer(customerUsername, customerRole, customerPersonalName, phoneNumber, customerEmail, customerImage, address);

                    Appointment appointment = new Appointment(id, dentistId, customerID, meetingDate, dentistNote, customerSymptom, status, paymentConfirm, dentistConfirm, dentist, customer);

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
                    String address = rs.getString("address");

                    customer = new Customer(customerUsername, customerRole, customerPersonalName, phoneNumber, customerEmail, customerImage, address);

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
