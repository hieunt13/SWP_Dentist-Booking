///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
// */
//package com.fptproject.SWP391.manager.employee;
//
//import com.fptproject.SWP391.dbutils.DBUtils;
//import com.fptproject.SWP391.model.Appointment;
//import com.fptproject.SWP391.model.AppointmentDetail;
//import com.fptproject.SWP391.model.Customer;
//import com.fptproject.SWP391.model.Dentist;
//import com.fptproject.SWP391.model.Service;
//import java.sql.Connection;
//import java.sql.Date;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.ArrayList;
//import java.util.List;
//
///**
// *
// * @author dangnguyen
// */
//public class EmployeeAppointmentDetailManager {
//
//    private final static String APPOINTMENTDETAIL_PENDING_LIST = "SELECT Appointments.id, dentist_id, customer_id, meeting_date, Appointments.[status], \n" +
//"payment_confirm, dentist_confirm, Dentists.username AS DentistUsername, Appointments.customer_symptom, Appointments.dentist_note, Dentists.role as DentistRole, \n" +
//"Dentists.personal_name AS DentistPersonalName, speciality, Dentists.[image] AS DentistImage, \n" +
//"Customers.username AS CustomerUserName, Customers.role AS CustomerRole, \n" +
//"Customers.personal_name AS CustomerPersonalName, Customers.[image] AS CustomerImage, \n" +
//"Customers.email AS CustomerEmail, phone_number, AppointmentDetail.slot AS AppointmentDetailSlot,\n" +
//"Services.id AS ServiceID,Services.service_name, Services.price AS ServicePrice, promotion_id, short_description, long_description, Services.[status] AS ServiceStatus, Services.[image]  AS ServiceImage\n" +
//"FROM Appointments  \n" +
//"INNER JOIN Dentists ON Appointments.dentist_id = Dentists.id\n" +
//"INNER JOIN Customers ON Appointments.customer_id = Customers.id\n" +
//"INNER JOIN AppointmentDetail ON Appointments.id = AppointmentDetail.id\n" +
//"INNER JOIN Services ON AppointmentDetail.service_id = Services.id\n" +
//"WHERE  Appointments.[status] = 1 AND  Appointments.dentist_confirm = 2 AND Customers.blacklist_status = 0 ";
//    public List<AppointmentDetail> getListPendingAppointmentDetail() throws SQLException {
//        Customer customer = new Customer();
//        Dentist dentist = new Dentist();
//        Service service = new Service();
//        Appointment appointment = new Appointment();
//
//        List<AppointmentDetail> list = new ArrayList<>();
//        Connection conn = null;
//        PreparedStatement ptm = null;
//        ResultSet rs = null;
//        try {
//            conn = DBUtils.getConnection();
//            if (conn != null) {
//                ptm = conn.prepareStatement(APPOINTMENTDETAIL_PENDING_LIST);
//                rs = ptm.executeQuery();
//                while (rs.next()) {
////==========appointment detail   
//                    int appointmentDetailSlot = rs.getInt("AppointmentDetailSlot");
////==========appointment                    
//                    String id = rs.getString("id");
//                    String customerID = rs.getString("customer_id");
//                    String dentistId = rs.getString("dentist_id");
//                    Date meetingDate = rs.getDate("meeting_date");
//                    String dentistNote = rs.getString("dentist_note");
//                    String customerSymptom = rs.getString("customer_symptom");
//                    int status = rs.getInt("status");
//                    byte paymentConfirm = rs.getByte("payment_confirm");
//                    int dentistConfirm = rs.getInt("dentist_confirm");
//                    appointment = new Appointment(id, dentistId, customerID, meetingDate, dentistNote, customerSymptom, status, paymentConfirm, dentistConfirm, dentist, customer);
////==========dentist
//                    String dentistUserName = rs.getString("DentistUsername");
//                    String dentistRole = rs.getString("DentistRole");
//                    String dentistPersonalName = rs.getString("DentistPersonalName");
//                    String speciality = rs.getString("speciality");
//                    String dentistImage = rs.getString("DentistImage");
//                    dentist = new Dentist(dentistUserName, dentistRole, dentistPersonalName, speciality, dentistImage);
////==========customer
//                    String customerUsername = rs.getString("CustomerUserName");
//                    String customerRole = rs.getString("CustomerRole");
//                    String customerPersonalName = rs.getString("CustomerPersonalName");
//                    String customerImage = rs.getString("CustomerImage");
//                    String customerEmail = rs.getString("CustomerEmail");
//                    String phoneNumber = rs.getString("phone_number");
//                    customer = new Customer(customerUsername, customerRole, customerPersonalName, phoneNumber, customerEmail, customerImage);
////==========service                    
//                    String serviceID = rs.getString("ServiceID");
//                    String serviceName = rs.getString("service_name");
//                    String promotionId = rs.getString("promotion_id");
//                    String shortDescription = rs.getString("short_description");
//                    String longDescription = rs.getString("long_description");
//                    int servicePrice = rs.getInt("ServicePrice");
//                    String serviceImage = rs.getString("ServiceImage");
//                    Byte serviceStatus = rs.getByte("ServiceStatus");
//                    service = new Service(serviceID, serviceName, promotionId, shortDescription, longDescription, servicePrice, serviceImage, serviceStatus);
//                    
//                    
//                    AppointmentDetail appointmentDetail = new AppointmentDetail(id, serviceID, appointmentDetailSlot, appointment, service);
//                    list.add(appointmentDetail);
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
//
//}
