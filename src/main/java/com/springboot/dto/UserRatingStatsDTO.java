package com.springboot.dto;

public class UserRatingStatsDTO {

    private int userId;
    private String username;
    private String fullName;
    private double averageRating;  // คะแนนเฉลี่ย
    private long totalReviews;     // จำนวนรีวิวทั้งหมด

    // Constructors
    public UserRatingStatsDTO() {}

    public UserRatingStatsDTO(int userId, String username, String fullName, 
                              double averageRating, long totalReviews) {
        this.userId = userId;
        this.username = username;
        this.fullName = fullName;
        this.averageRating = averageRating;
        this.totalReviews = totalReviews;
    }

    // Getters and Setters
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
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

    public double getAverageRating() {
        return averageRating;
    }

    public void setAverageRating(double averageRating) {
        this.averageRating = averageRating;
    }

    public long getTotalReviews() {
        return totalReviews;
    }

    public void setTotalReviews(long totalReviews) {
        this.totalReviews = totalReviews;
    }
}