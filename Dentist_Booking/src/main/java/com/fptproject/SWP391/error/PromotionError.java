/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptproject.SWP391.error;


/**
 *
 * @author hieunguyen
 */
public class PromotionError {
    private String idError;
    private String longDescriptionError;
    private String shortDescriptionError;
    private String imageError;
    private String discountPercentageError;

    public PromotionError() {
    }

    public PromotionError(String idError, String longDescriptionError, String shortDescriptionError, String imageError, String discountPercentageError) {
        this.idError = idError;
        this.longDescriptionError = longDescriptionError;
        this.shortDescriptionError = shortDescriptionError;
        this.imageError = imageError;
        this.discountPercentageError = discountPercentageError;
    }

    public String getIdError() {
        return idError;
    }

    public String getLongDescriptionError() {
        return longDescriptionError;
    }

    public String getShortDescriptionError() {
        return shortDescriptionError;
    }

    public String getImageError() {
        return imageError;
    }

    public String getDiscountPercentageError() {
        return discountPercentageError;
    }

    public void setIdError(String idError) {
        this.idError = idError;
    }

    public void setLongDescriptionError(String longDescriptionError) {
        this.longDescriptionError = longDescriptionError;
    }

    public void setShortDescriptionError(String shortDescriptionError) {
        this.shortDescriptionError = shortDescriptionError;
    }

    public void setImageError(String imageError) {
        this.imageError = imageError;
    }

    public void setDiscountPercentageError(String discountPercentageError) {
        this.discountPercentageError = discountPercentageError;
    }
    

    
    
}