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
    private String dentistID;
    private int slot;

    public DentistAvailiableTime() {
    }
    
    public DentistAvailiableTime(String dentistID, int slot) {
        this.dentistID = dentistID;
        this.slot = slot;
    }

    public String getDentistID() {
        return dentistID;
    }

    public int getSlot() {
        return slot;
    }

    public void setDentistID(String dentistID) {
        this.dentistID = dentistID;
    }

    public void setSlot(int slot) {
        this.slot = slot;
    }
    
}
