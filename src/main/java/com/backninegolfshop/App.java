package com.backninegolfshop;

import com.backninegolfshop.dao.JdbcSaleItemDao;
import com.backninegolfshop.dao.SaleItemDao;
import org.apache.commons.dbcp2.BasicDataSource;

import javax.sql.DataSource;

public class App {
    private final SaleItemDao saleItemDao;

    public static void main(String[] args) {
            BasicDataSource dataSource = new BasicDataSource();
            dataSource.setUrl("jdbc:postgresql://localhost:5432/BackNineGolf");
            dataSource.setUsername("postgres");
            dataSource.setPassword("postgres1");
    }

    public App(DataSource dataSource) {
        saleItemDao = new JdbcSaleItemDao(dataSource);
    }
}
