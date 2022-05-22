/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptproject.SWP391.error;

/**
 *
 * @author hieunguyen
 */
public class ServiceError {
    private String idError;
    private String serviceNameError;
    private String promotionIdError;
    private String shortDescriptionError;
    private String longDescriptionError;
    private String priceError;
    private String imageError;

    public ServiceError() {
        this.idError = "";
        this.serviceNameError = "";
        this.promotionIdError = "";
        this.shortDescriptionError = "";
        this.longDescriptionError = "";
        this.priceError = "";
        this.imageError = "";
    }

    public ServiceError(String idError, String serviceNameError, String promotionIdError, String shortDescriptionError, String longDescriptionError, String priceError, String imageError) {
        this.idError = idError;
        this.serviceNameError = serviceNameError;
        this.promotionIdError = promotionIdError;
        this.shortDescriptionError = shortDescriptionError;
        this.longDescriptionError = longDescriptionError;
        this.priceError = priceError;
        this.imageError = imageError;
    }

    public String getIdError() {
        return idError;
    }

    public String getServiceNameError() {
        return serviceNameError;
    }

    public String getPromotionIdError() {
        return promotionIdError;
    }

    public String getShortDescriptionError() {
        return shortDescriptionError;
    }

    public String getLongDescriptionError() {
        return longDescriptionError;
    }

    public String getPriceError() {
        return priceError;
    }

    public String getImageError() {
        return imageError;
    }

    public void setIdError(String idError) {
        this.idError = idError;
    }

    public void setServiceNameError(String serviceNameError) {
        this.serviceNameError = serviceNameError;
    }

    public void setPromotionIdError(String promotionIdError) {
        this.promotionIdError = promotionIdError;
    }

    public void setShortDescriptionError(String shortDescriptionError) {
        this.shortDescriptionError = shortDescriptionError;
    }

    public void setLongDescriptionError(String longDescriptionError) {
        this.longDescriptionError = longDescriptionError;
    }

    public void setPriceError(String priceError) {
        this.priceError = priceError;
    }

    public void setImageError(String imageError) {
        this.imageError = imageError;
    }
    

    
}
