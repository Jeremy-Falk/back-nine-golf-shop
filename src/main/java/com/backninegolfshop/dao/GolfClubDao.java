package com.backninegolfshop.dao;

import com.backninegolfshop.Model.GolfClub;

import java.util.List;

public interface GolfClubDao {

    public List<GolfClub> getAllSaleItems();

    public List<GolfClub> getAllSaleItemsByStatus(String status);

    public GolfClub getGolfClubByID(int saleId);

    public List<GolfClub> searchSaleItemsByMfg(int manufacturerId);

    public List<GolfClub> searchSaleItemsByModelId(int modelId);

    public List<GolfClub> searchSaleItemsByClubType(int club_type_id);

    public List<GolfClub> filterByStatus(String status);

    public GolfClub createGolfClub(GolfClub newGolfClub);

    //search by price?? Search by range? Less Than or Greater than Value?
}
