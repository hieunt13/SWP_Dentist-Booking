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
    private String speciality;
    private String description;
    private String education;
    private int workingExperience;
    private String award;
    private String image;

    public Dentist() {
    }

    public Dentist(String id, String personalName, float rate, byte gender, byte status, String speciality, String image) {
        this.id = id;
        this.personalName = personalName;
        this.rate = rate;
        this.gender = gender;
        this.status = status;
        this.speciality = speciality;
        this.image = image;
    }
    
    public Dentist(String id, String username, String role, String personalName) {
        this.id = id;
        this.username = username;
        this.role = role;
        this.personalName = personalName;
    }

    public Dentist(String id, String username, String password, String role, String personalName, float rate, byte gender, byte status, String speciality, String description, String education, int workingExperience, String award, String image) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.role = role;
        this.personalName = personalName;
        this.rate = rate;
        this.gender = gender;
        this.status = status;
        this.speciality = speciality;
        this.description = description;
        this.education = education;
        this.workingExperience = workingExperience;
        this.award = award;
        this.image = image;
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

    public String getSpeciality() {
        return speciality;
    }

    public String getDescription() {
        return description;
    }

    public String getEducation() {
        return education;
    }

    public int getWorkingExperience() {
        return workingExperience;
    }

    public String getAward() {
        return award;
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

    public void setRate(float rate) {
        this.rate = rate;
    }

    public void setGender(byte gender) {
        this.gender = gender;
    }

    public void setStatus(byte status) {
        this.status = status;
    }

    public void setSpeciality(String speciality) {
        this.speciality = speciality;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public void setWorkingExperience(int workingExperience) {
        this.workingExperience = workingExperience;
    }

    public void setAward(String award) {
        this.award = award;
    }

    public void setImage(String image) {
        this.image = image;
    }
    
    public String getDentistNextID(String ID){
        String dentistNextID = "";
        String [] tmp = ID.split("DT");
        int nextInt = Integer.parseInt(tmp[1]);
        dentistNextID = "DT"+ (++nextInt);
        return dentistNextID;
    }   
    
    
}
