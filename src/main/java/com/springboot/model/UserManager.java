package com.springboot.model;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.springboot.repository.UserRepository;

@Component
public class UserManager {

    @Autowired
    private UserRepository userRepository;

    public boolean isLogin(User user) {
        try {
            User user1 = userRepository.findByUsername(user.getUsername()).orElse(null);
            if (user1 != null && user.getPassword().equals(user1.getPassword())) {
                return true;
            } else {
                return false;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public boolean insertUser(User user) {
        try {
            // Set default values for required fields
            if (user.getCreatedAt() == null) {
                user.setCreatedAt(LocalDateTime.now());
            }
            if (user.getEmail() == null) {
                user.setEmail(user.getUsername() + "@skillswap.com");
            }
            if (user.getFirstName() == null) {
                user.setFirstName("User");
            }
            if (user.getLastName() == null) {
                user.setLastName("Member");
            }

            userRepository.save(user);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public User getUserByUsername(String username) {
        try {
            return userRepository.findByUsername(username).orElse(null);
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }

    public List<User> getAllUsers() {
        return userRepository.findAll();
    }
}