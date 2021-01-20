package com.springsecurity.auth.repositories;

import com.springsecurity.auth.models.Role;
import com.springsecurity.auth.models.User;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface RoleRepository extends CrudRepository<Role, Long> {
    List<Role> findAll();
    List<Role> findByName(String name);
    List<Role> findByUsersContains(User user);
}
