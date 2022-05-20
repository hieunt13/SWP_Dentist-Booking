/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptproject.SWP391.error;


/**
 *
 * @author hieunguyen
 */
public class CustomerError {
    private String idError;
    private String usernameError;
    private String passwordError;
    private String roleError;
    private String personalNameError;
    private String ageError;
    private String addressError;
    private String phoneNumberError;
    private String emailError;

    public CustomerError() {
    }

    public CustomerError(String idError, String usernameError, String passwordError, String roleError, String personalNameError, String ageError, String addressError, String phoneNumberError, String emailError) {
        this.idError = idError;
        this.usernameError = usernameError;
        this.passwordError = passwordError;
        this.roleError = roleError;
        this.personalNameError = personalNameError;
        this.ageError = ageError;
        this.addressError = addressError;
        this.phoneNumberError = phoneNumberError;
        this.emailError = emailError;
    }

    public String getIdError() {
        return idError;
    }

    public String getUsernameError() {
        return usernameError;
    }

    public String getPasswordError() {
        return passwordError;
    }

    public String getRoleError() {
        return roleError;
    }

    public String getPersonalNameError() {
        return personalNameError;
    }

    public String getAgeError() {
        return ageError;
    }

    public String getAddressError() {
        return addressError;
    }

    public String getPhoneNumberError() {
        return phoneNumberError;
    }

    public String getEmailError() {
        return emailError;
    }

    public void setIdError(String idError) {
        this.idError = idError;
    }

    public void setUsernameError(String usernameError) {
        this.usernameError = usernameError;
    }

    public void setPasswordError(String passwordError) {
        this.passwordError = passwordError;
    }

    public void setRoleError(String roleError) {
        this.roleError = roleError;
    }

    public void setPersonalNameError(String personalNameError) {
        this.personalNameError = personalNameError;
    }

    public void setAgeError(String ageError) {
        this.ageError = ageError;
    }

    public void setAddressError(String addressError) {
        this.addressError = addressError;
    }

    public void setPhoneNumberError(String phoneNumberError) {
        this.phoneNumberError = phoneNumberError;
    }

    public void setEmailError(String emailError) {
        this.emailError = emailError;
    }

    
    
    
    
    
}
