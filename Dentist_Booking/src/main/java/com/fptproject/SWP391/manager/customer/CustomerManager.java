/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptproject.SWP391.manager.customer;

import com.fptproject.SWP391.dbutils.DBUtils;
import com.fptproject.SWP391.model.Customer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author hieunguyen
 */
public class CustomerManager {
    private static final String UPDATE_PASSWORD="UPDATE Customers SET password=? WHERE username=?";
    private static final String CHECK_PASSWORD="SELECT id FROM Customers WHERE username = ? AND password = ?";
    private static final String UPDATE_PROFILE = "UPDATE Customers SET personal_name= ?, age= ?, gender= ?, address= ?, email= ?, phone_number= ?, image= ?  WHERE id=?";
    private static final String SELECT_ID = "SELECT * FROM Customers WHERE id = ?";
    
    public Customer show(String customerId) throws SQLException{
        Customer customer = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        try{        
            conn= DBUtils.getConnection();
            if(conn!=null){
                PreparedStatement ps = conn.prepareStatement(SELECT_ID);
                ps.setString(1, customerId);
                ResultSet rs = ps.executeQuery();
                while(rs.next()){
                    customer = new Customer();
                    customer.setId(customerId);
                    customer.setPersonalName(rs.getString("personal_name"));
                    customer.setEmail(rs.getString("email"));
                    customer.setPhoneNumber(rs.getString("phone_number"));
                    customer.setAddress(rs.getString("address"));
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(ptm!=null) ptm.close();
            if(conn!=null) conn.close();
        }
        return customer;
    }
    
    public boolean updateProfile(Customer customer) throws SQLException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try{        
            conn= DBUtils.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(UPDATE_PROFILE);
                ptm.setString(1,customer.getPersonalName());
                ptm.setInt(2,customer.getAge());
                ptm.setByte(3,customer.getGender());
                ptm.setString(4,customer.getAddress());
                ptm.setString(5,customer.getEmail());
                ptm.setString(6,customer.getPhoneNumber());
                ptm.setString(7,customer.getImage());
                ptm.setString(8,customer.getId());
                check= ptm.executeUpdate()>0?true:false;
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(ptm!=null) ptm.close();
            if(conn!=null) conn.close();
        }
        return check;
    }
    
    public Customer checkPassword(String userName, String password) throws SQLException{
        Customer customer= null;
        Connection conn= null;
        PreparedStatement ptm= null;
        ResultSet rs= null;
        try{
            conn= DBUtils.getConnection();
            if(conn!= null){
                ptm= conn.prepareStatement(CHECK_PASSWORD);
                ptm.setString(1, userName);
                ptm.setString(2, password);
                rs= ptm.executeQuery();
                if (rs.next()){
                    String id= rs.getString("id");
                    customer= new Customer(id, userName, password);
                }
            }
        }catch (Exception e){   
            e.printStackTrace();
        }
        finally{
            if (rs!= null) rs.close();
            if (ptm!= null) ptm.close();
            if (conn!= null) conn.close();
        }
        return customer;
    }
    public boolean updatePassword(String userName, String password) throws SQLException{
        boolean check= false;
        Connection conn= null;
        PreparedStatement ptm= null;
        try{
            conn=DBUtils.getConnection();
            if(conn!=null) {
                ptm=conn.prepareStatement(UPDATE_PASSWORD);         
                ptm.setString(1, password);
                ptm.setString(2, userName);
                check= ptm.executeUpdate()>0?true:false;
            }  
        }catch (Exception e){
            e.printStackTrace();
        }finally{
            if(ptm!=null) ptm.close();
            if(conn!=null) conn.close();
        }
        return check;
    }
}
