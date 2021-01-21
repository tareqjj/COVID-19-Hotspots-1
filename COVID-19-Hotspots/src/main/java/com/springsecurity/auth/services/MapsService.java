package com.springsecurity.auth.services;

import com.springsecurity.auth.models.Location;
import com.springsecurity.auth.models.OfficialRecord;
import com.springsecurity.auth.models.Test;
import com.springsecurity.auth.repositories.LocationRepository;
import com.springsecurity.auth.repositories.RecordRepository;
import com.springsecurity.auth.repositories.TestRepository;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class MapsService {
    private final LocationRepository locationRepository;
    private final RecordRepository recordRepository;
    private final TestRepository testRepository;

    public MapsService(LocationRepository locationRepository, RecordRepository recordRepository, TestRepository testRepository) {
        this.locationRepository = locationRepository;
        this.recordRepository = recordRepository;
        this.testRepository = testRepository;
    }

    public List<Location> findAllLocations(){return locationRepository.findAll();}

    public Location createLocations(Location location, Long record_id, Test test){
        location.setTest(test);
        OfficialRecord record = recordRepository.findById(record_id).orElse(null);
        location.getTest().setRecord(record);
        return locationRepository.save(location);
    }
}
