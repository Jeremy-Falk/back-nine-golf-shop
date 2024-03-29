package com.backninegolfshop.Model;

import java.math.BigDecimal;

public class GolfClub {
    private int saleId;
    private int manufacturerId;
    private int modelId;
    private int club_type_id;
    private int serialNumber;
    private String status;
    private BigDecimal price;
    private String condition;

    //Default Constructor that takes no arguments
    public GolfClub() {

    }

    //Full Argument Constructor
    public GolfClub(int saleId, int manufacturerId, int modelId, int club_type_id, int serialNumber, String status, BigDecimal price, String condition) {
        this.saleId = saleId;
        this.manufacturerId = manufacturerId;
        this.modelId = modelId;
        this.club_type_id = club_type_id;
        this.serialNumber = serialNumber;
        this.status = status;
        this.price = price;
        this.condition = condition;
    }

    public int getSaleId() {
        return saleId;
    }

    public void setSaleId(int saleId) {
        this.saleId = saleId;
    }

    public int getManufacturerId() {
        return manufacturerId;
    }

    public void setManufacturerId(int manufacturerId) {
        this.manufacturerId = manufacturerId;
    }

    public int getModelId() {
        return modelId;
    }

    public void setModelId(int modelId) {
        this.modelId = modelId;
    }

    public int getClub_type_id() {
        return club_type_id;
    }

    public void setClub_type_id(int club_type_id) {
        this.club_type_id = club_type_id;
    }

    public int getSerialNumber() {
        return serialNumber;
    }

    public void setSerialNumber(int serialNumber) {
        this.serialNumber = serialNumber;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getCondition() {
        return condition;
    }

    public void setCondition(String condition) {
        this.condition = condition;
    }
}
