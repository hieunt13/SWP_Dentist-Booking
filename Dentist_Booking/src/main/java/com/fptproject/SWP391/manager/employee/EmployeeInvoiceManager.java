/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptproject.SWP391.manager.employee;

import com.fptproject.SWP391.dbutils.DBUtils;
import com.fptproject.SWP391.model.Invoice;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author dangnguyen
 */
public class EmployeeInvoiceManager {

    private static final String CREATE = "INSERT INTO Invoices (id, appointment_id, employee_id, price, payment_method, creditcard_inf, [status])\n"
            + "VALUES (?, ?, ?, ?, ?, '',1);";
    private static final String SELECT_MAX_INVOICE_ID= "SELECT MAX(id) as maxInvoiceID FROM Invoices WHERE LEN(id) = (SELECT MAX(LEN(id)) FROM Invoices)";

    public boolean createInvoice(Invoice invoice) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE);
                ptm.setString(1, invoice.getId());
                ptm.setString(2, invoice.getAppointmentId());
                ptm.setString(3, invoice.getEmployeeId());
                ptm.setInt(4, invoice.getPrice());
                ptm.setByte(5, invoice.getPaymentMethod());
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
    public String getMaxInvoiceID() throws SQLException{
        String maxInvoiceID="";
        Connection conn=null;
        PreparedStatement ptm=null;
        ResultSet rs=null;
        try{
            conn= DBUtils.getConnection();
            if(conn!=null){
                ptm= conn.prepareStatement(SELECT_MAX_INVOICE_ID);
                rs= ptm.executeQuery();
                if(rs.next()){
                    if(rs.getString("maxInvoiceID") == null){
                        maxInvoiceID="IN0";
                    }
                    else{
                        maxInvoiceID= rs.getString("maxInvoiceID");
                    }
                }          
            }           
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(rs!=null) rs.close();
            if(ptm!=null) ptm.close();
            if(conn!=null) conn.close();           
        }
        return maxInvoiceID;
    }

}
