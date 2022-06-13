/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptproject.SWP391.error;

/**
 *
 * @author admin
 */
public class ClinicInformationError {
    private String nameError;
    private String addressError;
    private String phoneError;
    private String emailError;
    private String openTimeError;
    private String closeTImeError;  

    public ClinicInformationError() {
        this.nameError = "";
        this.addressError = "";
        this.phoneError = "";
        this.emailError = "";
        this.openTimeError = "";
        this.closeTImeError = "";
    }    
    public ClinicInformationError(String nameError, String addressError, String phoneError, String emailError, String openTimeError, String closeTImeError) {
        this.nameError = nameError;
        this.addressError = addressError;
        this.phoneError = phoneError;
        this.emailError = emailError;
        this.openTimeError = openTimeError;
        this.closeTImeError = closeTImeError;
    }

    public String getNameError() {
        return nameError;
    }

    public String getAddressError() {
        return addressError;
    }

    public String getPhoneError() {
        return phoneError;
    }

    public String getEmailError() {
        return emailError;
    }

    public String getOpenTimeError() {
        return openTimeError;
    }

    public String getCloseTImeError() {
        return closeTImeError;
    }

    public void setNameError(String nameError) {
        this.nameError = nameError;
    }

    public void setAddressError(String addressError) {
        this.addressError = addressError;
    }

    public void setPhoneError(String phoneError) {
        this.phoneError = phoneError;
    }

    public void setEmailError(String emailError) {
        this.emailError = emailError;
    }

    public void setOpenTimeError(String openTimeError) {
        this.openTimeError = openTimeError;
    }

    public void setCloseTImeError(String closeTImeError) {
        this.closeTImeError = closeTImeError;
    }
    
}
