/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptproject.SWP391.manager.customer;

import com.fptproject.SWP391.dbutils.DBUtils;
import com.fptproject.SWP391.model.Invoice;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author hieunguyen
 */
public class InvoiceManager {
    private static final String GET_INVOICE_BY_APPOINTMENT_ID = " SELECT * FROM Invoices WHERE appointment_id=? ";
    private static final String GET_INVOICE_BY_ID = " SELECT * FROM Invoices WHERE id=? ";
    
    public Invoice getInvoiceByAppointmentID(String ID) throws SQLException{
        Invoice invoice = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try{        
            conn= DBUtils.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(GET_INVOICE_BY_APPOINTMENT_ID);
                ptm.setString(1, ID);
                rs = ptm.executeQuery();
                if(rs.next()){
                    String id= rs.getString("id");
                    String appointmentID = rs.getString("appointment_id");
                    String employeeID = rs.getString("employee_id");
                    int price = rs.getInt("price");
                    byte payment_method = rs.getByte("payment_method");
                    byte status = rs.getByte("status");
                    invoice = new Invoice(id, appointmentID, employeeID, price, payment_method, status);
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(rs!=null) rs.close();
            if(ptm!=null) ptm.close();
            if(conn!=null) conn.close();
        }
        return invoice;
    }
    public Invoice getInvoiceByID(String ID) throws SQLException{
        Invoice invoice = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try{        
            conn= DBUtils.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(GET_INVOICE_BY_ID);
                ptm.setString(1, ID);
                rs = ptm.executeQuery();
                if(rs.next()){
                    String id= rs.getString("id");
                    String appointmentID = rs.getString("appointment_id");
                    String employeeID = rs.getString("employee_id");
                    int price = rs.getInt("price");
                    byte payment_method = rs.getByte("payment_method");
                    byte status = rs.getByte("status");
                    invoice = new Invoice(id, appointmentID, employeeID, price, payment_method, status);
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(rs!=null) rs.close();
            if(ptm!=null) ptm.close();
            if(conn!=null) conn.close();
        }
        return invoice;
    }
}
