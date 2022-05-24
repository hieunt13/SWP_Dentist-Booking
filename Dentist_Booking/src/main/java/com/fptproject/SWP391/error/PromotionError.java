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
    private String promotionNameError;
    private String longDescriptionError;
    private String shortDescriptionError;
    private String imageError;
    private String discountPercentageError;
    private String expiredDateError;

    public PromotionError() {
        this.idError = "";
        this.promotionNameError = "";
        this.longDescriptionError = "";
        this.shortDescriptionError = "";
        this.imageError = "";
        this.discountPercentageError = "";
        this.expiredDateError = "";      
    }

    public PromotionError(String idError, String promotionNameError, String longDescriptionError, String shortDescriptionError, String imageError, String discountPercentageError, String expiredDateError) {
        this.idError = idError;
        this.promotionNameError = promotionNameError;
        this.longDescriptionError = longDescriptionError;
        this.shortDescriptionError = shortDescriptionError;
        this.imageError = imageError;
        this.discountPercentageError = discountPercentageError;
        this.expiredDateError = expiredDateError;
    }

    public String getIdError() {
        return idError;
    }

    public String getPromotionNameError() {
        return promotionNameError;
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

    public String getExpiredDateError() {
        return expiredDateError;
    }

    public void setIdError(String idError) {
        this.idError = idError;
    }

    public void setPromotionNameError(String promotionNameError) {
        this.promotionNameError = promotionNameError;
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

    public void setExpiredDateError(String expiredDateError) {
        this.expiredDateError = expiredDateError;
    }

    
    
    
    
}
