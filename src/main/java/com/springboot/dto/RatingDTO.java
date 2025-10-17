package com.springboot.dto;

public class RatingDTO {

    private Integer rateeId;     // คนที่ถูกให้คะแนน
    private Integer score;       // คะแนน 1-5
    private String comment;      // ความคิดเห็น
    private Integer swapMatchId; // ID ของ SwapMatch

    // Constructors
    public RatingDTO() {}

    public RatingDTO(Integer rateeId, Integer score, String comment, Integer swapMatchId) {
        this.rateeId = rateeId;
        this.score = score;
        this.comment = comment;
        this.swapMatchId = swapMatchId;
    }

    // Getters and Setters
    public Integer getRateeId() {
        return rateeId;
    }

    public void setRateeId(Integer rateeId) {
        this.rateeId = rateeId;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Integer getSwapMatchId() {
        return swapMatchId;
    }

    public void setSwapMatchId(Integer swapMatchId) {
        this.swapMatchId = swapMatchId;
    }
}