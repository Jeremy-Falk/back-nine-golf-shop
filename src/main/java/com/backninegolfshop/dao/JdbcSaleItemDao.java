package com.backninegolfshop.dao;

import com.backninegolfshop.Model.SaleItem;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;



public class JdbcSaleItemDao implements SaleItemDao {

    private final JdbcTemplate jdbcTemplate;

    public JdbcSaleItemDao(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    @Override
    public List<SaleItem> getAllSaleItems() {
        String selectSaleItems = "SELECT sale_id, manufacturer_id, model_id, club_type_id, serial_number, status, price FROM sale_item;";
        SqlRowSet selectRowSet = jdbcTemplate.queryForRowSet(selectSaleItems);
        List<SaleItem> saleItems = new ArrayList<>();
        while (selectRowSet.next()) {
            saleItems.add(mapRowToSaleItem(selectRowSet));
        }
        return saleItems;
    }

    @Override
    public List<SaleItem> searchSaleItemsByMfg(int manufacturerId) {
        String itemsByMfg = "SELECT \n" +
                "\tsale_id, manufacturer_id, model_id, club_type_id, serial_number, status, price \n" +
                "FROM \n" +
                "\tsale_item \n" +
                "WHERE \n" +
                "\tmanufacturer_id = ?";
        SqlRowSet mfgRowSet = jdbcTemplate.queryForRowSet(itemsByMfg, manufacturerId);
        List<SaleItem> mfgItems = new ArrayList<>();
        while (mfgRowSet.next()) {
            mfgItems.add(mapRowToSaleItem(mfgRowSet));
        }
        return mfgItems;
    };

    @Override
    public List<SaleItem> searchSaleItemsByModelId(int modelId) {
        String itemsByModel = "SELECT \n" +
                "\tsale_id, manufacturer_id, model_id, club_type_id, serial_number, status, price \n" +
                "FROM \n" +
                "\t sale_item \n" +
                "WHERE \n" +
                "\t model_id = ?";
        SqlRowSet modelRowSet = jdbcTemplate.queryForRowSet(itemsByModel, modelId);
        List<SaleItem> listOfModels = new ArrayList<>();
        while (modelRowSet.next()) {
            listOfModels.add(mapRowToSaleItem(modelRowSet));
        }
        return listOfModels;
    };

    @Override
    public List<SaleItem> searchSaleItemsByClubType(int club_type_id) {
        String itemsByClubType = "SELECT \n" +
                "\tsale_id, manufacturer_id, model_id, club_type_id, serial_number, status, price \n" +
                "FROM \n" +
                "\t sale_item \n" +
                "WHERE \n" +
                "\t club_type_id = ?";
        SqlRowSet clubTypeRowSet = jdbcTemplate.queryForRowSet(itemsByClubType, club_type_id);
        List<SaleItem> listOfClubTypes = new ArrayList<>();
        while (clubTypeRowSet.next()) {
            listOfClubTypes.add(mapRowToSaleItem(clubTypeRowSet));
        }
        return listOfClubTypes;
    };

    @Override
    public List<SaleItem> filterByStatus(String status) {
        String itemsByClubType = "SELECT \n" +
                "\tsale_id, manufacturer_id, model_id, club_type_id, serial_number, status, price \n" +
                "FROM \n" +
                "\t sale_item \n" +
                "WHERE \n" +
                "\t status = ?";
        SqlRowSet statusRowSet = jdbcTemplate.queryForRowSet(itemsByClubType, status);
        List<SaleItem> listOfItemsByStatus = new ArrayList<>();
        while (statusRowSet.next()) {
            listOfItemsByStatus.add(mapRowToSaleItem(statusRowSet));
        }
        return listOfItemsByStatus;
    }

    private SaleItem mapRowToSaleItem(SqlRowSet rowSet) {
        //sale_id, manufacturer_id, model_id, club_type_id, serial_number,
        // status, price
        SaleItem saleItem = new SaleItem();
        saleItem.setSaleId(rowSet.getInt("sale_id"));
        saleItem.setManufacturerId(rowSet.getInt("manufacturer_id"));
        saleItem.setModelId(rowSet.getInt("model_id"));
        saleItem.setClub_type_id(rowSet.getInt("club_type_id"));
        saleItem.setSerialNumber(rowSet.getInt("serial_number"));
        saleItem.setStatus(rowSet.getString("status"));
        saleItem.setPrice(rowSet.getBigDecimal("price"));
        return saleItem;
    }
}
