/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptproject.SWP391.manager.admin;

import com.fptproject.SWP391.dbutils.DBUtils;
import com.fptproject.SWP391.model.Promotion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author admin
 */
public class AdminPromotionManager {
    private static final String CREATE = "INSERT INTO Promotions (id, long_description, short_description, image, discount_percentage, expired_date, status) VALUES (?,?,?,?,ROUND(?, 2),?,?)";
    private static final String SELECT_MAX_PROMOTION_ID= "SELECT MAX(id) as maxPromotionID FROM Promotions";
    
    public String getMaxPromotionID() throws SQLException{
        String maxPromotionID="";
        Connection conn=null;
        PreparedStatement ptm=null;
        ResultSet rs=null;
        try{
            conn= DBUtils.getConnection();
            if(conn!=null){
                ptm= conn.prepareStatement(SELECT_MAX_PROMOTION_ID);
                rs= ptm.executeQuery();
                if(rs.next()){
                    if(rs.getString("maxPromotionID") == null){
                        maxPromotionID="PR0";
                    }
                    else{
                        maxPromotionID= rs.getString("maxPromotionID");
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
        return maxPromotionID;
    }
    
    public boolean createPromotion(Promotion promotion) throws SQLException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try{        
            conn= DBUtils.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(CREATE);
                ptm.setString(1,promotion.getId());
                ptm.setString(2,promotion.getLongDescription());
                ptm.setString(3,promotion.getShortDescription());
                ptm.setString(4,promotion.getImage());
                ptm.setFloat(5,promotion.getDiscountPercentage());
                ptm.setDate(6,promotion.getExpiredDate());
                ptm.setByte(7,promotion.getStatus());
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
