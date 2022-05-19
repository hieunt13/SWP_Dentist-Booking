/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptproject.SWP391.model;

/**
 *
 * @author admin
 */
public class DentistAvailiableTime {
    private String dentistId;
    private int slot;

    public DentistAvailiableTime() {
    }
    
    public DentistAvailiableTime(String dentistId, int slot) {
        dentistId = dentistId;
        this.slot = slot;
    }

    public String dentistId() {
        return dentistId;
    }

    public int getSlot() {
        return slot;
    }

    public void dentistId(String dentistId) {
        dentistId = dentistId;
    }

    public void setSlot(int slot) {
        this.slot = slot;
    }
    
}
