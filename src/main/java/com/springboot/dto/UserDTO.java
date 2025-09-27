package com.springboot.dto;

import java.time.LocalDateTime;

/**
 * DTO for public user information
 * Used in: Home feed, Public profiles, Skill offers display
 * Security: Excludes sensitive data like password, email, phone
 */
public class UserDTO {

    private int id;
    private String username;
    private String fullName;
    private String profileImage;
    private String bio;
    private String location;
    private LocalDateTime createdAt;

    // Constructors
    public UserDTO() {}

    public UserDTO(int id, String username, String fullName, String profileImage,
                   String bio, String location, LocalDateTime createdAt) {
        this.id = id;
        this.username = username;
        this.fullName = fullName;
        this.profileImage = profileImage;
        this.bio = bio;
        this.location = location;
        this.createdAt = createdAt;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getProfileImage() {
        return profileImage;
    }

    public void setProfileImage(String profileImage) {
        this.profileImage = profileImage;
    }

    public String getBio() {
        return bio;
    }

    public void setBio(String bio) {
        this.bio = bio;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    // Helper method for initials (like User entity)
    public String getInitials() {
        if (fullName == null || fullName.isEmpty()) {
            return username != null && !username.isEmpty() ?
                   username.substring(0, 1).toUpperCase() : "?";
        }

        String[] parts = fullName.split(" ");
        String initials = "";
        for (String part : parts) {
            if (!part.isEmpty()) {
                initials += part.charAt(0);
                if (initials.length() >= 2) break;
            }
        }
        return initials.toUpperCase();
    }
}