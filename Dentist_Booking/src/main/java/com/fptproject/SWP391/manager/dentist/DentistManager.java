/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptproject.SWP391.manager.dentist;

import com.fptproject.SWP391.dbutils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author minha
 */
public class DentistManager {
   private static final String UPDATE_PROFILE="UPDATE Dentists SET personal_name=?, gender=?, speciality=?, description=?, education=?, working_experience=?, award=?, image=? WHERE username=?";
   private static final String UPDATE_PASSWORD="UPDATE Dentists SET password=? WHERE username=?";
   public boolean updateProfile(String personalName, Byte gender, String speciality, String description, String education, int workingExperience, String award, String image, String userName) throws SQLException{
       Boolean check=false;
       Connection conn= null;
       PreparedStatement ptm= null; 
       try{
           conn=DBUtils.getConnection();
            if(conn!=null) {
               ptm=conn.prepareStatement(UPDATE_PROFILE);         
               ptm.setString(1, personalName);
               ptm.setByte(2, gender);
               ptm.setString(3, speciality);
               ptm.setString(4, description);
               ptm.setString(5, education);
               ptm.setInt(6, workingExperience);
               ptm.setString(7, award);
               ptm.setString(8, image);
               ptm.setString(9, userName);
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
   public boolean updatePassword(String userName, String password) throws SQLException{
       boolean check = false;
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
