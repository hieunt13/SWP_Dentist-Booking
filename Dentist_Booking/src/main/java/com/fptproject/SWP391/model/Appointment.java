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
    private Date meetingDate;
    private String dentistNote;
    private String customerSymptom;
    private int status;
    private byte paymentConfirm;
    private int dentistConfirm;

// entity of dentist=======
    private Dentist dentist;

// enitity of customer=====
    private Customer customer;

    public Appointment(String id, String dentistId, String customerId, Date meetingDate, String customerSymptom, int status, byte paymentConfirm, int dentistConfirm, Dentist dentist, Customer customer) {
        this.id = id;
        this.dentistId = dentistId;
        this.customerId = customerId;
        this.meetingDate = meetingDate;
        this.customerSymptom = customerSymptom;
        this.status = status;
        this.paymentConfirm = paymentConfirm;
        this.dentistConfirm = dentistConfirm;
        this.dentist = dentist;
        this.customer = customer;
    }

    public Appointment(String id, String dentistId, String customerId, Date meetingDate, String dentistNote, String customerSymptom, int status, byte paymentConfirm, int dentistConfirm, Dentist dentist) {
        this.id = id;
        this.dentistId = dentistId;
        this.customerId = customerId;
        this.meetingDate = meetingDate;
        this.dentistNote = dentistNote;
        this.customerSymptom = customerSymptom;
        this.status = status;
        this.paymentConfirm = paymentConfirm;
        this.dentistConfirm = dentistConfirm;
        this.dentist = dentist;
    }
    

    public Appointment(String id, String dentistId, String customerId, Date meetingDate, String dentistNote, String customerSymptom, int status, byte paymentConfirm, int dentistConfirm, Dentist dentist, Customer customer) {
        this.id = id;
        this.dentistId = dentistId;
        this.customerId = customerId;
        this.meetingDate = meetingDate;
        this.dentistNote = dentistNote;
        this.customerSymptom = customerSymptom;
        this.status = status;
        this.paymentConfirm = paymentConfirm;
        this.dentistConfirm = dentistConfirm;
        this.dentist = dentist;
        this.customer = customer;
    }

    public Dentist getDentist() {
        return dentist;
    }

    public void setDentist(Dentist dentist) {
        this.dentist = dentist;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Appointment() {
    }

    public Appointment(String id, String dentistId, Date meetingDate) {
        this.id = id;
        this.dentistId = dentistId;
        this.meetingDate = meetingDate;
    }

    public Appointment(String id, String dentistId, String customerId, Date meetingDate, String customerSymptom, int status, byte paymentConfirm, int dentistConfirm) {
        this.id = id;
        this.dentistId = dentistId;
        this.customerId = customerId;
        this.meetingDate = meetingDate;
        this.customerSymptom = customerSymptom;
        this.status = status;
        this.paymentConfirm = paymentConfirm;
        this.dentistConfirm = dentistConfirm;
    }

    public Appointment(String id, String dentistId, String customerId, Date meetingDate, String dentistNote, String customerSymptom, int status, byte paymentConfirm, int dentistConfirm) {
        this.id = id;
        this.dentistId = dentistId;
        this.customerId = customerId;
        this.meetingDate = meetingDate;
        this.dentistNote = dentistNote;
        this.customerSymptom = customerSymptom;
        this.status = status;
        this.paymentConfirm = paymentConfirm;
        this.dentistConfirm = dentistConfirm;
    }

    public Appointment(String id, String dentistId, String customerId, String serviceId, Date meetingDate, String dentistNote, String customerSymptom, int slot, int status) {
        this.id = id;
        this.dentistId = dentistId;
        this.customerId = customerId;
        this.meetingDate = meetingDate;
        this.dentistNote = dentistNote;
        this.customerSymptom = customerSymptom;
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

    public Date getMeetingDate() {
        return meetingDate;
    }

    public String getDentistNote() {
        return dentistNote;
    }

    public String getCustomerSymptom() {
        return customerSymptom;
    }

    public int getStatus() {
        return status;
    }

    public byte getPaymentConfirm() {
        return paymentConfirm;
    }

    public int getDentistConfirm() {
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

    public void setMeetingDate(Date meetingDate) {
        this.meetingDate = meetingDate;
    }

    public void setDentistNote(String dentistNote) {
        this.dentistNote = dentistNote;
    }

    public void setCustomerSymptom(String customerSymptom) {
        this.customerSymptom = customerSymptom;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public void setPaymentConfirm(byte paymentConfirm) {
        this.paymentConfirm = paymentConfirm;
    }

    public void setDentistConfirm(int dentistConfirm) {
        this.dentistConfirm = dentistConfirm;
    }

}
