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
    private int slot;
    public AppointmentDetail() {
    }

    public String getServiceId() {
        return serviceId;
    }

    public int getSlot() {
        return slot;
    }

    public void setSlot(int slot) {
        this.slot = slot;
    }

    public AppointmentDetail(String id, String serviceId, int slot) {
        this.id = id;
        this.serviceId = serviceId;
        this.slot = slot;
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
