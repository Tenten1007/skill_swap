package com.springboot.dto;

/**
 * DTO for skill category information
 * Used in: Category dropdowns, Filter lists, Category selection
 * Security: Simple data transfer, no sensitive information
 */
public class SkillCategoryDTO {

    private int id;
    private String categoryName;
    private String description;
    private int skillCount; // Number of skills in this category

    // Constructors
    public SkillCategoryDTO() {}

    public SkillCategoryDTO(int id, String categoryName, String description) {
        this.id = id;
        this.categoryName = categoryName;
        this.description = description;
        this.skillCount = 0;
    }

    public SkillCategoryDTO(int id, String categoryName, String description, int skillCount) {
        this.id = id;
        this.categoryName = categoryName;
        this.description = description;
        this.skillCount = skillCount;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getSkillCount() {
        return skillCount;
    }

    public void setSkillCount(int skillCount) {
        this.skillCount = skillCount;
    }

    // Helper methods
    public String getDisplayName() {
        return categoryName + (skillCount > 0 ? " (" + skillCount + ")" : "");
    }

    public String getCategoryIcon() {
        // Return appropriate icon based on category name
        switch (categoryName != null ? categoryName.toLowerCase() : "") {
            case "โปรแกรมมิ่ง":
            case "เทคโนโลยี":
                return "fas fa-code";
            case "ดีไซน์":
            case "ดิไซน์":
                return "fas fa-paint-brush";
            case "ภาษา":
                return "fas fa-language";
            case "การตลาด":
                return "fas fa-bullhorn";
            case "การเงิน":
                return "fas fa-chart-line";
            case "ดนตรี":
                return "fas fa-music";
            case "กีฬา":
                return "fas fa-running";
            case "การถ่ายภาพ":
                return "fas fa-camera";
            default:
                return "fas fa-tag";
        }
    }
}