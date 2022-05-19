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
    private String serviceId;
    private String day;
    public AppointmentDetail() {
    }

    public AppointmentDetail(String id, String serviceId, String day) {
        this.id = id;
        serviceId = serviceId;
        this.day = day;
    }

    public String getId() {
        return id;
    }

    public String serviceId() {
        return serviceId;
    }

    public String getDay() {
        return day;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void serviceId(String serviceId) {
        serviceId = serviceId;
    }

    public void setDay(String day) {
        this.day = day;
    }
    
    
}
