package com.backninegolfshop.dao;

import com.backninegolfshop.Model.GolfClub;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class JdbcGolfClubDao implements GolfClubDao {

    private final JdbcTemplate jdbcTemplate;

    public JdbcGolfClubDao(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    @Override
    public List<GolfClub> getAllSaleItems() {
        String selectSaleItems = "SELECT sale_id, manufacturer_id, model_id, club_type_id, serial_number, status, price, " +
                "condition FROM golf_club;";
        SqlRowSet selectRowSet = jdbcTemplate.queryForRowSet(selectSaleItems);
        List<GolfClub> golfClubs = new ArrayList<>();
        while (selectRowSet.next()) {
            golfClubs.add(mapRowToSaleItem(selectRowSet));
        }
        return golfClubs;
    }

    @Override
    public List<GolfClub> getAllSaleItemsByStatus(String status) {
        String selectSaleItems = "SELECT sale_id, manufacturer_id, model_id, club_type_id, serial_number, status, price, " +
                "condition FROM golf_club WHERE status = ?;";
        SqlRowSet selectRowSet = jdbcTemplate.queryForRowSet(selectSaleItems, status);
        List<GolfClub> golfClubs = new ArrayList<>();
        while (selectRowSet.next()) {
            golfClubs.add(mapRowToSaleItem(selectRowSet));
        }
        return golfClubs;
    }

    @Override
    public GolfClub getGolfClubByID(int saleId) {
        String selectGolfClub = "SELECT sale_id, manufacturer_id, model_id, club_type_id, serial_number, status, price, " +
                "condition FROM golf_club WHERE sale_id = ?;";
        SqlRowSet selectRowSet = jdbcTemplate.queryForRowSet(selectGolfClub, saleId);

        if (selectRowSet.next()) {
            return mapRowToSaleItem(selectRowSet);
        } else {
            return null;
        }
    }

    @Override
    public GolfClub createGolfClub(GolfClub newGolfClub) {
        String createClub = "INSERT INTO golf_club(manufacturer_id, model_id, club_type_id, serial_number, status, price, condition)" +
                "VALUES(?, '?, ?, ?, ?, ?, ?) RETURNING sale_id";
        int newGolfClubID = jdbcTemplate.update(createClub, Integer.class, newGolfClub.getManufacturerId(), newGolfClub.getModelId(),
                newGolfClub.getClub_type_id(), newGolfClub.getSerialNumber(), newGolfClub.getStatus(), newGolfClub.getPrice(),
                newGolfClub.getCondition());
        return getGolfClubByID(newGolfClubID);
    }

    // TODO: Remove N and extra chars
    @Override
    public List<GolfClub> searchSaleItemsByMfg(int manufacturerId) {
        String itemsByMfg = "SELECT " +
                "sale_id, manufacturer_id, model_id, club_type_id, serial_number, status, price, condition " +
                "FROM " +
                "golf_club " +
                "WHERE " +
                "manufacturer_id = ?";
        SqlRowSet mfgRowSet = jdbcTemplate.queryForRowSet(itemsByMfg, manufacturerId);
        List<GolfClub> mfgItems = new ArrayList<>();
        while (mfgRowSet.next()) {
            mfgItems.add(mapRowToSaleItem(mfgRowSet));
        }
        return mfgItems;
    };

    @Override
    public List<GolfClub> searchSaleItemsByModelId(int modelId) {
        String itemsByModel = "SELECT " +
                "sale_id, manufacturer_id, model_id, club_type_id, serial_number, status, price, condition " +
                "FROM " +
                "golf_club " +
                "WHERE " +
                "model_id = ?";
        SqlRowSet modelRowSet = jdbcTemplate.queryForRowSet(itemsByModel, modelId);
        List<GolfClub> listOfModels = new ArrayList<>();
        while (modelRowSet.next()) {
            listOfModels.add(mapRowToSaleItem(modelRowSet));
        }
        return listOfModels;
    };

    @Override
    public List<GolfClub> searchSaleItemsByClubType(int club_type_id) {
        String itemsByClubType = "SELECT " +
                "sale_id, manufacturer_id, model_id, club_type_id, serial_number, status, price, condition " +
                "FROM " +
                "golf_club " +
                "WHERE " +
                "club_type_id = ?";
        SqlRowSet clubTypeRowSet = jdbcTemplate.queryForRowSet(itemsByClubType, club_type_id);
        List<GolfClub> listOfClubTypes = new ArrayList<>();
        while (clubTypeRowSet.next()) {
            listOfClubTypes.add(mapRowToSaleItem(clubTypeRowSet));
        }
        return listOfClubTypes;
    };

    @Override
    public List<GolfClub> filterByStatus(String status) {
        String itemsByClubType = "SELECT " +
                "sale_id, manufacturer_id, model_id, club_type_id, serial_number, status, price, condition " +
                "FROM " +
                "golf_club " +
                "WHERE " +
                "status = ?";
        SqlRowSet statusRowSet = jdbcTemplate.queryForRowSet(itemsByClubType, status);
        List<GolfClub> listOfItemsByStatus = new ArrayList<>();
        while (statusRowSet.next()) {
            listOfItemsByStatus.add(mapRowToSaleItem(statusRowSet));
        }
        return listOfItemsByStatus;
    }

    private GolfClub mapRowToSaleItem(SqlRowSet rowSet) {
        //sale_id, manufacturer_id, model_id, club_type_id, serial_number,
        // status, price
        GolfClub golfClub = new GolfClub();
        golfClub.setSaleId(rowSet.getInt("sale_id"));
        golfClub.setManufacturerId(rowSet.getInt("manufacturer_id"));
        golfClub.setModelId(rowSet.getInt("model_id"));
        golfClub.setClub_type_id(rowSet.getInt("club_type_id"));
        golfClub.setSerialNumber(rowSet.getInt("serial_number"));
        golfClub.setStatus(rowSet.getString("status"));
        golfClub.setPrice(rowSet.getBigDecimal("price"));
        golfClub.setCondition((rowSet.getString("condition")));
        return golfClub;
    }

    //    @Override
//    public Project createProject(Project newProject) {
//
//        String createProject = "INSERT INTO project(name, from_date, to_date) VALUES(?, ?, ?) RETURNING project_id;";
//        int newProjectID = jdbcTemplate.queryForObject(createProject, Integer.class, newProject.getName(), newProject.getFromDate(), newProject.getToDate());
//
//        return getProject(newProjectID);
//    }

}
