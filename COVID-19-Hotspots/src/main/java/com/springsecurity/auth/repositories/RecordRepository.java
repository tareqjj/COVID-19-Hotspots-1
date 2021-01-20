package com.springsecurity.auth.repositories;

import com.springsecurity.auth.models.OfficialRecord;
import org.springframework.data.repository.CrudRepository;

public interface RecordRepository extends CrudRepository<OfficialRecord, Long> {
}
