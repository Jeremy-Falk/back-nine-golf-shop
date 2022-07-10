package com.backninegolfshop.Model;

import java.math.BigDecimal;
import java.util.List;

public class Putter extends SaleItem{
    private List<String> faceBalance;

    public Putter(int saleId, int manufacturerId, int modelId, int club_type_id, int serialNumber, String status, BigDecimal price, List<String> faceBalance) {
        super(saleId, manufacturerId, modelId, club_type_id, serialNumber, status, price);
        this.faceBalance = faceBalance;
    }

    public List<String> getFaceBalance() {
        return faceBalance;
    }

    public void setFaceBalance(List<String> faceBalance) {
        this.faceBalance = faceBalance;
    }
}
