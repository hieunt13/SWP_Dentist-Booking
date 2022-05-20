/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptproject.SWP391.error;


/**
 *
 * @author hieunguyen
 */
public class InvoiceError {
    private String idError;
    private String appointmentIdError;
    private String employeIdError;
    private String priceError;
    private String creditcardInfError;

    public InvoiceError() {
    }

    public InvoiceError(String idError, String appointmentIdError, String employeIdError, String priceError, String creditcardInfError) {
        this.idError = idError;
        this.appointmentIdError = appointmentIdError;
        this.employeIdError = employeIdError;
        this.priceError = priceError;
        this.creditcardInfError = creditcardInfError;
    }

    public String getIdError() {
        return idError;
    }

    public String getAppointmentIdError() {
        return appointmentIdError;
    }

    public String getEmployeIdError() {
        return employeIdError;
    }

    public String getPriceError() {
        return priceError;
    }

    public String getCreditcardInfError() {
        return creditcardInfError;
    }

    public void setIdError(String idError) {
        this.idError = idError;
    }

    public void setAppointmentIdError(String appointmentIdError) {
        this.appointmentIdError = appointmentIdError;
    }

    public void setEmployeIdError(String employeIdError) {
        this.employeIdError = employeIdError;
    }

    public void setPriceError(String priceError) {
        this.priceError = priceError;
    }

    public void setCreditcardInfError(String creditcardInfError) {
        this.creditcardInfError = creditcardInfError;
    }

    

    
    
}
