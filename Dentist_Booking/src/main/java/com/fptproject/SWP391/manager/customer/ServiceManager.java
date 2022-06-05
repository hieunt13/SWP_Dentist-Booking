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
public class ServiceManager {
    
    Connection con = null;
    PreparedStatement ps = null;
    private final static String SERVICE_LIST = "SELECT * FROM Services WHERE status = 1;";
    private final static String SERVICE_LIST_SORT_BY_PRICE = "SELECT * FROM Services WHERE status = 1 ORDER BY price ";
    private final static String SEARCH = "SELECT * FROM Services WHERE status = 1 AND service_name LIKE ?";
    private static final String GET_SERVICE = "SELECT * FROM Services WHERE id=?";
    
    public Service getServiceForPurchase(String ID) throws SQLException{
        Service service = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_SERVICE);
                ptm.setString(1, ID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int price = rs.getInt("price");
                    String serviceName = rs.getString("service_name");
                    String promotionID = rs.getString("promotion_id");
                    service = new Service(ID, serviceName, promotionID, price);
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
        return service;
    }
    
    public ArrayList<Service> list() throws SQLException {
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
        } finally {
            if(con!=null) con.close();
            if(ps!= null) ps.close();
        }
        if (list.size() == 0) {
            return null;
        }
        return list;
    }

    public ArrayList<Service> sortByPrice(String sortType) throws SQLException {
        ArrayList<Service> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = DBUtils.getConnection();
            if (con == null) {
                throw new NullPointerException("there isn't any database server connection");
            }
            ps = con.prepareStatement(SERVICE_LIST_SORT_BY_PRICE + sortType);
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
        } finally {
            if(con!=null) con.close();
            if(ps!= null) ps.close();
        }
        if (list.size() == 0) {
            return null;
        }
        return list;
    }

    public ArrayList<Service> search(String name) throws SQLException {
        ArrayList<Service> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = DBUtils.getConnection();
            if (con == null) {
                throw new NullPointerException("there isn't any database server connection");
            }
            ps = con.prepareStatement(SEARCH);
            ps.setString(1,"%" + name + "%");
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
        } finally {
            if(con!=null) con.close();
            if(ps!= null) ps.close();
        }
        if (list.size() == 0) {
            return null;
        }
        return list;
    }
}
