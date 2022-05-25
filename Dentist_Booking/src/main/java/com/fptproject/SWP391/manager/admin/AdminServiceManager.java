/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptproject.SWP391.manager.admin;

import com.fptproject.SWP391.dbutils.DBUtils;
import com.fptproject.SWP391.model.Service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class AdminServiceManager {
    private static final String CREATE = "INSERT INTO Services (id, service_name, promotion_id, short_description, long_description, price, image, status) VALUES (?,?,?,?,?,?,?,?)";
    private static final String SELECT_MAX_SERVICE_ID= "SELECT MAX(id) as maxServiceID FROM Services WHERE LEN(id) = (SELECT MAX(LEN(id)) FROM Services)";
    private static final String SEARCH = "SELECT * FROM Services WHERE service_name LIKE ? ";
    public String getMaxServiceID() throws SQLException{
        String maxServiceID="";
        Connection conn=null;
        PreparedStatement ptm=null;
        ResultSet rs=null;
        try{
            conn= DBUtils.getConnection();
            if(conn!=null){
                ptm= conn.prepareStatement(SELECT_MAX_SERVICE_ID);
                rs= ptm.executeQuery();
                if(rs.next()){
                    if(rs.getString("maxServiceID") == null){
                        maxServiceID="SV0";
                    }
                    else{
                        maxServiceID= rs.getString("maxServiceID");
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
        return maxServiceID;
    }
    public List<Service> searchListService(String search) throws SQLException{
        List serviceList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try{        
            conn= DBUtils.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(SEARCH);
                ptm.setString(1, "%"+search+"%");
                rs = ptm.executeQuery();
                while(rs.next()){
                    String id= rs.getString("id");
                    String serviceName= rs.getString("service_name");
                    String promotionId= rs.getString("promotion_id");
                    if(promotionId == null)
                        promotionId="";
                    String shortDescription = rs.getString("short_description");
                    String longDescription = rs.getString("long_description");
                    int price = rs.getInt("price");
                    String image = rs.getString("image");
                    byte status = rs.getByte("status");
                    serviceList.add(new Service(id, serviceName, promotionId, shortDescription, longDescription, price, image, status));
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(rs!=null) rs.close();
            if(ptm!=null) ptm.close();
            if(conn!=null) conn.close();
        }
        return serviceList;
    }
    public boolean createService(Service service) throws SQLException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try{        
            conn= DBUtils.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(CREATE);
                ptm.setString(1,service.getId());
                ptm.setString(2,service.getServiceName());
                ptm.setString(3,service.getPromotionId());
                ptm.setString(4,service.getShortDescription());
                ptm.setString(5,service.getLongDescription());
                ptm.setInt(6,service.getPrice());
                ptm.setString(7,service.getImage());
                ptm.setByte(8,service.getStatus());
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
