package com.springboot.dto;

import java.time.LocalDateTime;

public class ReviewDTO {

    private String raterName;      // ชื่อคนให้คะแนน
    private int score;             // คะแนน
    private String comment;        // ความคิดเห็น
    private LocalDateTime createdAt; // วันที่ให้คะแนน

    // Constructors
    public ReviewDTO() {}

    public ReviewDTO(String raterName, int score, String comment, LocalDateTime createdAt) {
        this.raterName = raterName;
        this.score = score;
        this.comment = comment;
        this.createdAt = createdAt;
    }

    // Getters and Setters
    public String getRaterName() {
        return raterName;
    }

    public void setRaterName(String raterName) {
        this.raterName = raterName;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }
}