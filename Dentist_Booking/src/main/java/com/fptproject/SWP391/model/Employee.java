/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptproject.SWP391.model;

/**
 *
 * @author hieunguyen
 */
public class Employee {
    private String id;
    private String username;
    private String password;
    private String role;
    private String personalName;
    private String phoneNumber;
    private String email;
    private byte status;
    private String image;

    public Employee() {
    }

    public Employee(String id, String username, String password, String role, String personalName, String phoneNumber, String email, byte status, String image) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.role = role;
        this.personalName = personalName;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.status = status;
        this.image = image;
    }

    public Employee(String id, String role, String personalName, String phoneNumber, String email, String image) {
        this.id = id;
        this.role = role;
        this.personalName = personalName;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.image = image;
    }
    
    
    
    public Employee(String id, String username, String role, String personalName) {
        this.id = id;
        this.username = username;
        this.role = role;
        this.personalName = personalName;
    }

    public Employee(String id, String username, String password, String role, String personalName, String phoneNumber, String email, byte status) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.role = role;
        this.personalName = personalName;
        this.phoneNumber = phoneNumber;
        this.email = email;
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

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public byte getStatus() {
        return status;
    }

    public String getImage() {
        return image;
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

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setStatus(byte status) {
        this.status = status;
    }

    public void setImage(String image) {
        this.image = image;
    }
    
}
