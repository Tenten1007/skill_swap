package com.springboot.model;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "rating")
public class Rating {

    @Id
    @GeneratedValue
    private int id;

    @ManyToOne
    @JoinColumn(name = "rater_id")
    private User rater;

    @ManyToOne
    @JoinColumn(name = "ratee_id")
    private User ratee;

    @ManyToOne
    @JoinColumn(name = "swap_match_id")
    private SwapMatch swapMatch;

    @Column(nullable = false)
    private int score;

    @Column(length = 1000)
    private String comment;

    @Column(name = "created_at", nullable = false)
    private LocalDateTime createdAt;

    // Constructors
    public Rating() {}

    public Rating(int id, User rater, User ratee, SwapMatch swapMatch, int score, String comment,
                  LocalDateTime createdAt) {
        this.id = id;
        this.rater = rater;
        this.ratee = ratee;
        this.swapMatch = swapMatch;
        this.score = score;
        this.comment = comment;
        this.createdAt = createdAt;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getRater() {
        return rater;
    }

    public void setRater(User rater) {
        this.rater = rater;
    }

    public User getRatee() {
        return ratee;
    }

    public void setRatee(User ratee) {
        this.ratee = ratee;
    }

    public SwapMatch getSwapMatch() {
        return swapMatch;
    }

    public void setSwapMatch(SwapMatch swapMatch) {
        this.swapMatch = swapMatch;
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