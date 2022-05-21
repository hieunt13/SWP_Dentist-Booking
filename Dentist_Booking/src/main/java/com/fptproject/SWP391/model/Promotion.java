/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptproject.SWP391.model;

/**
 *
 * @author hieunguyen
 */
public class Promotion {
    private String id;
    private String longDescription;
    private String shortDescription;
    private String image;
    private int discountPercentage;
    private byte status;

    public Promotion() {
    }

    public Promotion(String id, String longDescription, String shortDescription, String image, int discountPercentage, byte status) {
        this.id = id;
        this.longDescription = longDescription;
        this.shortDescription = shortDescription;
        this.image = image;
        this.discountPercentage = discountPercentage;
        this.status = status;
    }

    public String getId() {
        return id;
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

    public int getDiscountPercentage() {
        return discountPercentage;
    }

    public byte getStatus() {
        return status;
    }

    public void setId(String id) {
        this.id = id;
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

    public void setDiscountPercentage(int discountPercentage) {
        this.discountPercentage = discountPercentage;
    }

    public void setStatus(byte status) {
        this.status = status;
    }

    
    
}
