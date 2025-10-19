package com.springboot.model;

import java.time.LocalDateTime;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.springboot.repository.UserRepository;

@Component
public class UserManager {

    private static final Logger log = LoggerFactory.getLogger(UserManager.class);

    @Autowired
    private UserRepository userRepository;

    public boolean isLogin(User user) {
        try {
            User user1 = userRepository.findByUsername(user.getUsername()).orElse(null);
            return user1 != null && user.getPassword().equals(user1.getPassword());
        } catch (Exception ex) {
            log.error("Error during login check for user: {}", user.getUsername(), ex);
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
            log.error("Error inserting user: {}", user.getUsername(), ex);
            return false;
        }
    }

    public User getUserByUsername(String username) {
        try {
            return userRepository.findByUsername(username).orElse(null);
        } catch (Exception ex) {
            log.error("Error retrieving user by username: {}", username, ex);
            return null;
        }
    }

    public User getUserById(int userId) {
        try {
            return userRepository.findById(userId).orElse(null);
        } catch (Exception ex) {
            log.error("Error retrieving user by ID: {}", userId, ex);
            return null;
        }
    }

    public List<User> getAllUsers() {
        return userRepository.findAll();
    }
}