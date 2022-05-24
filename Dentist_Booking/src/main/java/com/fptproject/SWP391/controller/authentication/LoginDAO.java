/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptproject.SWP391.controller.authentication;

import com.fptproject.SWP391.dbutils.DBUtils;
import com.fptproject.SWP391.model.Customer;
import com.fptproject.SWP391.model.Dentist;
import com.fptproject.SWP391.model.Employee;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author dangnguyen
 */
public class LoginDAO {
    
        private static final String CUSTOMER_LOGIN = "SELECT personal_name, id, role from Customers WHERE username = ? and password = ?";
        private static final String DENTIST_LOGIN = "SELECT personal_name, id, role from Dentists WHERE [username] = ? and [password] = ?";
        private static final String EMPLOYEE_LOGIN = "SELECT personal_name, id, role from Employees WHERE [username] = ? and [password] = ?";

    
   public Customer checkLoginCustomer(String username, String password) throws SQLException {
        Customer customer = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CUSTOMER_LOGIN);
                ptm.setString(1, username);
                ptm.setString(2, password);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String personalName = rs.getString("personal_name");
                    String id = rs.getString("id");
                    String role = rs.getString("role");
                    customer = new Customer(id, username, role, personalName);
                }
            }
        } catch (Exception e) {
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
   public Dentist checkLoginDentist(String username, String password) throws SQLException {
        Dentist dentist = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DENTIST_LOGIN);
                ptm.setString(1, username);
                ptm.setString(2, password);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String personalName = rs.getString("personal_name");
                    String id = rs.getString("id");
                    String role = rs.getString("role");
                    dentist = new Dentist(id, username, role, personalName);
                }
            }
        } catch (Exception e) {
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
   public Employee checkLoginEmployee(String username, String password) throws SQLException {
        Employee employee = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(EMPLOYEE_LOGIN);
                ptm.setString(1, username);
                ptm.setString(2, password);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String personalName = rs.getString("personal_name");
                    String id = rs.getString("id");
                    String role = rs.getString("role");
                    employee = new Employee(id, username, role, personalName);
                }
            }
        } catch (Exception e) {
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
        return employee;
    }
}
