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
public class Feedback {
    private String id;
    private String appointmentId;
    private float dentistRating;
    private String dentistMessage;
    private Date meetingDate;
    private byte status;

    public Feedback() {
    }

    public Feedback(String id, String appointmentId, float dentistRating, String dentistMessage, Date meetingDate, byte status) {
        this.id = id;
        appointmentId = appointmentId;
        this.dentistRating = dentistRating;
        this.dentistMessage = dentistMessage;
        this.meetingDate = meetingDate;
        this.status = status;
    }

    public String getId() {
        return id;
    }

    public String appointmentId() {
        return appointmentId;
    }

    public float getDentistRating() {
        return dentistRating;
    }

    public String getDentistMessage() {
        return dentistMessage;
    }

    public Date getMeetingDate() {
        return meetingDate;
    }

    public byte getStatus() {
        return status;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void appointmentId(String appointmentId) {
        appointmentId = appointmentId;
    }

    public void setDentistRating(float dentistRating) {
        this.dentistRating = dentistRating;
    }

    public void setDentistMessage(String dentistMessage) {
        this.dentistMessage = dentistMessage;
    }

    public void setMeetingDate(Date meetingDate) {
        this.meetingDate = meetingDate;
    }

    public void setStatus(byte status) {
        this.status = status;
    }
    
}
