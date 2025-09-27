package com.springboot.model;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "user")
public class User {

    @Id
    @GeneratedValue
    private int id;

    @Column(length = 50, nullable = false, unique = true)
    private String username;

    @Column(length = 255, nullable = false)
    private String password;

    @Column(length = 100, nullable = false, unique = true)
    private String email;

    @Column(name = "first_name", length = 50, nullable = false)
    private String firstName;

    @Column(name = "last_name", length = 50, nullable = false)
    private String lastName;

    @Column(name = "profile_image", length = 500)
    private String profileImage;

    @Column(length = 1000)
    private String bio;

    @Column(length = 100)
    private String location;

    @Column(length = 20)
    private String phone;

    @Column(length = 200)
    private String linkedin;

    @Column(length = 200)
    private String github;

    @Column(name = "created_at", nullable = false)
    private LocalDateTime createdAt;

    @Column(name = "updated_at")
    private LocalDateTime updatedAt;

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<SkillOffer> skillOffers = new ArrayList<>();

    // Constructors
    public User() {}

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public User(int id, String username, String password, String email, String firstName, String lastName,
                String profileImage, String bio, String location, LocalDateTime createdAt,
                List<SkillOffer> skillOffers) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.firstName = firstName;
        this.lastName = lastName;
        this.profileImage = profileImage;
        this.bio = bio;
        this.location = location;
        this.createdAt = createdAt;
        this.skillOffers = skillOffers;
    }

    // Full constructor with all fields
    public User(int id, String username, String password, String email, String firstName, String lastName,
                String profileImage, String bio, String location, String phone, String linkedin, String github,
                LocalDateTime createdAt, LocalDateTime updatedAt, List<SkillOffer> skillOffers) {
        this.id = id;
        this.username = username;
        this.password = password;
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
        this.skillOffers = skillOffers;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
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

    public List<SkillOffer> getSkillOffers() {
        return skillOffers;
    }

    public void setSkillOffers(List<SkillOffer> skillOffers) {
        this.skillOffers = skillOffers;
    }

    // Helper methods
    public String getFullName() {
        return firstName + " " + lastName;
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
}