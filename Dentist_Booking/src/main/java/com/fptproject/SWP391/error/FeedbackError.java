/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptproject.SWP391.error;


/**
 *
 * @author hieunguyen
 */
public class FeedbackError {
    private String idError;
    private String appointmentIdError;
    private String dentistRatingError;
    private String dentistMessageError;
    private String meetingDateError;

    public FeedbackError() {
    }

    public FeedbackError(String idError, String appointmentIdError, String dentistRatingError, String dentistMessageError, String meetingDateError) {
        this.idError = idError;
        this.appointmentIdError = appointmentIdError;
        this.dentistRatingError = dentistRatingError;
        this.dentistMessageError = dentistMessageError;
        this.meetingDateError = meetingDateError;
    }

    public String getIdError() {
        return idError;
    }

    public String getAppointmentIdError() {
        return appointmentIdError;
    }

    public String getDentistRatingError() {
        return dentistRatingError;
    }

    public String getDentistMessageError() {
        return dentistMessageError;
    }

    public String getMeetingDateError() {
        return meetingDateError;
    }

    public void setIdError(String idError) {
        this.idError = idError;
    }

    public void setAppointmentIdError(String appointmentIdError) {
        this.appointmentIdError = appointmentIdError;
    }

    public void setDentistRatingError(String dentistRatingError) {
        this.dentistRatingError = dentistRatingError;
    }

    public void setDentistMessageError(String dentistMessageError) {
        this.dentistMessageError = dentistMessageError;
    }

    public void setMeetingDateError(String meetingDateError) {
        this.meetingDateError = meetingDateError;
    }



   

    
    
}
