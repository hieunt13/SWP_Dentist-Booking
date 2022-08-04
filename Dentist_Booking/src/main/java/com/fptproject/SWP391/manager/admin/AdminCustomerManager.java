/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptproject.SWP391.manager.admin;

import com.fptproject.SWP391.dbutils.DBUtils;
import com.fptproject.SWP391.model.Customer;
import com.fptproject.SWP391.model.Invoice;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class AdminCustomerManager {

    private static final String SELECT = "SELECT * FROM Customers WHERE username=?";
    private static final String SEARCH = "SELECT * FROM Customers WHERE personal_name LIKE ? ";
    private static final String CREATE = "INSERT INTO Customers (id, username, password, role, personal_name, age, address, phone_number, email, gender, status, image, blacklist_status, id_hash, create_date) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    private static final String SELECT_MAX_CUSTOMER_ID = "SELECT MAX(id) AS maxCustomerID FROM Customers WHERE LEN(id) = (SELECT MAX(LEN(id)) FROM Customers)";
    private static final String DELETE = "UPDATE Customers SET status = 0 WHERE id=?";
    private static final String RESTORE = "UPDATE Customers SET status = 1 WHERE id=?";
    private static final String SELECT_WITH_ID = "SELECT personal_name,image FROM Customers WHERE id=?";
    private static final String RESTRICT_CUSTOMER = "UPDATE Customers SET blacklist_status = 1 WHERE Customers.id = ?";
    private static final String UNRESTRICT_CUSTOMER = "UPDATE Customers SET blacklist_status = 0 WHERE Customers.id = ?";
    private static final String GET_ALL_CUSTOMER = "SELECT * FROM Customers";
    private static final String GET_SPEND_CUSTOMER = "SELECT Invoices.appointment_id, Invoices.price, Customers.id, Invoices.status\n"
            + "FROM ((Invoices\n"
            + "INNER JOIN Appointments ON Appointments.id = Invoices.appointment_id)\n"
            + "INNER JOIN Customers ON Customers.id = Appointments.customer_id)";

    public List<Invoice> getInvoice() throws SQLException {
        List invoiceList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_SPEND_CUSTOMER);
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

    public List<Customer> searchListCustomer(String search) throws SQLException {
        List customerList = new ArrayList<>();
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
                    int age = rs.getInt("age");
                    String address = rs.getString("address");
                    String email = rs.getString("email");
                    String image = rs.getString("image");
                    String phone = rs.getString("phone_number");
                    byte gender = rs.getByte("gender");
                    int status = rs.getInt("status");
                    byte blacklistStatus = rs.getByte("blacklist_status");
                    customerList.add(new Customer(id, personalName, age, address, phone, email, gender, image, status, blacklistStatus));
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
        return customerList;
    }

    public boolean createCustomer(Customer customer) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String createDate = formatter.format(customer.getCreateDate());
                ptm = conn.prepareStatement(CREATE);
                ptm.setString(1, customer.getId());
                ptm.setString(2, customer.getUsername());
                ptm.setString(3, customer.getPassword());
                ptm.setString(4, customer.getRole());
                ptm.setString(5, customer.getPersonalName());
                ptm.setFloat(6, customer.getAge());
                ptm.setString(7, customer.getAddress());
                ptm.setString(8, customer.getPhoneNumber());
                ptm.setString(9, customer.getEmail());
                ptm.setByte(10, customer.getGender());
                ptm.setInt(11, customer.getStatus());
                ptm.setString(12, customer.getImage());
                ptm.setByte(13, customer.getBlacklistStatus());
                ptm.setString(14, customer.getIdHash());
                ptm.setString(15, createDate);
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

    public String getMaxCustomerID() throws SQLException {
        String maxCustomerID = "";
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SELECT_MAX_CUSTOMER_ID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    if (rs.getString("maxCustomerID") == null) {
                        maxCustomerID = "US";
                    } else {
                        maxCustomerID = rs.getString("maxCustomerID");
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
        return maxCustomerID;
    }

    public boolean deleteCustomer(String ID) throws SQLException {
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

    public boolean restoreCustomer(String ID) throws SQLException {
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

    public boolean restrictCustomer(String ID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(RESTRICT_CUSTOMER);
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

    public boolean unrestrictCustomer(String ID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UNRESTRICT_CUSTOMER);
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

    public Customer getCustomerForAppointment(String id) throws SQLException {
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

    public List<Customer> getAllListCustomer() throws SQLException {
        List customerList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL_CUSTOMER);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("id");
                    String personalName = rs.getString("personal_name");
                    int age = rs.getInt("age");
                    String address = rs.getString("address");
                    String email = rs.getString("email");
                    String image = rs.getString("image");
                    String phone = rs.getString("phone_number");
                    byte gender = rs.getByte("gender");
                    int status = rs.getInt("status");
                    byte blacklistStatus = rs.getByte("blacklist_status");
                    customerList.add(new Customer(id, personalName, age, address, phone, email, gender, image, status, blacklistStatus));
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
        return customerList;
    }
}
