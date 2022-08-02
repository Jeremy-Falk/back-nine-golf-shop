package com.backninegolfshop.Services;

import com.backninegolfshop.dao.GolfClubDao;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class GolfClubService {

    private final GolfClubDao golfClubDao;

    //Constructor Injection
    public GolfClubService (GolfClubDao golfClubDao) {
         this.golfClubDao = golfClubDao;
    }


}
