package com.springboot.dto;

import java.time.LocalDateTime;

/**
 * DTO for user profile management
 * Used in: Profile edit, Settings, Account management
 * Security: Includes editable fields but excludes password hash
 */
public class UserProfileDTO {

    private int id;
    private String username;
    private String email;
    private String firstName;
    private String lastName;
    private String profileImage;
    private String bio;
    private String location;
    private String phone;
    private String linkedin;
    private String github;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

    // Constructors
    public UserProfileDTO() {}

    public UserProfileDTO(int id, String username, String email, String firstName,
                          String lastName, String profileImage, String bio,
                          String location, String phone, String linkedin,
                          String github, LocalDateTime createdAt, LocalDateTime updatedAt) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.firstName = firstName;
        this.lastName = lastName;
        this.profileImage = profileImage;
        this.bio = bio;
        this.location = location;
        this.phone = phone;
        this.linkedin = linkedin;
        this.github = github;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getLinkedin() {
        return linkedin;
    }

    public void setLinkedin(String linkedin) {
        this.linkedin = linkedin;
    }

    public String getGithub() {
        return github;
    }

    public void setGithub(String github) {
        this.github = github;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(LocalDateTime updatedAt) {
        this.updatedAt = updatedAt;
    }

    // Helper methods
    public String getFullName() {
        String first = (firstName != null) ? firstName : "";
        String last = (lastName != null) ? lastName : "";
        return (first + " " + last).trim();
    }

    public String getInitials() {
        String initials = "";
        if (firstName != null && !firstName.isEmpty()) {
            initials += firstName.charAt(0);
        }
        if (lastName != null && !lastName.isEmpty()) {
            initials += lastName.charAt(0);
        }
        return initials.toUpperCase();
    }

    public boolean isProfileComplete() {
        return firstName != null && !firstName.isEmpty() &&
               lastName != null && !lastName.isEmpty() &&
               bio != null && !bio.isEmpty() &&
               location != null && !location.isEmpty();
    }
}