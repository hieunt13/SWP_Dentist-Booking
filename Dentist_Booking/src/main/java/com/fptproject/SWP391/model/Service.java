/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptproject.SWP391.model;

/**
 *
 * @author hieunguyen
 */
public class Service {
    private String id;
    private String serviceName;
    private String promotionId;
    private String shortDescription;
    private String longDescription;
    private int price;
    private String image;
    private byte status;

    public Service() {
    }
    

    public Service(String id, String serviceName, String promotionId, String shortDescription, String longDescription, int price, String image, byte status) {
        this.id = id;
        this.serviceName = serviceName;
        this.promotionId = promotionId;
        this.shortDescription = shortDescription;
        this.longDescription = longDescription;
        this.price = price;
        this.image = image;
        this.status = status;
    }

    public String getId() {
        return id;
    }

    public String getServiceName() {
        return serviceName;
    }

    public String getPromotionId() {
        return promotionId;
    }

    public String getShortDescription() {
        return shortDescription;
    }

    public String getLongDescription() {
        return longDescription;
    }

    public int getPrice() {
        return price;
    }

    public String getImage() {
        return image;
    }

    public byte getStatus() {
        return status;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public void setPromotionId(String promotionId) {
        this.promotionId = promotionId;
    }

    public void setShortDescription(String shortDescription) {
        this.shortDescription = shortDescription;
    }

    public void setLongDescription(String longDescription) {
        this.longDescription = longDescription;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public void setStatus(byte status) {
        this.status = status;
    }
    
    public String getServiceNextID(String ID){
        String serviceNextID = "";
        String [] tmp = ID.split("SV");
        int nextInt = Integer.parseInt(tmp[1]);
        serviceNextID = "SV"+ (++nextInt);
        return serviceNextID;
    } 
    
}
