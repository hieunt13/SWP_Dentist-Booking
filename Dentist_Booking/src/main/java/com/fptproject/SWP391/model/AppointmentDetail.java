/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptproject.SWP391.model;

/**
 *
 * @author admin
 */
public class AppointmentDetail {
    private String id;
    private String serviceID;
    private String day;
    public AppointmentDetail() {
    }

    public AppointmentDetail(String id, String serviceID, String day) {
        this.id = id;
        this.serviceID = serviceID;
        this.day = day;
    }

    public String getId() {
        return id;
    }

    public String getServiceID() {
        return serviceID;
    }

    public String getDay() {
        return day;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setServiceID(String serviceID) {
        this.serviceID = serviceID;
    }

    public void setDay(String day) {
        this.day = day;
    }
    
    
}
