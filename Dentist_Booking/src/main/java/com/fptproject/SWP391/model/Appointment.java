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
public class Appointment {
    private String id;
    private String dentistID;
    private String customerID;
    private String serviceID;
    private Date meetingDate;
    private String dentistNote;
    private String customerSymptom;
    private int slot;
    private int status;

    public Appointment() {
    }

    public Appointment(String id, String dentistID, String customerID, String serviceID, Date meetingDate, String dentistNote, String customerSymptom, int slot, int status) {
        this.id = id;
        this.dentistID = dentistID;
        this.customerID = customerID;
        this.serviceID = serviceID;
        this.meetingDate = meetingDate;
        this.dentistNote = dentistNote;
        this.customerSymptom = customerSymptom;
        this.slot = slot;
        this.status = status;
    }

    public String getId() {
        return id;
    }

    public String getDentistID() {
        return dentistID;
    }

    public String getCustomerID() {
        return customerID;
    }

    public String getServiceID() {
        return serviceID;
    }

    public Date getMeetingDate() {
        return meetingDate;
    }

    public String getDentistNote() {
        return dentistNote;
    }

    public String getCustomerSymptom() {
        return customerSymptom;
    }

    public int getSlot() {
        return slot;
    }

    public int getStatus() {
        return status;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setDentistID(String dentistID) {
        this.dentistID = dentistID;
    }

    public void setCustomerID(String customerID) {
        this.customerID = customerID;
    }

    public void setServiceID(String serviceID) {
        this.serviceID = serviceID;
    }

    public void setMeetingDate(Date meetingDate) {
        this.meetingDate = meetingDate;
    }

    public void setDentistNote(String dentistNote) {
        this.dentistNote = dentistNote;
    }

    public void setCustomerSymptom(String customerSymptom) {
        this.customerSymptom = customerSymptom;
    }

    public void setSlot(int slot) {
        this.slot = slot;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
    
}
