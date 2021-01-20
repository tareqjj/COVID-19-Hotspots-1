package com.springsecurity.auth.repositories;

import com.springsecurity.auth.models.Test;
import com.springsecurity.auth.models.User;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface TestRepository extends CrudRepository<Test, Long> {
    List<Test> findAll();
    List<Test> findAllByStatus(String status);
    Test findBySample(Long sample);
    Test findByRecordId(Long id);
    List<Test> findByRecordUser(User user);
}
