package com.springboot.model;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "skill")
public class Skill {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "skill_name", length = 100, nullable = false)
    private String skillName;

    @Column(length = 500)
    private String description;

    @ManyToOne
    @JoinColumn(name = "category_id")
    private SkillCategory category;

    @OneToMany(mappedBy = "skill", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<SkillOffer> skillOffers = new ArrayList<>();

    // Constructors
    public Skill() {}

    public Skill(int id, String skillName, String description, SkillCategory category, List<SkillOffer> skillOffers) {
        this.id = id;
        this.skillName = skillName;
        this.description = description;
        this.category = category;
        this.skillOffers = skillOffers;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSkillName() {
        return skillName;
    }

    public void setSkillName(String skillName) {
        this.skillName = skillName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public SkillCategory getCategory() {
        return category;
    }

    public void setCategory(SkillCategory category) {
        this.category = category;
    }

    public List<SkillOffer> getSkillOffers() {
        return skillOffers;
    }

    public void setSkillOffers(List<SkillOffer> skillOffers) {
        this.skillOffers = skillOffers;
    }
}