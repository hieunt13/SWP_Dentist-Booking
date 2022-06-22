/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptproject.SWP391.manager.employee;

import com.fptproject.SWP391.dbutils.DBUtils;
import com.fptproject.SWP391.model.Customer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author admin
 */
public class EmployeeCustomerManager {
    private static final String SELECT_WITH_ID = "SELECT personal_name,image FROM Customers WHERE id=?";
    public Customer getCustomerForAppointment(String id) throws SQLException{
        Customer customer = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SELECT_WITH_ID);
                ptm.setString(1, id);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String personalName = rs.getString("personal_name");
                    String image = rs.getString("image");
                    customer = new Customer(personalName, image);
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
        return customer;
        
    }
}
