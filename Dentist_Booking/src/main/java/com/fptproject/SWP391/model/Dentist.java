/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptproject.SWP391.model;

/**
 *
 * @author hieunguyen
 */
public class Dentist {
    private String id;
    private String username;
    private String password;
    private String role;
    private String personalName;
    private float rate;
    private byte gender;
    private byte status;

    public Dentist() {
    }
    
    public Dentist(String id, String username, String password, String role, String personalName, float rate, byte gender, byte status) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.role = role;
        this.personalName = personalName;
        this.rate = rate;
        this.gender = gender;
        this.status = status;
    }

    public String getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getRole() {
        return role;
    }

    public String getPersonalName() {
        return personalName;
    }

    public float getRate() {
        return rate;
    }

    public byte getGender() {
        return gender;
    }

    public byte getStatus() {
        return status;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public void setPersonalName(String personalName) {
        this.personalName = personalName;
    }

    public void setRate(float rate) {
        this.rate = rate;
    }

    public void setGender(byte gender) {
        this.gender = gender;
    }

    public void setStatus(byte status) {
        this.status = status;
    }
    
    
}
