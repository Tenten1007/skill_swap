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
@Table(name = "swap_match")
public class SwapMatch {

    @Id
    @GeneratedValue
    private int id;

    @ManyToOne
    @JoinColumn(name = "offerer_id")
    private User offerer;

    @ManyToOne
    @JoinColumn(name = "requester_id")
    private User requester;

    @ManyToOne
    @JoinColumn(name = "offer_skill_id")
    private SkillOffer offerSkill;

    @ManyToOne
    @JoinColumn(name = "request_skill_id")
    private SkillOffer requestSkill;

    @Column(length = 50, nullable = false)
    private String status;

    @Column(name = "created_at", nullable = false)
    private LocalDateTime createdAt;

    @Column(name = "updated_at")
    private LocalDateTime updatedAt;

    // Constructors
    public SwapMatch() {}

    public SwapMatch(int id, User offerer, User requester, SkillOffer offerSkill, SkillOffer requestSkill,
                     String status, LocalDateTime createdAt, LocalDateTime updatedAt) {
        this.id = id;
        this.offerer = offerer;
        this.requester = requester;
        this.offerSkill = offerSkill;
        this.requestSkill = requestSkill;
        this.status = status;
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

    public User getOfferer() {
        return offerer;
    }

    public void setOfferer(User offerer) {
        this.offerer = offerer;
    }

    public User getRequester() {
        return requester;
    }

    public void setRequester(User requester) {
        this.requester = requester;
    }

    public SkillOffer getOfferSkill() {
        return offerSkill;
    }

    public void setOfferSkill(SkillOffer offerSkill) {
        this.offerSkill = offerSkill;
    }

    public SkillOffer getRequestSkill() {
        return requestSkill;
    }

    public void setRequestSkill(SkillOffer requestSkill) {
        this.requestSkill = requestSkill;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
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
}