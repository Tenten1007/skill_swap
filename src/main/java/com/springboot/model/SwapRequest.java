package com.springboot.model;

import java.time.LocalDateTime;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "swap_requests")
public class SwapRequest {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @JoinColumn(name = "requester_id")
    private User requester; // ผู้ที่ส่งคำขอ

    @ManyToOne
    @JoinColumn(name = "requested_skill_id")
    private SkillOffer requestedSkill; // Skill ที่ต้องการ

    @ManyToOne
    @JoinColumn(name = "offered_skill_id")
    private SkillOffer offeredSkill; // Skill ที่เสนอ

    private String status; // PENDING, ACCEPTED, REJECTED, CANCELLED
    private String message; // ข้อความที่ส่งมากับคำขอ
    private LocalDateTime createdAt;
    private LocalDateTime respondedAt;

    // Constructors
    public SwapRequest() {}

    public SwapRequest(User requester, SkillOffer requestedSkill, SkillOffer offeredSkill, String message) {
        this.requester = requester;
        this.requestedSkill = requestedSkill;
        this.offeredSkill = offeredSkill;
        this.message = message;
        this.status = "PENDING";
        this.createdAt = LocalDateTime.now();
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getRequester() {
        return requester;
    }

    public void setRequester(User requester) {
        this.requester = requester;
    }

    public SkillOffer getRequestedSkill() {
        return requestedSkill;
    }

    public void setRequestedSkill(SkillOffer requestedSkill) {
        this.requestedSkill = requestedSkill;
    }

    public SkillOffer getOfferedSkill() {
        return offeredSkill;
    }

    public void setOfferedSkill(SkillOffer offeredSkill) {
        this.offeredSkill = offeredSkill;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public LocalDateTime getRespondedAt() {
        return respondedAt;
    }

    public void setRespondedAt(LocalDateTime respondedAt) {
        this.respondedAt = respondedAt;
    }

    // Helper methods
    public boolean isPending() {
        return "PENDING".equals(this.status);
    }

    public boolean isAccepted() {
        return "ACCEPTED".equals(this.status);
    }

    public boolean isRejected() {
        return "REJECTED".equals(this.status);
    }

    public boolean isCancelled() {
        return "CANCELLED".equals(this.status);
    }
}