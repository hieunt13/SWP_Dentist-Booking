/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptproject.SWP391.error;



/**
 *
 * @author admin
 */
public class AppointmentDetailError {
    private String idError;
    private String serviceIdError;
    
    public AppointmentDetailError() {
    }

    public AppointmentDetailError(String idError, String serviceIdError) {
        this.idError = idError;
        this.serviceIdError = serviceIdError;
    }

    public String getIdError() {
        return idError;
    }

    public String getServiceIdError() {
        return serviceIdError;
    }

    public void setIdError(String idError) {
        this.idError = idError;
    }

    public void setServiceIdError(String serviceIdError) {
        this.serviceIdError = serviceIdError;
    }
    

}
