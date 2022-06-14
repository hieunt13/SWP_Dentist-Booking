/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptproject.SWP391.manager.admin;

import com.fptproject.SWP391.dbutils.DBUtils;
import com.fptproject.SWP391.model.ClinicInformation;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;


/**
 *
 * @author admin
 */
public class AdminClinicInformationManager {
    private static String SELECT = "SELECT * FROM ClinicInfomation ";
    private static String UPDATE = "UPDATE ClinicInfomation SET open_time = ?, close_time = ?, name = ?, address = ?, phone = ?, email = ?";
    public ClinicInformation getClinicInformation() throws SQLException{
        ClinicInformation clinicInformation = new ClinicInformation();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try{        
            conn= DBUtils.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(SELECT);
                rs = ptm.executeQuery();
                if(rs.next()){
                    String name = rs.getString("name");
                    String address = rs.getString("address");
                    String phone = rs.getString("phone");
                    String email = rs.getString("email");
                    Time openTime = rs.getTime("open_time");
                    Time closeTime = rs.getTime("close_time");
                    clinicInformation = new ClinicInformation(name, address, phone, email, openTime, closeTime);
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(rs!=null) rs.close();
            if(ptm!=null) ptm.close();
            if(conn!=null) conn.close();
        }
        return clinicInformation;
    }
    
    public boolean updateInformation(ClinicInformation clinicInformation) throws SQLException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try{        
            conn= DBUtils.getConnection();
            if(conn!=null){
                //UPDATE ClinicInfomation SET open_time = ?, close_time = ?, name = ?, address = ?, phone = ?, email = ?
                ptm = conn.prepareStatement(UPDATE);
                ptm.setString(1,clinicInformation.getOpenTime().toString());
                ptm.setString(2,clinicInformation.getCloseTIme().toString());
                ptm.setString(3,clinicInformation.getName());
                ptm.setString(4,clinicInformation.getAddress());
                ptm.setString(5,clinicInformation.getPhone());
                ptm.setString(6,clinicInformation.getEmail());
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
}
