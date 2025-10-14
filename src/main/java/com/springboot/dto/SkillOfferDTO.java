package com.springboot.dto;

import java.time.LocalDateTime;

/**
 * DTO for skill offer information
 * Used in: Home feed, My offers, Browse skills
 * Security: Excludes full User entity, only includes public user info
 */
public class SkillOfferDTO {

    private int id;
    private String title;
    private String description;
    private String level;
    private String timeCommitment;
    private String location;
    private boolean isActive;
    private LocalDateTime createdAt;

    // User information (public only)
    private Integer userId;
    private String userName;
    private String userFullName;
    private String userProfileImage;
    private String userLocation;

    // Skill information
    private String skillName;
    private String categoryName;

    // Constructors
    public SkillOfferDTO() {}

    public SkillOfferDTO(int id, String title, String description, String level,
                         String timeCommitment, String location, boolean isActive,
                         LocalDateTime createdAt, Integer userId, String userName, String userFullName,
                         String userProfileImage, String userLocation,
                         String skillName, String categoryName) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.level = level;
        this.timeCommitment = timeCommitment;
        this.location = location;
        this.isActive = isActive;
        this.createdAt = createdAt;
        this.userId = userId;
        this.userName = userName;
        this.userFullName = userFullName;
        this.userProfileImage = userProfileImage;
        this.userLocation = userLocation;
        this.skillName = skillName;
        this.categoryName = categoryName;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getTimeCommitment() {
        return timeCommitment;
    }

    public void setTimeCommitment(String timeCommitment) {
        this.timeCommitment = timeCommitment;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean isActive) {
        this.isActive = isActive;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserFullName() {
        return userFullName;
    }

    public void setUserFullName(String userFullName) {
        this.userFullName = userFullName;
    }

    public String getUserProfileImage() {
        return userProfileImage;
    }

    public void setUserProfileImage(String userProfileImage) {
        this.userProfileImage = userProfileImage;
    }

    public String getUserLocation() {
        return userLocation;
    }

    public void setUserLocation(String userLocation) {
        this.userLocation = userLocation;
    }

    public String getSkillName() {
        return skillName;
    }

    public void setSkillName(String skillName) {
        this.skillName = skillName;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    // Helper methods
    public String getFormattedLevel() {
        switch (level != null ? level.toLowerCase() : "") {
            case "beginner":
            case "เริ่มต้น":
                return "🔰 เริ่มต้น";
            case "intermediate":
            case "กลาง":
                return "⚡ กลาง";
            case "advanced":
            case "สูง":
                return "🚀 สูง";
            default:
                return level;
        }
    }

    public String getUserDisplayName() {
        return userFullName != null && !userFullName.isEmpty() ?
               userFullName : userName;
    }

    public String getUserInitials() {
        String displayName = getUserDisplayName();
        if (displayName == null || displayName.isEmpty()) {
            return "?";
        }

        String[] parts = displayName.split(" ");
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