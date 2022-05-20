/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptproject.SWP391.error;


/**
 *
 * @author admin
 */
public class DentistAvailiableTimeError {
    private String dentistIdError;
    private String slotError;
    private String dayError;

    public DentistAvailiableTimeError() {
    }

    public DentistAvailiableTimeError(String dentistIdError, String slotError, String dayError) {
        this.dentistIdError = dentistIdError;
        this.slotError = slotError;
        this.dayError = dayError;
    }

    public String getDentistIdError() {
        return dentistIdError;
    }

    public String getSlotError() {
        return slotError;
    }

    public String getDayError() {
        return dayError;
    }

    public void setDentistIdError(String dentistIdError) {
        this.dentistIdError = dentistIdError;
    }

    public void setSlotError(String slotError) {
        this.slotError = slotError;
    }

    public void setDayError(String dayError) {
        this.dayError = dayError;
    }

    
    
    
    
}
