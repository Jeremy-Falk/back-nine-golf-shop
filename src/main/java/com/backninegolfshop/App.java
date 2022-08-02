package com.backninegolfshop;

import com.backninegolfshop.dao.JdbcGolfClubDao;
import com.backninegolfshop.dao.GolfClubDao;
import org.apache.commons.dbcp2.BasicDataSource;

import javax.sql.DataSource;

public class App {
    private final GolfClubDao golfClubDao;

    public static void main(String[] args) {
            BasicDataSource dataSource = new BasicDataSource();
            dataSource.setUrl("jdbc:postgresql://localhost:5432/BackNineGolf");
            dataSource.setUsername("postgres");
            dataSource.setPassword("postgres1");
    }

    public App(DataSource dataSource) {
        golfClubDao = new JdbcGolfClubDao(dataSource);
    }
}
