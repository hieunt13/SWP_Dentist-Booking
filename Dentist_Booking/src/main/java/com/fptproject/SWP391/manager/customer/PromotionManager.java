/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptproject.SWP391.manager.customer;

import com.fptproject.SWP391.dbutils.DBUtils;
import com.fptproject.SWP391.model.Promotion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author hieunguyen
 */
public class PromotionManager {
    Promotion promotion = null;
    Connection con = null;
    PreparedStatement ps = null;
    private final static String PROMOTION_LIST = "SELECT * FROM Promotions WHERE status = 1;";
//    private final static String DENTIST_DETAIL = "SELECT * FROM Dentists WHERE status = 1 AND id = ?;";
//    private final static String SEARCH_BY_NAME = "SELECT * FROM Dentists WHERE status = 1 AND personal_name LIKE ? ;";
//    private final static String FILTER_BY_SPECIALITY = "SELECT * FROM Dentists WHERE status = 1 AND ( personal_name LIKE ? ";
//    private final static String SORT = "SELECT * FROM Dentists WHERE status = 1 ORDER BY ";

    public ArrayList<Promotion> list() throws SQLException {
        ArrayList<Promotion> list = new ArrayList<>();
        try {
            con = DBUtils.getConnection();
            if (con == null) {
                throw new NullPointerException("there isn't any database server connection");
            }
            ps = con.prepareStatement(PROMOTION_LIST);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                promotion = new Promotion();
                promotion.setId(rs.getString("id"));
                promotion.setLongDescription(rs.getString("long_description"));
                promotion.setShortDescription(rs.getString("short_description"));
                promotion.setImage(rs.getString("image"));
                promotion.setDiscountPercentage(rs.getFloat("discount_percentage"));
                promotion.setExpiredDate(rs.getDate("expired_date"));
                list.add(promotion);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            con.close();
            ps.close();
        }
        if (list.size() == 0) {
            return null;
        }
        return list;
    }

}
