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
    public AppointmentDetail() {
    }

    public AppointmentDetail(String id, String serviceId) {
        this.id = id;
        this.serviceId = serviceId;
    }

    public String getId() {
        return id;
    }

    public String serviceId() {
        return serviceId;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void serviceId(String serviceId) {
        this.serviceId = serviceId;
    }
    
}
