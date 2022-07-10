package com.backninegolfshop.dao;

import com.backninegolfshop.Model.SaleItem;

import java.util.List;

public interface SaleItemDao {
    public List<SaleItem> getAllSaleItems();

    public List<SaleItem> searchSaleItemsByMfg(int manufacturerId);

    public List<SaleItem> searchSaleItemsByModelId(int modelId);

    public List<SaleItem> searchSaleItemsByClubType(int club_type_id);

    public List<SaleItem> filterByStatus(String status);

    //search by price?? Search by range? Less Than or Greater than Value?
}
