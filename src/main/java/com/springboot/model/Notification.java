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
@Table(name = "notifications")
public class Notification {

    @Id
    @GeneratedValue
    private int id;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user; // ผู้รับการแจ้งเตือน

    @Column(nullable = false, length = 50)
    private String type; // SWAP_REQUEST, SWAP_ACCEPTED, SWAP_REJECTED, MATCH_CREATED, RATING_RECEIVED, MATCH_COMPLETED

    @Column(nullable = false, length = 500)
    private String message; // ข้อความแจ้งเตือน

    @Column(name = "related_id")
    private Integer relatedId; // ID ที่เกี่ยวข้อง (เช่น swapRequestId, matchId, ratingId)

    @Column(name = "related_type", length = 50)
    private String relatedType; // SWAP_REQUEST, SWAP_MATCH, RATING

    @Column(name = "link_url", length = 255)
    private String linkUrl; // URL ที่จะไปเมื่อคลิก notification

    @Column(name = "is_read", nullable = false)
    private boolean isRead = false; // อ่านแล้วหรือยัง

    @Column(name = "created_at", nullable = false)
    private LocalDateTime createdAt;

    @Column(name = "read_at")
    private LocalDateTime readAt;

    // Constructors
    public Notification() {
        this.createdAt = LocalDateTime.now();
    }

    public Notification(User user, String type, String message, Integer relatedId, String relatedType, String linkUrl) {
        this.user = user;
        this.type = type;
        this.message = message;
        this.relatedId = relatedId;
        this.relatedType = relatedType;
        this.linkUrl = linkUrl;
        this.isRead = false;
        this.createdAt = LocalDateTime.now();
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Integer getRelatedId() {
        return relatedId;
    }

    public void setRelatedId(Integer relatedId) {
        this.relatedId = relatedId;
    }

    public String getRelatedType() {
        return relatedType;
    }

    public void setRelatedType(String relatedType) {
        this.relatedType = relatedType;
    }

    public String getLinkUrl() {
        return linkUrl;
    }

    public void setLinkUrl(String linkUrl) {
        this.linkUrl = linkUrl;
    }

    public boolean isRead() {
        return isRead;
    }

    public void setRead(boolean isRead) {
        this.isRead = isRead;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public LocalDateTime getReadAt() {
        return readAt;
    }

    public void setReadAt(LocalDateTime readAt) {
        this.readAt = readAt;
    }

    // Helper methods
    public void markAsRead() {
        this.isRead = true;
        this.readAt = LocalDateTime.now();
    }

    public boolean isUnread() {
        return !this.isRead;
    }
}
