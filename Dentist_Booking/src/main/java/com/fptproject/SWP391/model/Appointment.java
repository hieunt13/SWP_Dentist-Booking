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
    private String dentistId;
    private String customerId;
    private String serviceId;
    private Date meetingDate;
    private String dentistNote;
    private String customerSymptom;
    private int slot;
    private int status;
    private byte paymentConfirm;
    private byte dentistConfirm;

    public Appointment() {
    }

    public Appointment(String id, String dentistId, String customerId, String serviceId, Date meetingDate, String dentistNote, String customerSymptom, int slot, int status, byte paymentConfirm, byte dentistConfirm) {
        this.id = id;
        this.dentistId = dentistId;
        this.customerId = customerId;
        this.serviceId = serviceId;
        this.meetingDate = meetingDate;
        this.dentistNote = dentistNote;
        this.customerSymptom = customerSymptom;
        this.slot = slot;
        this.status = status;
        this.paymentConfirm = paymentConfirm;
        this.dentistConfirm = dentistConfirm;
    }
    
    public Appointment(String id, String dentistId, String customerId, String serviceId, Date meetingDate, String dentistNote, String customerSymptom, int slot, int status) {
        this.id = id;
        this.dentistId = dentistId;
        this.customerId = customerId;
        this.serviceId = serviceId;
        this.meetingDate = meetingDate;
        this.dentistNote = dentistNote;
        this.customerSymptom = customerSymptom;
        this.slot = slot;
        this.status = status;
    }

    public String getId() {
        return id;
    }

    public String getDentistId() {
        return dentistId;
    }

    public String getCustomerId() {
        return customerId;
    }

    public String getServiceId() {
        return serviceId;
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

    public byte getPaymentConfirm() {
        return paymentConfirm;
    }

    public byte getDentistConfirm() {
        return dentistConfirm;
    }
    

    public void setId(String id) {
        this.id = id;
    }

    public void setDentistId(String dentistId) {
        this.dentistId = dentistId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

    public void setServiceId(String serviceId) {
        this.serviceId = serviceId;
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

    public void setPaymentConfirm(byte paymentConfirm) {
        this.paymentConfirm = paymentConfirm;
    }

    public void setDentistConfirm(byte dentistConfirm) {
        this.dentistConfirm = dentistConfirm;
    }
    
    
}
