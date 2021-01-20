package com.springsecurity.auth.repositories;

import com.springsecurity.auth.models.Location;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface LocationRepository extends CrudRepository<Location, Long> {
    List<Location> findAll();
}
