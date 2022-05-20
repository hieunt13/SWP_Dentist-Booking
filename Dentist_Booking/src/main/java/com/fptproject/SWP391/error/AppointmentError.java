/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptproject.SWP391.error;


/**
 *
 * @author hieunguyen
 */
public class AppointmentError {
    private String idError;
    private String dentistIdError;
    private String customerIdError;
    private String serviceIdError;
    private String meetingDateError;
    private String dentistNoteError;
    private String customerSymptomError;
    private String slotError;

    public AppointmentError() {
    }

    public AppointmentError(String idError, String dentistIdError, String customerIdError, String serviceIdError, String meetingDateError, String dentistNoteError, String customerSymptomError, String slotError) {
        this.idError = idError;
        this.dentistIdError = dentistIdError;
        this.customerIdError = customerIdError;
        this.serviceIdError = serviceIdError;
        this.meetingDateError = meetingDateError;
        this.dentistNoteError = dentistNoteError;
        this.customerSymptomError = customerSymptomError;
        this.slotError = slotError;
    }

    public String getIdError() {
        return idError;
    }

    public String getDentistIdError() {
        return dentistIdError;
    }

    public String getCustomerIdError() {
        return customerIdError;
    }

    public String getServiceIdError() {
        return serviceIdError;
    }

    public String getMeetingDateError() {
        return meetingDateError;
    }

    public String getDentistNoteError() {
        return dentistNoteError;
    }

    public String getCustomerSymptomError() {
        return customerSymptomError;
    }

    public String getSlotError() {
        return slotError;
    }

    public void setIdError(String idError) {
        this.idError = idError;
    }

    public void setDentistIdError(String dentistIdError) {
        this.dentistIdError = dentistIdError;
    }

    public void setCustomerIdError(String customerIdError) {
        this.customerIdError = customerIdError;
    }

    public void setServiceIdError(String serviceIdError) {
        this.serviceIdError = serviceIdError;
    }

    public void setMeetingDateError(String meetingDateError) {
        this.meetingDateError = meetingDateError;
    }

    public void setDentistNoteError(String dentistNoteError) {
        this.dentistNoteError = dentistNoteError;
    }

    public void setCustomerSymptomError(String customerSymptomError) {
        this.customerSymptomError = customerSymptomError;
    }

    public void setSlotError(String slotError) {
        this.slotError = slotError;
    }

    

    
    
    
}
