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
    private final static String SEARCH = "SELECT * FROM Promotions WHERE status = 1 AND (promotion_name LIKE ? OR id LIKE ? );";
    private final static String SORT = "SELECT * FROM Promotions WHERE status = 1 ORDER BY ";

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
                promotion.setPromotionName(rs.getString("promotion_name"));
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
            if (con != null) {
                con.close();
            }
            if (ps != null) {
                ps.close();
            }
        }
        if (list.size() == 0) {
            return null;
        }
        return list;
    }

    public ArrayList<Promotion> search(String searchString) throws SQLException {
        ArrayList<Promotion> list = new ArrayList<>();
        try {
            con = DBUtils.getConnection();
            if (con == null) {
                throw new NullPointerException("there isn't any database server connection");
            }
            ps = con.prepareStatement(SEARCH);
            ps.setString(1, "%" + searchString + "%");
            ps.setString(2, "%" + searchString + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                promotion = new Promotion();
                promotion.setId(rs.getString("id"));
                promotion.setPromotionName(rs.getString("promotion_name"));
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
            if (con != null) {
                con.close();
            }
            if (ps != null) {
                ps.close();
            }
        }
        if (list.size() == 0) {
            return null;
        }
        return list;
    }

    public ArrayList<Promotion> sort(String column, String type) throws SQLException {
        ArrayList<Promotion> list = null;
        try {
            con = DBUtils.getConnection();
            if (con == null) {
                throw new NullPointerException("there isn't any database server connection");
            }
            ps = con.prepareStatement(SORT + " " + column + " " + type);
            ResultSet rs = ps.executeQuery();
            list = new ArrayList<>();
            while (rs.next()) {
                promotion = new Promotion();
                promotion.setId(rs.getString("id"));
                promotion.setPromotionName(rs.getString("promotion_name"));
                promotion.setLongDescription(rs.getString("long_description"));
                promotion.setShortDescription(rs.getString("short_description"));
                promotion.setImage(rs.getString("image"));
                promotion.setDiscountPercentage(rs.getFloat("discount_percentage"));
                promotion.setExpiredDate(rs.getDate("expired_date"));
                list.add(promotion);
            }
            if (list == null || list.size() < 0) {
                throw new Exception();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                con.close();
            }
            if (ps != null) {
                ps.close();
            }
        }
        return list;

    }
}
