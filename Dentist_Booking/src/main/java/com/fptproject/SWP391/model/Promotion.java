/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptproject.SWP391.model;

import java.sql.Date;

/**
 *
 * @author hieunguyen
 */
public class Promotion {
    private String id;
    private String promotionName;
    private String longDescription;
    private String shortDescription;
    private String image;
    private float discountPercentage;
    private Date expiredDate;
    private byte status;

    public Promotion() {
    }

    public Promotion(String id, String promotionName, String longDescription, String shortDescription, String image, float discountPercentage, Date expiredDate, byte status) {
        this.id = id;
        this.promotionName = promotionName;
        this.longDescription = longDescription;
        this.shortDescription = shortDescription;
        this.image = image;
        this.discountPercentage = discountPercentage;
        this.expiredDate = expiredDate;
        this.status = status;
    }
    
    

    public String getId() {
        return id;
    }

    public String getPromotionName() {
        return promotionName;
    }

    public String getLongDescription() {
        return longDescription;
    }

    public String getShortDescription() {
        return shortDescription;
    }

    public String getImage() {
        return image;
    }

    public float getDiscountPercentage() {
        return discountPercentage;
    }

    public Date getExpiredDate() {
        return expiredDate;
    }

    public byte getStatus() {
        return status;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setPromotionName(String promotionName) {
        this.promotionName = promotionName;
    }

    public void setLongDescription(String longDescription) {
        this.longDescription = longDescription;
    }

    public void setShortDescription(String shortDescription) {
        this.shortDescription = shortDescription;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public void setDiscountPercentage(float discountPercentage) {
        this.discountPercentage = discountPercentage;
    }

    public void setExpiredDate(Date expiredDate) {
        this.expiredDate = expiredDate;
    }

    public void setStatus(byte status) {
        this.status = status;
    }

    
    
    public String getPromotionNextID(String ID){
        String promotionNextID = "";
        String [] tmp = ID.split("PR");
        int nextInt = Integer.parseInt(tmp[1]);
        promotionNextID = "PR"+ (++nextInt);
        return promotionNextID;
    } 

    
        
}
