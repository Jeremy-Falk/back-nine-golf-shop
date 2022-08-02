package com.backninegolfshop.Model;

import java.math.BigDecimal;
import java.util.List;

public class Putter extends GolfClub {
    private List<String> faceBalance;
    private String putterType;

    public Putter(int saleId, int manufacturerId, int modelId, int club_type_id, int serialNumber, String status,
                  BigDecimal price, String condition, List<String> faceBalance, String putterType) {
        super(saleId, manufacturerId, modelId, club_type_id, serialNumber, status, price, condition);
        this.faceBalance = faceBalance;
        this.putterType = putterType;
    }

    public List<String> getFaceBalance() {
        return faceBalance;
    }

    public void setFaceBalance(List<String> faceBalance) {
        this.faceBalance = faceBalance;
    }

    public String getPutterType() {
        return putterType;
    }

    public void setPutterType(String putterType) {
        this.putterType = putterType;
    }
}
