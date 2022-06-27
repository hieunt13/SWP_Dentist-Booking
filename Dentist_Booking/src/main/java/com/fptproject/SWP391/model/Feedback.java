/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptproject.SWP391.model;

/**
 *
 * @author hieunguyen
 */
public class Feedback {
    private String id;
    private String appointmentId;
    private float dentistRating;
    private String dentistMessage;
    private byte status;

    public Feedback() {
    }

    public Feedback(String id, String appointmentId, float dentistRating, String dentistMessage, byte status) {
        this.id = id;
        this.appointmentId = appointmentId;
        this.dentistRating = dentistRating;
        this.dentistMessage = dentistMessage;
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

    public byte getStatus() {
        return status;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setAppointmentId(String appointmentId) {
        this.appointmentId = appointmentId;
    }

    public String getAppointmentId() {
        return appointmentId;
    }

    public void setDentistRating(float dentistRating) {
        this.dentistRating = dentistRating;
    }

    public void setDentistMessage(String dentistMessage) {
        this.dentistMessage = dentistMessage;
    }

    public void setStatus(byte status) {
        this.status = status;
    }
    public String getFeedbackNextID(String ID){
        String feedbackNextID = "";
        String [] tmp = ID.split("FB");
        int nextInt = Integer.parseInt(tmp[1]);
        feedbackNextID = "FB" + (++nextInt);
        return feedbackNextID;
    }   
}
