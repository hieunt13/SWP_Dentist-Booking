/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptproject.SWP391.manager.customer;

import com.fptproject.SWP391.dbutils.DBUtils;
import com.fptproject.SWP391.model.Service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author hieunguyen
 */
public class CustomerServiceManager {

    private final static String SERVICE_LIST = "SELECT * FROM Services;";

    public ArrayList<Service> listService() throws SQLException {
        ArrayList<Service> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = DBUtils.getConnection();
            if (con == null) {
                throw new NullPointerException("there isn't any database server connection");
            }
            ps = con.prepareStatement(SERVICE_LIST);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Service service = new Service();
                service.setId(rs.getString("id"));
                service.setServiceName(rs.getString("service_name"));
                service.setPromotionId(rs.getString("promotion_id"));
                service.setShortDescription(rs.getString("short_description"));
                service.setLongDescription(rs.getString("long_description"));
                service.setPrice(rs.getInt("price"));
                service.setImage(rs.getString("image"));
                service.setStatus(rs.getByte("status"));
                list.add(service);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            con.close();
            ps.close();
        }
        if (list.size() == 0) {
            return null;
        }
        return list;
    }
}
