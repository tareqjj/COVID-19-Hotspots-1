package com.springsecurity.auth.services;

import com.springsecurity.auth.models.Location;
import com.springsecurity.auth.models.OfficialRecord;
import com.springsecurity.auth.repositories.LocationRepository;
import com.springsecurity.auth.repositories.RecordRepository;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class MapsService {
    private final LocationRepository locationRepository;
    private final RecordRepository recordRepository;

    public MapsService(LocationRepository locationRepository, RecordRepository recordRepository) {
        this.locationRepository = locationRepository;
        this.recordRepository = recordRepository;
    }
    public List<Location> findAllLocations(){return locationRepository.findAll();}
    public Location createLocations(Location location, Long record_id){
        OfficialRecord record = recordRepository.findById(record_id).orElse(null);
        location.setRecord(record);
        return locationRepository.save(location);
    }
}
