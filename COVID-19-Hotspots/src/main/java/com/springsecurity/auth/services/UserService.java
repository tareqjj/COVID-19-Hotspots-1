package com.springsecurity.auth.services;

import com.springsecurity.auth.models.Role;
import com.springsecurity.auth.models.User;
import com.springsecurity.auth.repositories.RoleRepository;
import com.springsecurity.auth.repositories.UserRepository;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    public UserService(UserRepository userRepository, RoleRepository roleRepository, BCryptPasswordEncoder bCryptPasswordEncoder)     {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    }
    public void saveUser(User user, String role) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setRoles(roleRepository.findByName(role));
        userRepository.save(user);
    }

    public void updateLastSignIn(User user) {
        user.setLastSignIn(new Date());
        userRepository.save(user);
    }

    public void addUserRole(User user, String role) {
        List<Role> roleList = user.getRoles();
        roleList.addAll(roleRepository.findByName(role));
        user.setRoles(roleList);
        userRepository.save(user);
    }

    public void removeUserRole(User user, String role) {
        List<Role> roleList = user.getRoles();
        roleList.removeAll(roleRepository.findByName(role));
        user.setRoles(roleList);
        userRepository.save(user);
    }

    public List<User> allUsers() {
        return userRepository.findAll();
    }

    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    public User findUserById(Long id) {
        Optional<User> userToFind = userRepository.findById(id);
        return userToFind.orElse(null);
    }

    public void deleteUserById(Long id) {
        userRepository.deleteById(id);
    }

    public List<Role> findRoleOfUser(User user) {
        return roleRepository.findByUsersContains(user);
    }

    public List<Role> findRoleByName(String name) {
        return roleRepository.findByName(name);
    }
}
