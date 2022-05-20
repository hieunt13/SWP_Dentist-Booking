/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptproject.SWP391.model;

/**
 *
 * @author hieunguyen
 */
public class Invoice {
    private String id;
    private String appointmentId;
    private String employee_id;
    private int price;
    private byte paymentMethod;
    private String creditcardInf;
    private byte status;

    public Invoice() {
    }
    
    public Invoice(String id, String appointmentId, String employee_id, int price, byte paymentMethod, String creditcardInf, byte status) {
        this.id = id;
        this.appointmentId = appointmentId;
        this.employee_id = employee_id;
        this.price = price;
        this.paymentMethod = paymentMethod;
        this.creditcardInf = creditcardInf;
        this.status = status;
    }

    public String getId() {
        return id;
    }

    public String getAppointmentId() {
        return appointmentId;
    }

    public String getEmployee_id() {
        return employee_id;
    }

    public int getPrice() {
        return price;
    }

    public byte getPaymentMethod() {
        return paymentMethod;
    }

    public String getCreditcardInf() {
        return creditcardInf;
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

    public void setEmployee_id(String employee_id) {
        this.employee_id = employee_id;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public void setPaymentMethod(byte paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public void setCreditcardInf(String creditcardInf) {
        this.creditcardInf = creditcardInf;
    }

    public void setStatus(byte status) {
        this.status = status;
    }
    
}
