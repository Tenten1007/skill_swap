package com.springboot.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.model.User;
import com.springboot.repository.UserRepository;

@Service
public class UserService {

    private static final Logger log = LoggerFactory.getLogger(UserService.class);

    @Autowired
    private UserRepository userRepository;

    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    public Optional<User> getUserById(int id) {
        return userRepository.findById(id);
    }

    public Optional<User> getUserByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    public Optional<User> getUserByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    public List<User> getUsersByLocation(String location) {
        return userRepository.findByLocation(location);
    }

    public User saveUser(User user) {
        if (user.getCreatedAt() == null) {
            user.setCreatedAt(LocalDateTime.now());
        }
        return userRepository.save(user);
    }

    public User updateUser(User user) {
        return userRepository.save(user);
    }

    public void deleteUser(int id) {
        userRepository.deleteById(id);
    }

    public boolean existsByUsername(String username) {
        return userRepository.existsByUsername(username);
    }

    public boolean existsByEmail(String email) {
        return userRepository.existsByEmail(email);
    }

    public boolean validateLogin(String username, String password) {
        Optional<User> user = userRepository.findByUsername(username);
        return user.isPresent() && user.get().getPassword().equals(password);
    }

    // ฟังก์ชันที่ย้ายมาจาก UserManager
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

    public User getUserByUsernameForManager(String username) {
        try {
            return userRepository.findByUsername(username).orElse(null);
        } catch (Exception ex) {
            log.error("Error retrieving user by username: {}", username, ex);
            return null;
        }
    }

    public User getUserByIdForManager(int userId) {
        try {
            return userRepository.findById(userId).orElse(null);
        } catch (Exception ex) {
            log.error("Error retrieving user by ID: {}", userId, ex);
            return null;
        }
    }
}