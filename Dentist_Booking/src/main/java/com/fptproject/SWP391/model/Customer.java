/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptproject.SWP391.model;

/**
 *
 * @author hieunguyen
 */
public class Customer {
    private String id;
    private String username;
    private String password;
    private String role;
    private String personalName;
    private int age;
    private String address;
    private String phoneNumber;
    private String email;
    private byte gender;
    private byte status;

    public Customer() {
    }

    public Customer(String id, String username, String password, String role, String personalName, int age, String address, String phoneNumber, String email, byte gender, byte status) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.role = role;
        this.personalName = personalName;
        this.age = age;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.gender = gender;
        this.status = status;
    }

    public Customer(String id, String username, String password) {
        this.id = id;
        this.username = username;
        this.password = password;
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

    public int getAge() {
        return age;
    }

    public String getAddress() {
        return address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public String getEmail() {
        return email;
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

    public void setAge(int age) {
        this.age = age;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setGender(byte gender) {
        this.gender = gender;
    }

    public void setStatus(byte status) {
        this.status = status;
    }
    
    
    
    
}
