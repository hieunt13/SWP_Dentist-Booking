/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptproject.SWP391.error;


/**
 *
 * @author hieunguyen
 */
public class DentistError {
    private String idError;
    private String usernameError;
    private String passwordError;
    private String roleError;
    private String personalNameError;
    private String rateError;

    public DentistError() {
    }

    public DentistError(String idError, String usernameError, String passwordError, String roleError, String personalNameError, String rateError) {
        this.idError = idError;
        this.usernameError = usernameError;
        this.passwordError = passwordError;
        this.roleError = roleError;
        this.personalNameError = personalNameError;
        this.rateError = rateError;
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

    public String getRateError() {
        return rateError;
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

    public void setRateError(String rateError) {
        this.rateError = rateError;
    }

   
    
    
}
